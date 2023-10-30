import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:skywatch/core/constants/colors/colors_constants.dart';
import 'package:skywatch/core/constants/strings/strings.dart';
import 'package:skywatch/core/resources/resources.dart';
import 'package:skywatch/core/routes/named_routes.dart';
import 'package:skywatch/core/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppNameStringsConstants.appName,
      theme: ThemeData(
        fontFamily: MontserratFont.familyName,
        colorScheme:
            SchedulerBinding.instance.platformDispatcher.platformBrightness ==
                    Brightness.dark
                ? ColorScheme.dark(
                    primary: ColorsConstants.orange,
                    onPrimary: Colors.white,
                    background: Colors.grey.shade900,
                    surface: Colors.grey.shade900,
                    surfaceTint: ColorsConstants.primaryGrey,
                  )
                : const ColorScheme.light(
                    primary: ColorsConstants.orange,
                    onPrimary: Colors.white,
                  ),
        useMaterial3: true,
      ),
      routes: Routes.allRoutes(context),
      initialRoute: NamedRoutes.home,
    );
  }
}
