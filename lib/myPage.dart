import 'package:flutter/material.dart';
import 'main.dart';
import 'myPageEdit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'userRegister.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  int boCounter = 0;
  UserRegister userRegister = UserRegister();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if(FirebaseAuth.instance.currentUser == null){
                print('ログアウト');
              }
              Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyHomePage(title: 'oshiten');}));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?100:50,
                      backgroundImage: AssetImage('images/profilePic/pic1.png'),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text('ユーザーネーム',style: TextStyle(fontSize: 25),),
                            ),
                            SizedBox(height: 5,),
                            Container(
                                alignment: Alignment.centerRight,
                              child: Text('ベストオシテン     $boCounter',style: TextStyle(fontSize: 20,),)
                            ),
                            SizedBox(height: 5,),
                            Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyPageEdit();})),
                                  child: const Text('プロフィール編集',
                                      style: TextStyle(fontSize: 20,decoration: TextDecoration.underline))
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Text('コメント　　おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。おはようございます。'
                  ,style: TextStyle(fontSize: 15),),
              ),
              SizedBox(height: 30,),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text('推した店',style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 5,),
              Container(
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                      300:150,
                      width: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                      300:150,
                      child: Image.asset('images/profilePic/pic2.png'),
                    ),
                    const SizedBox(width: 20,),
                    Container(child: Text('このお店を紹介しました',style: TextStyle(fontSize: 15),),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text('推してもらった店',style: TextStyle(fontSize: 20),),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                      300:150,
                      width: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                      300:150,
                      child: Image.asset('images/profilePic/pic4.png'),
                    ),
                    const SizedBox(width: 20,),
                    Container(
                      child: Flexible(
                        child: (
                          Text('このお店を紹介してもらいました',style: TextStyle(fontSize: 15),)
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
