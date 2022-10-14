import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConfirmTaskPage extends StatefulWidget {
  const ConfirmTaskPage({super.key});

  @override
  State<ConfirmTaskPage> createState() => _ConfirmTaskPageState();
}

class _ConfirmTaskPageState extends State<ConfirmTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Task"),
        centerTitle: true,
      ),
      body: Column(children: [
        SizedBox(height: 30),
        //TODO After getting a List with with the tasks listview with checkbox to confirm points and delete from list
      ]),
    );
  }
}
