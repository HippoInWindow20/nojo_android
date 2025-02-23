import 'package:bujo/main.dart';
import 'package:flutter/cupertino.dart';

bool login = true;
bool loggingIn = false;

class Logout extends StatefulWidget {
  const Logout({super.key, required this.setStateCallback});
  final Function setStateCallback;

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color.fromARGB(255, 181, 200, 255),
              Color.fromARGB(255, 233, 204, 255),
            ],
            tileMode: TileMode.mirror,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(CupertinoIcons.calendar, size: 80)],
              ),
              Text('不揪？',
                  style: TextStyle(
                      fontSize: 30,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text('分享課表 找到共同時間',
                  style: TextStyle(
                      fontSize: 20,
                      color: CupertinoColors.systemGrey,
                      fontWeight: FontWeight.normal)),
              Padding(padding: EdgeInsets.only(top: 10)),
              Padding(
                padding: EdgeInsets.all(20),
                child: CupertinoTextField(
                  prefix: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      CupertinoIcons.mail,
                      size: 25,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  style: TextStyle(color: CupertinoColors.black),
                  placeholder: 'Email',
                  padding: EdgeInsets.all(20),
                  placeholderStyle:
                      TextStyle(color: CupertinoColors.systemGrey),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CupertinoColors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: CupertinoTextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  prefix: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      CupertinoIcons.lock,
                      size: 25,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  style: TextStyle(color: CupertinoColors.black),
                  placeholder: '密碼',
                  placeholderStyle:
                      TextStyle(color: CupertinoColors.systemGrey),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CupertinoColors.white,
                  ),
                  padding: EdgeInsets.all(20),
                ),
              ),
              if (login == false)
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: CupertinoTextField(
                    prefix: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        CupertinoIcons.person,
                        size: 25,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    placeholder: '名字',
                    style: TextStyle(color: CupertinoColors.black),
                    padding: EdgeInsets.all(20),
                    placeholderStyle:
                        TextStyle(color: CupertinoColors.systemGrey),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoButton.filled(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (loggingIn)
                                CupertinoActivityIndicator(
                                  color: CupertinoColors.white,
                                ),
                              if (loggingIn)
                                Padding(padding: EdgeInsets.only(left: 10)),
                              Text(
                                login ? '登入' : '註冊',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          onPressed: () async {
                            setState(() {
                              loggingIn = true;
                            });
                            await Future.delayed(const Duration(seconds: 1));
                            setState(() {
                              loggingIn = false;
                            });
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => MyHomePage(
                                          setStateCallback:
                                              widget.setStateCallback,
                                        )));
                          },
                        ),
                      ),
                    ],
                  )),
              CupertinoButton(
                child: Text(
                  login ? '還沒有帳號？註冊' : '已有帳號？登入',
                ),
                onPressed: () {
                  if (login == true) {
                    setState(() {
                      login = false;
                    });
                  } else {
                    setState(() {
                      login = true;
                    });
                  }
                },
              ),
              CupertinoButton(
                child: Text(
                  '如何使用？',
                  style: TextStyle(color: CupertinoColors.systemGrey),
                ),
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text('如何使用？'),
                          content: Text(
                              '歡迎來到不揪！這是一個課表分享的APP，你可以在這裡管理自己的課表，也可以查看好友的課表。'),
                          actions: [
                            CupertinoDialogAction(
                              child: Text('關閉'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
