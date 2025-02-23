import 'package:bujo/timetable_friend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
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
                  largeTitle: Text('朋友的課表'),
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
                                  '在這裡你可以查看好友的課表，並查看他們是否有空。\n點擊好友名稱以查看詳細課表，或滑動以刪除好友。'),
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
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: Column(children: [
                    CupertinoListSection.insetGrouped(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      header: const Text('新增好友',
                          style: TextStyle(
                              color: CupertinoColors.systemBlue,
                              fontWeight: FontWeight.normal)),
                      children: <CupertinoListTile>[
                        CupertinoListTile(
                          title: CupertinoTextField(
                            placeholder: '輸入好友的 Email',
                          ),
                          leading: Icon(CupertinoIcons.person_add_solid),
                          // onTap: () => Navigator.of(context).push(
                          //   CupertinoPageRoute<void>(
                          //     builder: (BuildContext context) {
                          //       return const _SecondPage(text: 'Open pull request');
                          //     },
                          //   ),
                          // ),
                        ),
                        CupertinoListTile(
                            title: Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(10),
                              child: CupertinoButton.filled(
                                  sizeStyle: CupertinoButtonSize.large,
                                  child: Text(
                                    '加好友',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {}),
                            ))
                          ],
                        )),
                      ],
                    ),
                    CupertinoListSection.insetGrouped(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      header: const Row(
                        children: [
                          Icon(
                              CupertinoIcons.person_crop_circle_badge_checkmark,
                              color: CupertinoColors.systemGreen),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text('現在有空的朋友',
                              style: TextStyle(
                                  color: CupertinoColors.systemGreen,
                                  fontWeight: FontWeight.normal))
                        ],
                      ),
                      children: <CupertinoListTile>[
                        CupertinoListTile(
                            title: Text(
                          '現在有課的朋友',
                          style: TextStyle(
                              color: CupertinoDynamicColor.resolve(
                                  CupertinoColors.systemGrey, context)),
                        )
                            // onTap: () => Navigator.of(context).push(
                            //   CupertinoPageRoute<void>(
                            //     builder: (BuildContext context) {
                            //       return const _SecondPage(text: 'Open pull request');
                            //     },
                            //   ),
                            // ),
                            ),
                        CupertinoListTile(
                          leading: Icon(
                            CupertinoIcons.person_circle_fill,
                            color: CupertinoColors.systemGreen,
                            size: 40,
                          ),
                          title: Text(
                            '許晉誠',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: CupertinoListTileChevron(),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('shippo.hsu@gmail.com'),
                              Text('國立台灣大學',
                                  style: TextStyle(
                                      color: CupertinoDynamicColor.resolve(
                                          CupertinoColors.systemBlue,
                                          context))),
                            ],
                          ),
                          onTap: () => Navigator.of(context).push(
                            CupertinoPageRoute(
                                builder: (context) => TimetableF(
                                      name: "許晉誠",
                                    )),
                          ),
                        ),
                      ],
                    ),
                    CupertinoListSection.insetGrouped(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      header: const Row(
                        children: [
                          Icon(CupertinoIcons.person_crop_circle_badge_xmark,
                              color: CupertinoColors.systemRed),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text('現在有課的朋友',
                              style: TextStyle(
                                  color: CupertinoColors.systemRed,
                                  fontWeight: FontWeight.normal))
                        ],
                      ),
                      children: <CupertinoListTile>[
                        CupertinoListTile(
                            title: Text(
                          '目前沒有正在上課的朋友',
                          style: TextStyle(
                              color: CupertinoDynamicColor.resolve(
                                  CupertinoColors.systemGrey, context)),
                        )
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
                  ]),
                )
              ],
            ));
      },
    );
  }
}
