import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/family_classes/Child.dart';
import 'package:projekt/family_classes/fam_member.dart';
import 'package:projekt/services/user_service.dart';

class PocketMoneyPage extends StatefulWidget {
  const PocketMoneyPage({super.key});

  @override
  State<PocketMoneyPage> createState() => _PocketMoneyPageState();
}

class _PocketMoneyPageState extends State<PocketMoneyPage> {
  List<Child>? childs;
  ValueNotifier<int> goal = ValueNotifier<int>(0);
  ValueNotifier<int> fixedMoney = ValueNotifier<int>(0);
  ValueNotifier<int> bonusMoney = ValueNotifier<int>(0);
  ValueNotifier<int> diff = ValueNotifier<int>(0);
  ValueNotifier<int> earnedMoney = ValueNotifier<int>(0);
  void initState() {
    if (UsersService.loadedstatus.value) {
      childs = UsersService.family!.childs;
      goal.value = (UsersService.family?.getWeeklyGoal() == null) ? 0 : UsersService.family?.getWeeklyGoal();
      fixedMoney.value = (UsersService.family?.getFixedMoney() == null) ? 0 : UsersService.family?.getFixedMoney();
      bonusMoney.value = (UsersService.family?.getBonusMoney() == null) ? 0 : UsersService.family?.getBonusMoney();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
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
                  initialValue: fixedMoney.value.toString(),
                  onFieldSubmitted: (value) {
                    fixedMoney.value = int.parse(value);
                    setFixedMoney(fixedMoney.value);
                    setState(() {});
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
                  initialValue: bonusMoney.value.toString(),
                  onFieldSubmitted: (value) {
                    bonusMoney.value = int.parse(value);
                    setBonusMoney(bonusMoney.value);
                    setState(() {});
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
                  initialValue: goal.value.toString(),
                  onFieldSubmitted: (value) {
                    goal.value = int.parse(value);
                    setGoal(goal.value);
                    setState(() {});
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
        UsersService.loadedstatus.value
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: childs!.length,
                //padding: const EdgeInsets.all(8.0),
                itemBuilder: (ctx, i) {
                  Child child = childs![i];
                  return childWithPocketmoneyView(false, child.firstName, child.getCurrentPoints().toString());
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

  setFixedMoney(int points) {
    String familyId = UsersService.family!.getFamilyId().toString().trim();
    DocumentReference<Map<String, dynamic>> doc = FirebaseFirestore.instance.collection('family').doc(familyId);
    doc.update({'fixedmoney': points}).then((value) => print("DocumentSnapshot 'fixedmoney' successfully updated!"), onError: (e) => print("Error updating document $e"));
  }

  setBonusMoney(int points) {
    String familyId = UsersService.family!.getFamilyId().toString().trim();
    DocumentReference<Map<String, dynamic>> doc = FirebaseFirestore.instance.collection('family').doc(familyId);
    doc.update({'bonusmoney': points}).then((value) => print("DocumentSnapshot 'bonusmoney' successfully updated!"), onError: (e) => print("Error updating document $e"));
  }

  Widget childWithPocketmoneyView(bool descriptionLine, String rowLeading, String rowforth) {
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: descriptionLine ? EdgeInsets.symmetric(vertical: 10, horizontal: 10) : const EdgeInsets.symmetric(horizontal: 10),
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
            color: Color.fromARGB(255, 76, 185, 88),
            alignment: Alignment.center,
            child: descriptionLine
                ? Icon(
                    Icons.attach_money_outlined,
                    color: Colors.white,
                  )
                : Text(moneyToPay(int.parse(rowforth))),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.10,
            height: 32,
            color: Color.fromARGB(255, 76, 107, 185),
            alignment: Alignment.center,
            child: descriptionLine
                ? Icon(
                    Icons.difference,
                    color: Colors.white,
                  )
                : Text(difference(int.parse(rowforth))),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.10,
            height: 32,
            color: themeData.colorScheme.primary,
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

  String moneyToPay(int points) {
    return (0 >= int.parse(difference(points))) ? fixedMoney.value.toString() : (fixedMoney.value + bonusMoney.value).toString();
  }

  String difference(int points) {
    return (points - goal.value).toString();
  }
}
