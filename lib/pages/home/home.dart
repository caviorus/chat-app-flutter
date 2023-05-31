import 'package:chatapp/pages/chat/chat.dart';
import 'package:flutter/foundation.dart';
import 'package:chatapp/global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? context}) : super(key: context);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentToken = '';

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    SharedPreferences spef = await SharedPreferences.getInstance();
    setState(() {
      currentToken = spef.getString('appToken').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: SizedBox(
            height: 56,
            width: 56,
            child: Icon(
              Icons.menu_outlined,
              color: AppColor.black,
            ),
          ),
          onTap: () {
            if (kDebugMode) {
              print('clicked');
            }
          },
        ),
        actions: [
          InkWell(
            child: SizedBox(
              height: 56,
              width: 56,
              child: Icon(
                Icons.search_outlined,
                color: AppColor.black,
              ),
            ),
            onTap: () {
              if (kDebugMode) {
                print('clicked 2');
              }
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: const [
          ChatItem(),
          ChatItem(),
          ChatItem(),
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (kDebugMode) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Chat()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black12))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: AppColor.primary,
                  ),
                  onTap: () {
                    if (kDebugMode) {
                      print("Profile Clicked");
                    }
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Albert Grey"),
                    Text("Yeah, That's nice view bro!")
                  ],
                )
              ],
            ),
            Column(
              children: [
                const Text("9.32"),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  height: 24,
                  width: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.primary),
                  child: Text(
                    "5",
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
