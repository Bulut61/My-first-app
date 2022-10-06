import 'package:auto_route/auto_route.dart';
import 'package:projekt/presentation/pages/sign_in_page.dart';

import '../pages/homepage.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SignInPage, initial: true),
    MaterialRoute(page: Homepage),
  ],
)
class $AppRouter {}
