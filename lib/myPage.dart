import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'myPageEdit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';


class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  String myId = FirebaseAuth.instance.currentUser!.uid;

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
              Navigator.of(context).push(MaterialPageRoute(builder: (context){return const MyHomePage(title: 'oshiten');}));
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
                    Consumer<PictureProvider>(
                        builder: (context, picture, child) {
                        return StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection('profile').doc(myId).snapshots(),
                            builder: (context, snapshot) {
                              if(snapshot.hasData&&snapshot.data!.exists){
                                Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                                if(data['profileImgUrl'] == ""){
                                  return const Icon(Icons.image);
                                }else{
                                  return CircleAvatar(
                                    radius: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?100:60,
                                    backgroundImage: NetworkImage('${data['profileImgUrl']}'),
                                  );
                               }
                              }else {
                                return Container(
                                  height: 100,width: 100,
                                  color: Colors.grey,
                                  child: const Text('画像を登録',style: TextStyle(color: Colors.black45),),);
                              }
                            }
                          );
                      }
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance.collection('profile').doc(myId).snapshots(),
                                builder: (context, snapshot){
                                  if(snapshot.hasData&&snapshot.data!.exists){
                                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                                    return Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text('${data['userName']}',style: TextStyle(fontSize: 23),));
                                  }else{
                                    return const Text(
                                        'プロフィール編集よりユーザーネームを登録してください',
                                        style: TextStyle(fontSize: 15,color: Colors.grey),
                                    );
                                  }
                                },
                              ),
                            const SizedBox(height: 5,),
                            StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance.collection('profile').doc(myId).snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.data!.exists) {
                                    Map<String, dynamic> data = snapshot.data!
                                        .data() as Map<String, dynamic>;
                                    return Container(
                                        alignment: Alignment.centerRight,
                                        child: data['goodOshiten'] == null ?
                                        const Text('グッドオシテン　　0',style: TextStyle(fontSize: 17,))
                                        :Text('グッドオシテン  ${data['goodOshiten']}',style: const TextStyle(fontSize: 17,)),
                                    );
                                  }else{
                                    return Container();
                                  }
                                }
                            ),
                            const SizedBox(height: 5,),
                            Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyPageEdit();})),
                                  child: const Text('プロフィール編集',
                                      style: TextStyle(fontSize: 17,decoration: TextDecoration.underline))
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection('profile').doc(myId).snapshots(),
                builder: (context, snapshot){
                  if(snapshot.hasData&&snapshot.data!.exists){
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    return Container(
                      alignment: Alignment.centerLeft,
                        child: Text(data['comment'],style: const TextStyle(fontSize: 15),));
                  }else{
                    return const Text(
                      'コメントを登録',
                      style: TextStyle(fontSize: 15,color: Colors.grey),
                    );
                  }
                },
              ),
              const SizedBox(height: 30,),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text('推した店',style: TextStyle(fontSize: 20),),
              ),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                    300:150,
                    width: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                    300:150,
                    child: Image.asset('images/profilePic/pic2.png'),
                  ),
                  const SizedBox(width: 20,),
                  const Text('このお店を紹介しました',style: TextStyle(fontSize: 15),)
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text('推してもらった店',style: TextStyle(fontSize: 20),),
              ),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                    300:150,
                    width: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                    300:150,
                    child: Image.asset('images/profilePic/pic4.png'),
                  ),
                  const SizedBox(width: 20,),
                  const Flexible(
                    child: (
                      Text('このお店を紹介してもらいました',style: TextStyle(fontSize: 15),)
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
