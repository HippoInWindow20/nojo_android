import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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

List isAvailable = List.generate(50, (index) => false);

class Timetable extends StatefulWidget {
  const Timetable({super.key, required this.showColors});
  final Function showColors;
  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return CupertinoPageScaffold(
            backgroundColor: CupertinoDynamicColor.resolve(
                CupertinoColors.systemBackground, context),
            child: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  stretch: true,
                  backgroundColor: CupertinoDynamicColor.resolve(
                      CupertinoColors.systemBackground, context),
                  border: null,
                  largeTitle: Text('課表'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CupertinoButton(
                        child: Icon(
                          CupertinoIcons.question_circle,
                          size: 30,
                        ),
                        onPressed: () {
                          showCupertinoDialog<void>(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                              title: const Text('使用說明'),
                              content: const Text(
                                  '點選方塊以選擇課程，點選已選中的方塊以取消選擇。\n選擇完所有課程後，請按下方的「儲存課表」按鈕。\n若想要清除課表，請按下方的「清除課表」按鈕。'),
                              actions: <CupertinoDialogAction>[
                                CupertinoDialogAction(
                                  isDefaultAction: true,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('關閉'),
                                ),
                              ],
                            ),
                          );
                        },
                        sizeStyle: CupertinoButtonSize.small,
                      ),
                      CupertinoButton(
                        child: Icon(
                          Icons.palette_outlined,
                          size: 30,
                        ),
                        onPressed: () {
                          widget.showColors();
                        },
                        sizeStyle: CupertinoButtonSize.small,
                      ),
                    ],
                  ),
                ),
                // This widget fills the remaining space in the viewport.
                // Drag the scrollable area to collapse the CupertinoSliverNavigationBar.
                SliverList(
                    delegate: SliverChildListDelegate.fixed([
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
                                    child: GestureDetector(
                                      onTap: () => setState(() {
                                        isAvailable[index -
                                                6 -
                                                ((index) / 6).floor()] =
                                            !isAvailable[index -
                                                6 -
                                                ((index) / 6).floor()];
                                      }),
                                      child: isAvailable[index -
                                                  6 -
                                                  ((index) / 6).floor()] ==
                                              false
                                          ? Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: CupertinoDynamicColor
                                                        .resolve(
                                                            CupertinoColors
                                                                .systemGrey4,
                                                            context)),
                                                color: CupertinoDynamicColor
                                                    .resolve(
                                                        CupertinoColors
                                                            .systemGrey5,
                                                        context),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: CupertinoDynamicColor
                                                        .resolve(
                                                            CupertinoColors
                                                                .systemGrey4,
                                                            context)),
                                                color: CupertinoDynamicColor
                                                    .resolve(
                                                        CupertinoColors
                                                            .systemBlue,
                                                        context),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                    ));
                              }
                            }
                          }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoButton(
                              color: Colors.red,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    CupertinoIcons.trash,
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  Text(
                                    "清除課表",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              onPressed: () {
                                setState(() {
                                  isAvailable =
                                      List.generate(50, (index) => false);
                                });
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                            ),
                            CupertinoButton.filled(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(CupertinoIcons.square_arrow_down),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  Text("儲存課表")
                                  // Text(x.toString())
                                ],
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Container(
                          height: 100,
                        )
                      ],
                    ),
                  )
                ])),
              ],
            ));
      },
    );
  }
}
