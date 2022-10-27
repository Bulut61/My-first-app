import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:projekt/presentation/pages/fam_page.dart';
import 'package:projekt/presentation/pages/register_page.dart';
import 'package:projekt/presentation/pages/sign_in_page.dart';
import 'package:projekt/presentation/pages/homePages/task_page.dart';
import '../pages/calender_page.dart';
import '../pages/home.dart';
import '../pages/homePages/confirm_task_page.dart';
import '../pages/homePages/homepage.dart';
import '../pages/homePages/pocket_money_page.dart';
import '../pages/homePages/shopping_list_page.dart';
import '../pages/score_page.dart';
import '../pages/tasks_bottom_page.dart';

//flutter packages pub run build_runner build

@MaterialAutoRouter(
  routes: [
    AutoRoute(
      path: '/',
      page: SignInPage,
    ),
    AutoRoute(
      path: 'register',
      name: 'rRouter',
      page: RegisterPage,
    ),
    AutoRoute(
      path: 'home',
      name: 'hRouter',
      page: Home,
      children: [
        AutoRoute(
          path: 'me',
          name: 'meRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: Homepage,
            ),
            AutoRoute(
              path: 'createTask',
              page: TaskPage,
            ),
            AutoRoute(
              path: 'shoppingList',
              page: ShoppingListPage,
            ),
            AutoRoute(
              path: 'ConfirmTask',
              page: ConfirmTaskPage,
            ),
            AutoRoute(
              path: 'PocketMoney',
              page: PocketMoneyPage,
            )
          ],
        ),
        AutoRoute(
          path: 'fam',
          name: 'famRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: FamPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'cal',
          name: 'calRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: CalenderPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'tasks',
          name: 'tasksRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: TasksBottomPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'score',
          name: 'scoreRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: ScorePage,
            ),
          ],
        ),
      ],
    )
  ],
  /*routes: [
    MaterialRoute(page: SignInPage, initial: true),
    MaterialRoute(path: 'homepage', page: Homepage),
    MaterialRoute(page: TaskPage, path: 'tasks'),
  ],*/
)
class $AppRouter {}
