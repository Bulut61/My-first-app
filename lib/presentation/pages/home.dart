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
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          type: BottomNavigationBarType.fixed,
          //type: BottomNavigationBarType.shifting,
          elevation: 60,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.family_restroom),
              label: 'Fam',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calender',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_rounded),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_score),
              label: 'Score',
            ),
          ],
        );
      },
    );
  }
}
