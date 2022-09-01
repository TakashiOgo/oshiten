import 'package:flutter/material.dart';
import 'storeIntroduction.dart';
import 'myBottomNavigationBar.dart';

class ConditionsDetail extends StatelessWidget {
  const ConditionsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('条件詳細'),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyBottomNavigationBar(selectedIndex: 3,);})),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?100:50,
                    backgroundImage: AssetImage('images/profilePic/pic1.png'),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text('ユーザーネーム',style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Text(
                '東京都　　　和食　　　1,000〜3,000　　　20代　　　友人　　　大衆　　　駐車場：有',
                style: TextStyle(fontSize: 20,),
              ),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return StoreIntroduction();})),
                    child: const Text('お店を紹介する',style: TextStyle(fontSize: 20),)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
