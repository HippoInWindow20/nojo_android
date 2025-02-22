import 'package:bujo/logout.dart';
import 'package:bujo/select_school.dart';
import 'about_me.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool darkMode = false;

class Settings extends StatefulWidget {
  const Settings({super.key, required this.setStateCallback});
  final Function setStateCallback;
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                  largeTitle: Text('設定'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [],
                  ),
                ),
                SliverFillRemaining(
                  fillOverscroll: true,
                  hasScrollBody: true,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          color: CupertinoDynamicColor.resolve(
                              CupertinoColors.systemGroupedBackground, context),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, top: 10),
                                    child: Text(
                                      '帳號資訊',
                                      style: TextStyle(
                                          color: CupertinoDynamicColor.resolve(
                                              CupertinoColors.systemGrey,
                                              context)),
                                    ),
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 20)),
                              Center(
                                child: Icon(CupertinoIcons.person_circle_fill,
                                    size: 80,
                                    color: CupertinoColors.systemBlue),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '許晉誠',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: CupertinoDynamicColor.resolve(
                                            CupertinoColors.label, context),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CupertinoButton(
                                    padding: EdgeInsets.all(0),
                                    child: Icon(
                                      CupertinoIcons.pencil_circle_fill,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      showCupertinoDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CupertinoAlertDialog(
                                          title: const Text('修改名字'),
                                          content: Column(
                                            children: <Widget>[
                                              Text('請輸入新的名字'),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 10)),
                                              CupertinoTextField(
                                                placeholder: '新的名字',
                                              ),
                                            ],
                                          ),
                                          actions: <CupertinoDialogAction>[
                                            CupertinoDialogAction(
                                              isDefaultAction: true,
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('取消'),
                                            ),
                                            CupertinoDialogAction(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('確定'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                              Text(
                                'shippo.hsu@gmail.com',
                                style: TextStyle(
                                  color: CupertinoDynamicColor.resolve(
                                      CupertinoColors.systemGrey, context),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 20)),
                            ],
                          ),
                        ),
                        CupertinoListSection.insetGrouped(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          header: Text(
                            '帳號',
                            style: TextStyle(
                                color: CupertinoDynamicColor.resolve(
                                    CupertinoColors.systemGrey, context),
                                fontWeight: FontWeight.normal),
                          ),
                          children: <CupertinoListTile>[
                            CupertinoListTile(
                              title: Text(
                                '登出',
                                style: TextStyle(
                                    color: CupertinoColors.systemBlue),
                              ),
                              leading: Icon(Icons.logout),
                              onTap: () =>
                                  Navigator.of(context, rootNavigator: true)
                                      .pushReplacement(
                                CupertinoPageRoute(
                                    builder: (context) => Logout(
                                          setStateCallback:
                                              widget.setStateCallback,
                                        )),
                              ),
                            ),
                            CupertinoListTile(
                              title: Text(
                                '刪除帳號',
                                style:
                                    TextStyle(color: CupertinoColors.systemRed),
                              ),
                              leading: Icon(
                                CupertinoIcons.delete,
                                color: CupertinoColors.systemRed,
                              ),
                              onTap: () {
                                showCupertinoDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                    title: const Text('確認刪除帳號'),
                                    content: Text('您確定要刪除帳號嗎？這將無法恢復。'),
                                    actions: <CupertinoDialogAction>[
                                      CupertinoDialogAction(
                                        isDefaultAction: true,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('取消'),
                                      ),
                                      CupertinoDialogAction(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pushReplacement(
                                              CupertinoPageRoute(
                                                  builder: (context) => Logout(
                                                        setStateCallback: widget
                                                            .setStateCallback,
                                                      )),
                                            );
                                          },
                                          child: Text(
                                            '刪除',
                                            style: TextStyle(
                                                color:
                                                    CupertinoColors.systemRed),
                                          )),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        CupertinoListSection.insetGrouped(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          header: Text(
                            '介面設定',
                            style: TextStyle(
                                color: CupertinoDynamicColor.resolve(
                                    CupertinoColors.systemGrey, context),
                                fontWeight: FontWeight.normal),
                          ),
                          children: <CupertinoListTile>[
                            CupertinoListTile(
                              title: Text(
                                '深色模式',
                              ),
                              leading: Icon(
                                darkMode
                                    ? CupertinoIcons.moon_fill
                                    : CupertinoIcons.sun_max_fill,
                                color: darkMode
                                    ? CupertinoColors.systemPurple
                                    : CupertinoColors.systemOrange,
                              ),
                              trailing: CupertinoSwitch(
                                value: darkMode,
                                onChanged: (value) {
                                  darkMode = value;
                                  widget.setStateCallback();
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                        CupertinoListSection.insetGrouped(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          header: Text(
                            '學校設定',
                            style: TextStyle(
                                color: CupertinoDynamicColor.resolve(
                                    CupertinoColors.systemGrey, context),
                                fontWeight: FontWeight.normal),
                          ),
                          children: <CupertinoListTile>[
                            CupertinoListTile(
                              title: Text(
                                '選擇學校',
                              ),
                              subtitle: Text('國立臺灣大學'),
                              leading: Icon(
                                Icons.account_balance,
                                color: CupertinoColors.systemBlue,
                              ),
                              trailing: CupertinoListTileChevron(),
                              onTap: () => Navigator.push(
                                context,
                                CupertinoPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return School();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        CupertinoListSection.insetGrouped(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          header: Text(
                            '其他',
                            style: TextStyle(
                                color: CupertinoDynamicColor.resolve(
                                    CupertinoColors.systemGrey, context),
                                fontWeight: FontWeight.normal),
                          ),
                          children: <CupertinoListTile>[
                            CupertinoListTile(
                              title: Text(
                                'About me',
                              ),
                              leading: Icon(
                                CupertinoIcons.info_circle_fill,
                                color: CupertinoColors.systemBlue,
                              ),
                              trailing: CupertinoListTileChevron(),
                              onTap: () => Navigator.push(
                                context,
                                CupertinoPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return About();
                                  },
                                ),
                              ),
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
