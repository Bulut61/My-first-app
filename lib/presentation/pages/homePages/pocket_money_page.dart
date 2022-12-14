import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/family_classes/fam_member.dart';
import 'package:projekt/services/user_service.dart';

class PocketMoneyPage extends StatefulWidget {
  const PocketMoneyPage({super.key});

  @override
  State<PocketMoneyPage> createState() => _PocketMoneyPageState();
}

class _PocketMoneyPageState extends State<PocketMoneyPage> {
  List<FamMember>? childs;
  void initState() {
    if (UsersService.loadedstatus.value) {
      childs = UsersService.family!.childs; //new List.from(UsersService.family!.parents)..addAll(UsersService.family!.childs);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    ValueNotifier<int> fixedMoney = ValueNotifier<int>(0);
    ValueNotifier<int> bonusMoney = ValueNotifier<int>(0);
    ValueNotifier<int> goal = ValueNotifier<int>(0);
    fixedMoney = ValueNotifier<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pocket Money"),
        centerTitle: true,
      ),
      body: ListView(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "Fixed pocketmoney:",
                style: TextStyle(fontSize: 18, color: themeData.colorScheme.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 80),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    fixedMoney.value = int.parse(value);
                    //print(fixedMoney.value);
                  },
                  decoration: new InputDecoration(labelText: "Amount", hintText: "Only digits"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "Bonus pocketmoney:",
                style: TextStyle(fontSize: 18, color: themeData.colorScheme.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 80),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    bonusMoney.value = int.parse(value);
                    //print(bonusMoney.value);
                  },
                  decoration: new InputDecoration(labelText: "Amount", hintText: "Only digits"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "Set weekly goal:",
                style: TextStyle(fontSize: 18, color: themeData.colorScheme.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 80),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    goal.value = int.parse(value);
                    setGoal(goal.value);
                    //print(fixedMoney.value);
                  },
                  decoration: new InputDecoration(labelText: "Points", hintText: "Only digits"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        childWithPocketmoneyView(true, "Child: ", ""),
        /*Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ValueListenableBuilder<int>(
                  valueListenable: fixedMoney,
                  builder: (BuildContext context, int value, Widget? child) {
                    return Text(
                      "${value}",
                      style: TextStyle(fontSize: 18),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ValueListenableBuilder<int>(
                  valueListenable: bonusMoney,
                  builder: (BuildContext context, int value, Widget? child) {
                    return Text(
                      "${value}",
                      style: TextStyle(fontSize: 18),
                    );
                  }),
            ),
          ],
        ),*/
        UsersService.loadedstatus.value
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: childs!.length,
                //padding: const EdgeInsets.all(8.0),
                itemBuilder: (ctx, i) {
                  FamMember child = childs![i];
                  return childWithPocketmoneyView(false, child.firstName, child.lastName); /*Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: childs![i].firstName.trim() == UsersService.member!.firstName.trim() ? Colors.black : Colors.purple, //Colors.purple,
                      ),
                      title: Text(member.firstName),
                      subtitle: Text(member.lastName),
                      //subtitle: Text('Points: ${task.points}'),
                    ),
                  );*/
                },
              )
            : Text("Loading..."),
      ]),
    );
  }

  setGoal(int points) {
    String familyId = UsersService.family!.getFamilyId().toString().trim();
    DocumentReference<Map<String, dynamic>> doc = FirebaseFirestore.instance.collection('family').doc(familyId);
    doc.update({'weeklygoal': points}).then((value) => print("DocumentSnapshot 'weeklygoal' successfully updated!"), onError: (e) => print("Error updating document $e"));
  }

  Widget childWithPocketmoneyView(bool descriptionLine, String rowLeading, String rowforth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.66,
            height: 32,
            color: Colors.amber,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "${rowLeading}",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.10,
            height: 32,
            color: Colors.pink,
            child: descriptionLine ? Icon(Icons.access_time_filled_outlined) : Text(""),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.10,
            height: 32,
            color: Colors.deepOrange,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.10,
            height: 32,
            color: Colors.green,
            alignment: Alignment.center,
            child: descriptionLine
                ? Icon(Icons.assignment_turned_in_sharp)
                : Text(
                    "${rowforth}",
                    style: TextStyle(color: Colors.black),
                  ),
          ),
        ],
      ),
    );
  }
}
