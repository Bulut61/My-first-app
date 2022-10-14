import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt/presentation/pages/homePages/confirm_task_page.dart';
import 'package:projekt/presentation/pages/homePages/pocket_money_page.dart';
import 'package:projekt/presentation/pages/homePages/shopping_list_page.dart';
import 'package:projekt/presentation/routes/app_router.gr.dart';
import 'package:projekt/presentation/widgets/custom_button.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
          "Family App",
          style: themeData.textTheme.headline1,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 80),
          CustomButton(
              onPressed: () {
                AutoRouter.of(context).push(TaskPageRoute());
                //print(AutoRouter.of(context).stack);
              },
              text: "Create Task",
              buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
          CustomButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const ShoppingListPage(),
                    ));
              },
              text: "Shopping list",
              buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
          CustomButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const ConfirmTaskPage(),
                    ));
              },
              text: "Confirm Task",
              buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
          CustomButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const PocketMoneyPage(),
                    ));
              },
              text: "Pocket Money",
              buttonColor: themeData.colorScheme.primary),
        ],
      ),
    );
  }
}
