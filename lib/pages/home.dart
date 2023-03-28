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
        title: Image.asset(
          'assets/images/logo.png',
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            child: Text(currentToken),
          ),
          InkWell(child: Text('Change Data'), onTap: () async {
            await spSetString("token","It's your token bro");
            var token = await spGetString('token');
            setState((){
              currentToken = token;
            });
          },),
          InkWell(child: Text('Get Data'), onTap: () async{
            SharedPreferences spef = await SharedPreferences.getInstance();
            setState(() {
              currentToken = spef.getString('appToken').toString();
            });
          },)
        ],
      ),
    );
  }

}
