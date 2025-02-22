import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colours extends StatefulWidget {
  const Colours({super.key});

  @override
  State<Colours> createState() => _ColoursState();
}

class _ColoursState extends State<Colours> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoDynamicColor.resolve(
            CupertinoColors.systemGroupedBackground, context),
        child: CustomScrollView(
          // A list of sliver widgets.
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              stretch: true,
              border: null,
              backgroundColor: CupertinoDynamicColor.resolve(
                  CupertinoColors.systemGroupedBackground, context),
              largeTitle: Text('顏色設定'),
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              child: Column(children: [
                CupertinoListSection.insetGrouped(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  header: const Text('課程顏色',
                      style: TextStyle(
                          color: CupertinoColors.systemGrey,
                          fontWeight: FontWeight.normal)),
                  children: <CupertinoListTile>[
                    CupertinoListTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      title: Text(
                        "選擇課程顏色",
                      ),
                      trailing: Text(""),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  header: const Text('當前時間顏色',
                      style: TextStyle(
                          color: CupertinoColors.systemGrey,
                          fontWeight: FontWeight.normal)),
                  children: <CupertinoListTile>[
                    CupertinoListTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      title: Text(
                        "選擇當前時間顏色",
                      ),
                      trailing: Text(""),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ));
  }
}
