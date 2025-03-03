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
                          // CupertinoIcons.question_circle,
                          CupertinoIcons.refresh,
                          size: 30,
                        ),
                        onPressed: () {
                          // showCupertinoDialog<void>(
                          //   context: context,
                          //   builder: (BuildContext context) =>
                          //       CupertinoAlertDialog(
                          //     title: const Text('使用說明'),
                          //     content: const Text(
                          //         '在這裡你可以查看好友的課表，並查看他們是否有空。\n點擊好友名稱以查看詳細課表，或滑動以刪除好友。'),
                          //     actions: <CupertinoDialogAction>[
                          //       CupertinoDialogAction(
                          //         isDefaultAction: true,
                          //         onPressed: () {
                          //           Navigator.pop(context);
                          //         },
                          //         child: const Text('關閉'),
                          //       ),
                          //     ],
                          //   ),
                          // );
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
                      separatorColor: CupertinoColors.transparent,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      // header: const Text('新增好友',
                      //     style: TextStyle(
                      //         color: CupertinoColors.systemBlue,
                      //         fontWeight: FontWeight.normal)),
                      children: <CupertinoListTile>[
                        CupertinoListTile(
                            title: Row(
                          children: [
                            Icon(
                              CupertinoIcons.circle_fill,
                              color: CupertinoColors.systemBlue,
                              size: 10,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              '新增好友',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
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
                    Padding(padding: EdgeInsets.only(top: 20)),
                    CupertinoListSection.insetGrouped(
                      separatorColor: CupertinoColors.transparent,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        CupertinoListTile(
                            title: Row(
                          children: [
                            Icon(
                              CupertinoIcons.circle_fill,
                              color: CupertinoColors.systemGreen,
                              size: 10,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              '現在有空的朋友',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                        FriendCard(
                            name: '劉昌祐',
                            email: 'fakeemail@gmail.com',
                            school: '國立臺灣大學',
                            isEmpty: true),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    CupertinoListSection.insetGrouped(
                      separatorColor: CupertinoColors.transparent,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        CupertinoListTile(
                            title: Row(
                          children: [
                            Icon(
                              CupertinoIcons.circle_fill,
                              color: CupertinoColors.systemRed,
                              size: 10,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              '現在有課的朋友',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                        FriendCard(
                            name: '劉昌祐',
                            email: 'fakeemail@gmail.com',
                            school: '國立臺灣大學',
                            isEmpty: false),
                        FriendCard(
                            name: '劉昌祐',
                            email: 'fakeemail@gmail.com',
                            school: '國立臺灣大學',
                            isEmpty: false),
                        FriendCard(
                            name: '劉昌祐',
                            email: 'fakeemail@gmail.com',
                            school: '國立臺灣大學',
                            isEmpty: false),
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

class FriendCard extends StatelessWidget {
  const FriendCard(
      {super.key,
      required this.name,
      required this.email,
      required this.school,
      required this.isEmpty});

  final String name;
  final String email;
  final String school;
  final bool isEmpty;
  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      // leading: Icon(
      //   CupertinoIcons.person_circle_fill,
      //   color: CupertinoColors.systemGreen,
      //   size: 40,
      // ),
      title: Container(
          decoration: BoxDecoration(
            color: CupertinoDynamicColor.resolve(
                CupertinoColors.systemGroupedBackground, context),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      minRadius: 24,
                      backgroundColor: isEmpty
                          ? CupertinoColors.systemGreen
                          : CupertinoColors.systemRed,
                      child: Icon(
                        CupertinoIcons.person_fill,
                        color: CupertinoColors.white,
                        size: 24,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Text(email, style: TextStyle(fontSize: 12)),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Text(school,
                            style: TextStyle(
                                color: CupertinoDynamicColor.resolve(
                                    CupertinoColors.systemBlue, context),
                                fontSize: 12)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )),
      trailing: CupertinoListTileChevron(),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      onTap: () => Navigator.of(context).push(
        CupertinoPageRoute(
            builder: (context) => TimetableF(
                  name: name,
                )),
      ),
    );
  }
}
