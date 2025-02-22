import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class School extends StatefulWidget {
  const School({super.key});

  @override
  State<School> createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoDynamicColor.resolve(
            CupertinoColors.systemGroupedBackground, context),
        child: CustomScrollView(
          // A list of sliver widgets.
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              leading: CupertinoNavigationBarBackButton(
                previousPageTitle: '設定',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              stretch: true,
              border: null,
              backgroundColor: CupertinoDynamicColor.resolve(
                  CupertinoColors.systemGroupedBackground, context),
              largeTitle: Text('選擇學校'),
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              child: Column(children: [
                CupertinoListSection.insetGrouped(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  header: const Text('北部',
                      style: TextStyle(
                          color: CupertinoColors.systemGrey,
                          fontWeight: FontWeight.normal)),
                  children: <CupertinoListTile>[
                    CupertinoListTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      title: Text(
                        "國立臺灣大學",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("第一節：08:10 - 09:00"),
                      trailing: Icon(
                        CupertinoIcons.check_mark,
                        color: CupertinoColors.systemBlue,
                      ),
                      // onTap: () => Navigator.of(context).push(
                      //   CupertinoPageRoute<void>(
                      //     builder: (BuildContext context) {
                      //       return const _SecondPage(text: 'Open pull request');
                      //     },
                      //   ),
                      // ),
                    ),
                  ],
                ),
                Expanded(
                    child: Container(
                  color: CupertinoDynamicColor.resolve(
                      CupertinoColors.systemGroupedBackground, context),
                ))
              ]),
            )
          ],
        ));
  }
}
