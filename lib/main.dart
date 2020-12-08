import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:init_project/locator.dart';
import 'package:init_project/providers/theme_provider.dart';
import 'package:init_project/ui/home_main.dart';
import 'package:init_project/ui/profile/profile_root.dart';
import 'package:init_project/ui/root/root.dart';
import 'package:init_project/utils/size_config.dart';
import 'package:init_project/utils/themeStyle.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:init_project/services/api.dart';
import 'package:init_project/providers/userProvider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => UserProvider()),
          ],
          child: ChangeNotifierProvider(
            create: (_) {
              return themeChangeProvider;
            },
            child: Consumer<DarkThemeProvider>(
              builder: (BuildContext context, value, Widget child) {
                return GraphQLProvider(
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: Styles.themeData(
                        themeChangeProvider.darkTheme, context),
                    home: RootPage(),
                  ),
                  client: client,
                );
              },
            ),
          ),
        );
        /* return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          theme: ThemeData(
              brightness: Brightness.light,
              // primarySwatch: Colors.red,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              appBarTheme: AppBarTheme(
                color: Color(0xFFED2F21),
                elevation: 0,
              )),
          home: ChangeNotifierProvider(
            create: (_) {
              return themeChangeProvider;
            },
            child: Consumer<DarkThemeProvider>(
              builder: (BuildContext context, value, Widget child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme:
                      Styles.themeData(themeChangeProvider.darkTheme, context),
                  home: RootPage(),
                );
              },
            ),
          ),
        ); */
      });
    });
  }
}
