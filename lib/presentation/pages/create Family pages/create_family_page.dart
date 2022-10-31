import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/presentation/pages/homePages/confirm_task_page.dart';
import 'package:projekt/presentation/pages/homePages/pocket_money_page.dart';
import 'package:projekt/presentation/pages/homePages/shopping_list_page.dart';
import 'package:projekt/presentation/routes/app_router.gr.dart';
import 'package:projekt/presentation/widgets/custom_button.dart';

class CreateFamilyPage extends StatefulWidget {
  const CreateFamilyPage({super.key});

  @override
  State<CreateFamilyPage> createState() => _CreateFamilyPageState();
}

class _CreateFamilyPageState extends State<CreateFamilyPage> {
  TextEditingController _familyNameController = TextEditingController();

  void dispose() {
    _familyNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.router.replace(SignInPageRoute());
              },
              icon: Icon(Icons.logout, semanticLabel: "log out"))
        ],
        centerTitle: true,
        title: Text(
          "Create or join Family",
          style: themeData.textTheme.headline1,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 80),
          CustomButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Family name"),
                    content: TextFormField(
                      controller: _familyNameController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("cancel")),
                      TextButton(
                          onPressed: () {
                            if (_familyNameController.text.length < 2) {
                              showDialog(
                                  context: context,
                                  builder: ((context) => AlertDialog(
                                          title: Text(
                                        "Family name to short!!! atleast 2 characters",
                                        style: TextStyle(fontSize: 12, color: Colors.red),
                                      ))));
                            }
                          },
                          child: Text("ok"))
                    ],
                  ),
                );
              },
              text: "Create Family",
              buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
          CustomButton(onPressed: () {}, text: "Join Family", buttonColor: themeData.colorScheme.primary),
        ],
      ),
    );
  }
}
