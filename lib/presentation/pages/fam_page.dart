import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/family_classes/fam_member.dart';
import 'package:projekt/services/user_service.dart';

class FamPage extends StatefulWidget {
  const FamPage({super.key});

  @override
  State<FamPage> createState() => _FamPageState();
}

class _FamPageState extends State<FamPage> {
  List<FamMember>? members;

  void initState() {
    if (UsersService.loadedstatus.value) {
      members = new List.from(UsersService.family!.parents)..addAll(UsersService.family!.childs);
    }
  }

  @override
  Widget build(BuildContext context) {
    return members == null || !UsersService.loadedstatus.value
        ? Text('Loading...')
        : Scaffold(
            appBar: AppBar(title: Text("My Family"), centerTitle: true),
            body: Column(
              children: [
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Family ID: ",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    SelectableText(
                      "${UsersService.family!.getFamilyId()}",
                      style: TextStyle(color: Colors.purple, fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                      itemBuilder: (ctx, i) {
                        FamMember member = members![i];
                        return Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: members![i].firstName.trim() == UsersService.member!.firstName.trim() ? Colors.black : Colors.purple, //Colors.purple,
                            ),
                            title: Text(member.firstName),
                            subtitle: Text(member.lastName),
                            //subtitle: Text('Points: ${task.points}'),
                          ),
                        );
                      },
                      itemCount: members!.length),
                ),
              ],
            ),
          );
  }
}
