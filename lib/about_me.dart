import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

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
              largeTitle: Text('About me'),
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              child: Column(children: [
                CupertinoListSection.insetGrouped(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  header: const Text('ABOUT ME',
                      style: TextStyle(
                          color: CupertinoColors.systemGrey,
                          fontWeight: FontWeight.normal)),
                  children: <CupertinoListTile>[
                    CupertinoListTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      title: Text(
                        "Hi, I'm an asshole",
                      ),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  header: const Text('ABOUT THE APP',
                      style: TextStyle(
                          color: CupertinoColors.systemGrey,
                          fontWeight: FontWeight.normal)),
                  children: <CupertinoListTile>[
                    CupertinoListTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "不揪？",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "版本：69.0",
                          ),
                          Text(
                            "Insert text here!",
                            style: TextStyle(color: CupertinoColors.systemGrey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  header: const Text('CONTACT',
                      style: TextStyle(
                          color: CupertinoColors.systemGrey,
                          fontWeight: FontWeight.normal)),
                  children: <CupertinoListTile>[
                    CupertinoListTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Email：",
                              ),
                              CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  sizeStyle: CupertinoButtonSize.large,
                                  child: Text('hi1214justin@gmail.com'),
                                  onPressed: () {
                                    _launchUrl('mailto:hi1214justin@gmail.com');
                                  })
                            ],
                          ),
                          CupertinoButton(
                              padding: EdgeInsets.zero,
                              sizeStyle: CupertinoButtonSize.large,
                              child: Text('Instagram'),
                              onPressed: () {
                                _launchUrl(
                                    'https://www.instagram.com/justin.chung.2547/');
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ));
  }
}
