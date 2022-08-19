import 'package:flutter/material.dart';
import 'myPage.dart';

class myPageEdit extends StatefulWidget {
  const myPageEdit({Key? key}) : super(key: key);

  @override
  State<myPageEdit> createState() => _myPageEditState();
}

class _myPageEditState extends State<myPageEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              color: Colors.yellow,
              height: MediaQuery.of(context).size.height/5,
              width: MediaQuery.of(context).size.width/3,
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
              onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return myPage();})),
              child: Text('登録',style: TextStyle(fontSize: 30),))
          ],
        )
      )
    );
  }
}
