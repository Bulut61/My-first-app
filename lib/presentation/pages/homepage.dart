import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
          CustomButton(onPressed: () {}, text: "Shopping list", buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
          CustomButton(onPressed: () {}, text: "Confirm Task", buttonColor: themeData.colorScheme.primary),
          SizedBox(height: 50),
          CustomButton(onPressed: () {}, text: "Pocket Money", buttonColor: themeData.colorScheme.primary),
        ],
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: themeData.appBarTheme.color,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: themeData.bottomAppBarColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.family_restroom, color: themeData.bottomAppBarColor),
            label: 'Fam',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month, color: themeData.bottomAppBarColor),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_rounded, color: themeData.bottomAppBarColor),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_score, color: themeData.bottomAppBarColor),
            label: 'Score',
          ),
        ],
      ),*/
    );
  }
}
