import 'package:chatapp/global.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.chevron_left_outlined),
              Flexible(child: CircleAvatar(backgroundColor: AppColor.primary)),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {
            if (kDebugMode) {
              print("Profile Page");
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Albert Grey"),
              Text("Last seen 2 minutes ago"),
            ],
          ),
        ),
      ),
    );
  }
}
