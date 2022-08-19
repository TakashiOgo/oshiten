import 'package:flutter/material.dart';
import 'package:oshiten_app/search.dart';
import 'main.dart';
import 'myPageEdit.dart';
import 'package:provider/provider.dart';
import 'search.dart';

class myPage extends StatefulWidget {
  const myPage({Key? key}) : super(key: key);

  @override
  State<myPage> createState() => _myPageState();
}

class _myPageState extends State<myPage> {

  int boCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('マイページ'),automaticallyImplyLeading: false,),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.yellow,
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width/4,
                  margin: EdgeInsets.only(left: 20),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/5,
                  margin: EdgeInsets.only(right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyHomePage();})),
                        icon: const Icon(Icons.logout),
                      ),
                      SizedBox(height: 5,),
                      Text('ベストオシテン     $boCounter',style: TextStyle(fontSize: 20,),),
                      SizedBox(height: 5,),
                      Text('ユーザーネーム',style: TextStyle(fontSize: 20),),
                      SizedBox(height: 5,),
                      TextButton(
                        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return myPageEdit();})),
                        child: const Text('プロフィール編集',
                            style: TextStyle(fontSize: 20,decoration: TextDecoration.underline))
                      )
                    ],
                  )
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(20),
              child: Text('コメント　　おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。'
                ,style: TextStyle(fontSize: 15),),
            ),
            SizedBox(height: 30,),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              child: const Text('推した店',style: TextStyle(fontSize: 20),),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    color: Colors.yellow,
                    margin: EdgeInsets.only(left: 20),
                    height: MediaQuery.of(context).size.height/7,
                    width: MediaQuery.of(context).size.width/5,
                  ),
                  const SizedBox(width: 20,),
                  Container(child: Text('このお店を紹介しました',style: TextStyle(fontSize: 15),),)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              child: const Text('推してもらった店',style: TextStyle(fontSize: 20),),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    color: Colors.yellow,
                    margin: EdgeInsets.only(left: 20),
                    height: MediaQuery.of(context).size.height/7,
                    width: MediaQuery.of(context).size.width/5,
                  ),
                  const SizedBox(width: 20,),
                  Container(child: Text('このお店を紹介してもらいました',style: TextStyle(fontSize: 15),),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
