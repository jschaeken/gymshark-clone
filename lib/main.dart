import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gymshark_clone/presentation/state_managment/navigation_provider.dart';
import 'package:gymshark_clone/presentation/views/main_view.dart';
import 'package:provider/provider.dart';

import 'core/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final CustomTheme customTheme = CustomTheme();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageNavigationProvider>(
          create: (_) => PageNavigationProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
        theme: CustomTheme.lightTheme,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        home: MainView(),
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