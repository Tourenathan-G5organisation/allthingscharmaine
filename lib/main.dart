
import 'package:allthingscharmaine/router/router.dart';
import 'package:allthingscharmaine/core/services/shopData.dart';
import 'package:allthingscharmaine/core/services/socialData.dart';
import 'package:allthingscharmaine/ui/screens/home_screen.dart';
import 'package:allthingscharmaine/ui/screens/signupscreens/name_reg_screen.dart';
import 'package:allthingscharmaine/utils/my_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/viewmodels/loginviewmodel.dart';
import 'core/viewmodels/user_creditcard_viewmodel.dart';
import 'core/viewmodels/userviewmodel.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          // FirebaseUser user = snapshot.data;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                builder: (_) => locator<UserViewModel>(),
              ),
              ChangeNotifierProvider(
                builder: (_) => locator<LoginViewmodel>(),
              ),
              ChangeNotifierProvider(
                builder: (_) => locator<UserCreditCardViewmodel>(),
              ),
              ChangeNotifierProvider(
                builder: (_) => locator<ShopData>(),
              ),
              ChangeNotifierProvider(
                builder: (_) => locator<SocialData>(),
              )
            ],
            child: MaterialApp(
              home: HomeScreen(),
              theme: ThemeData(
                  cursorColor: MyColors().pinkInactive,
                  primaryColor: MyColors().pinkInactive,
                  accentColor: MyColors().pinkActive,
                  fontFamily: 'Poppins'),
onGenerateRoute: Router.generateRoute,
onUnknownRoute: Router.unknownRoute,
            ),
          );
        } else {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                builder: (_) => locator<UserViewModel>(),
              ),
              ChangeNotifierProvider(
                builder: (_) => locator<LoginViewmodel>(),
              ),
              ChangeNotifierProvider(
                builder: (_) => locator<UserCreditCardViewmodel>(),
              ),
              ChangeNotifierProvider(
                builder: (_) => locator<ShopData>(),
              ),
              ChangeNotifierProvider(
                builder: (_) => locator<SocialData>(),
              )

            ],
            child: MaterialApp(
              home: Homepage(),
              theme: ThemeData(
                  cursorColor: MyColors().pinkInactive,
                  primaryColor: MyColors().pinkInactive,
                  accentColor: MyColors().pinkActive,
                  fontFamily: 'Poppins'),
                  onGenerateRoute: Router.generateRoute,
                  onUnknownRoute: Router.unknownRoute,
            ),
          );
        }
      },
    );

  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NameRegScreen();
  }
}

