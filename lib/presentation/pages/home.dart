import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:projekt/presentation/routes/app_router.gr.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return AutoTabsScaffold(
      routes: const [
        MeRouter(),
        FamRouter(),
        CalRouter(),
        TasksRouter(),
        ScoreRouter(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: themeData.iconTheme.color,
          selectedIconTheme: IconThemeData(color: themeData.iconTheme.color),
          //backgroundColor: Colors.amber,

          //backgroundColor: themeData.appBarTheme.color,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          type: BottomNavigationBarType.fixed,
          //type: BottomNavigationBarType.shifting,
          elevation: 60,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.family_restroom, color: Colors.white),
              label: 'Fam',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month, color: Colors.white),
              label: 'Calender',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_rounded, color: Colors.white),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_score, color: Colors.white),
              label: 'Score',
            ),
          ],
        );
      },
    );
  }
}
