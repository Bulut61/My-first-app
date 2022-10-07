import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/custom_button.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
        centerTitle: true,
      ),
      body: Column(children: [
        SizedBox(height: 30),
        Center(
            child: SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                child: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(labelText: "Task required"),
                                  keyboardType: TextInputType.text,
                                ),
                              ],
                            ));
                          });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.add), SizedBox(width: 5), Text('Add Task')],
                    ))))
        /*CustomButton(
          onPressed: () {},
          text: 'Add Text',
          buttonColor: Theme.of(context).colorScheme.primary,
        ),*/
      ]),
    );
  }
}
