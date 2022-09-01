import 'package:flutter/material.dart';
import 'myBottomNavigationBar.dart';

class MyPageEdit extends StatefulWidget {
  const MyPageEdit({Key? key}) : super(key: key);

  @override
  State<MyPageEdit> createState() => _MyPageEditState();
}

class _MyPageEditState extends State<MyPageEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              height: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
              MediaQuery.of(context).size.height/3:MediaQuery.of(context).size.height/5,
              width: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
              MediaQuery.of(context).size.width/4:MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'ユーザーネーム',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'コメント',
                  border: OutlineInputBorder()
               ),
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyBottomNavigationBar(selectedIndex: 3,);})),
              child: Text('登録',style: TextStyle(fontSize: 30),))
          ],
        )
      )
    );
  }
}
