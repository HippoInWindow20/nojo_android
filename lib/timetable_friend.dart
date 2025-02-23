import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List times = [
  "08:10",
  "09:10",
  "10:20",
  "11:20",
  "12:20",
  "13:20",
  "14:20",
  "15:30",
  "16:30",
  "17:30"
];

class TimetableF extends StatefulWidget {
  const TimetableF({super.key, required this.name});
  final String name;

  @override
  State<TimetableF> createState() => _TimetableFState();
}

class _TimetableFState extends State<TimetableF> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoDynamicColor.resolve(
            CupertinoColors.systemBackground, context),
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              leading: CupertinoNavigationBarBackButton(
                previousPageTitle: '朋友的課表',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              stretch: true,
              backgroundColor: CupertinoDynamicColor.resolve(
                  CupertinoColors.systemBackground, context),
              border: null,
              largeTitle: Text(widget.name + '的課表'),
            ),
            // This widget fills the remaining space in the viewport.
            // Drag the scrollable area to collapse the CupertinoSliverNavigationBar.
            SliverFillRemaining(
                hasScrollBody: true,
                child: Column(children: [
                  Container(
                    color: CupertinoDynamicColor.resolve(
                        CupertinoColors.systemBackground, context),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 6,
                          children: List.generate(66, (index) {
                            List days = ['一', '二', '三', '四', '五'];
                            if (index < 6) {
                              if (index == 0) {
                                return Container();
                              } else {
                                return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: CupertinoDynamicColor.resolve(
                                                CupertinoColors.systemBlue,
                                                context)
                                            .withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          days[index - 1],
                                        ),
                                      ),
                                    ));
                              }
                            } else {
                              if ((index + 1) % 6 == 1) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ((index + 1) / 6).floor().toString(),
                                      ),
                                      Text(
                                        times[((index + 1) / 6).floor() - 1],
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                CupertinoDynamicColor.resolve(
                                                    CupertinoColors.systemGrey4,
                                                    context)),
                                        color: CupertinoDynamicColor.resolve(
                                            CupertinoColors.systemGrey5,
                                            context),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ));
                              }
                            }
                          }),
                        ),
                      ],
                    ),
                  )
                ])),
          ],
        ));
  }
}
