import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gymshark_clone/pages/explore_page.dart';

import 'core/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final CustomTheme customTheme = CustomTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
      theme: CustomTheme.lightTheme,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const ExplorePage(
        pageTitle: 'EXPLORE',
      ),
    );
  }
}

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };
}


/* To adjust app height to iPhone 12 ratio:

double screenHeight = MediaQuery.of(context).size.height;
double correspondingWidth = screenHeight / 2.1667;

*/