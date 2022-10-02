import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Family App",
          style: themeData.textTheme.headline1,
        ),
      ),
      body: Column(
        children: [
          Text("a"),
          Text("b"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: themeData.appBarTheme.color,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.face, color: themeData.bottomAppBarColor),
            label: 'Me',
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
      ),
    );
  }
}
