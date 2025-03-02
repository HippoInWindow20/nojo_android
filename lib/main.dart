import 'package:bujo/bulletin.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'timetable.dart';
import 'friends.dart';
import 'settings.dart';
import 'logout.dart';
import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  // This widget is the root of your application.
}

class _MyAppState extends State<MyApp> {
  void setStateCallback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        brightness: darkMode ? Brightness.dark : Brightness.light,
      ),
      home: Logout(
        setStateCallback: setStateCallback,
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.setStateCallback});
  final Function setStateCallback;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void showColors() {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Colours(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        backgroundColor: CupertinoColors.white,
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.calendar),
              label: '課表',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_circle_fill),
              label: '朋友的課表',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bell_fill),
              label: '布告欄',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: '設定',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          if (index == 0) {
            return CupertinoPageScaffold(
              backgroundColor: CupertinoDynamicColor.resolve(
                  CupertinoColors.systemBackground, context),
              child: Timetable(
                showColors: showColors,
              ),
            );
          } else if (index == 1) {
            return Friends();
          } else if (index == 2) {
            return Bulletin();
          } else if (index == 3) {
            return Settings(
              setStateCallback: widget.setStateCallback,
            );
          } else {
            return Text("");
          }
        });
  }
}
