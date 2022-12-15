import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/family_classes/item.dart';
import 'package:projekt/services/user_service.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  List<Item>? items;

  void initState() {
    super.initState();

    String familyId = UsersService.family!.getFamilyId().toString().trim(); // UsersService.family.getFamilyId();

    FirebaseFirestore.instance.collection('family').doc(familyId).collection('item').snapshots().listen((event) {
      items = [];
      for (var element in event.docs) {
        items!.add(Item.fromSnapshot(element));
      }
      setState(() {});
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedvalue = "";
  bool b = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
        centerTitle: true,
      ),
      body: ListView(children: [
        SizedBox(height: 30),
        Center(
            child: SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    onPressed: () async {
                      await showInformationDialog(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.add), SizedBox(width: 5), Text('Add Item')],
                    )))),
        SizedBox(height: 20),
        items == null || !UsersService.loadedstatus.value
            ? Text('Loading...')
            : ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  Item item = items![i];
                  return Card(
                    child: CheckboxListTile(
                      title: Text(item.item),
                      onChanged: (bool? value) {
                        item.buyed = (value!);
                        deleteItem(item.itemId);
                        setState(() {});
                      },
                      value: item.buyed,
                    ),
                  );
                },
                itemCount: items!.length,
              )
      ]),
    );
  }

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textEditingController = TextEditingController();
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          //return value!.isNotEmpty ? null : "Invalid Field";
                          if (value!.isNotEmpty) {
                            addItem(value);
                            return null;
                          } else {
                            return "invalid Field";
                          }
                        },
                        decoration: InputDecoration(hintText: "Name of Item"),
                      ),
                    ],
                  )),
              actions: <Widget>[
                TextButton(
                  child: Text('Okay'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Item item = Item(
                        item: _textEditingController.text,
                        buyed: false,
                        required: false,
                      );
                      await createItem(item);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  Future addItem(String itemName) async {
    await FirebaseFirestore.instance.collection('items').add({
      'item name': itemName,
      'buyed': false,
      'required': false,
    });
  }

  Future createItem(Item item) async {
    DocumentReference<Map<String, dynamic>> doc;
    String famId = "";
    famId = UsersService.getFamily().getFamilyId();
    doc = await FirebaseFirestore.instance.collection("family").doc(famId);
    await doc.collection("item").add(item.getData());
  }

  Future deleteItem(String itemId) async {
    DocumentReference<Map<String, dynamic>> doc;
    String famId = "";
    famId = UsersService.getFamily().getFamilyId();
    doc = await FirebaseFirestore.instance.collection("family").doc(famId);
    await doc.collection('item').doc(itemId).delete();
  }
}
