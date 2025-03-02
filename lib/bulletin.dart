import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bulletin extends StatefulWidget {
  const Bulletin({super.key});

  @override
  State<Bulletin> createState() => _BulletinState();
}

class _BulletinState extends State<Bulletin> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
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
                  largeTitle: Text('布告欄'),
                ),
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: CupertinoColors.systemRed, width: 1),
                            borderRadius: BorderRadius.circular(15),
                            color: CupertinoDynamicColor.resolve(
                                CupertinoColors.systemBackground, context),
                            boxShadow: [
                              BoxShadow(
                                color: CupertinoColors.systemGrey2,
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                          CupertinoIcons
                                              .exclamationmark_triangle_fill,
                                          color: CupertinoColors.systemRed,
                                          size: 24),
                                      Padding(
                                          padding: EdgeInsets.only(right: 10)),
                                      Text('測試',
                                          style: TextStyle(
                                              color: CupertinoColors.systemRed,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Text('校內活動',
                                      style: TextStyle(
                                          color: CupertinoColors.black)),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Row(
                                    children: [
                                      Icon(CupertinoIcons.clock_fill,
                                          color: CupertinoColors.systemGrey),
                                      Padding(
                                          padding: EdgeInsets.only(right: 10)),
                                      Text('2024/04/18 12:00',
                                          style: TextStyle(
                                              color:
                                                  CupertinoColors.systemGrey)),
                                    ],
                                  ),
                                ]),
                          )),
                    ),
                  ]),
                )
              ],
            ));
      },
    );
  }
}
