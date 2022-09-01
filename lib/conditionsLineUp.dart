import 'package:flutter/material.dart';
import 'conditionsDetail.dart';
import 'conditionsSort.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConditionsLineUp extends StatelessWidget {
  const ConditionsLineUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('推す'),
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
                alignment: Alignment.topRight,
                child: ElevatedButton(
                    onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return ConditionsSort();})),
                    child: const Text('絞り込み',style: TextStyle(fontSize: 15),)
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: OutlinedButton(
                  child: Text(
                    '東京都　　　和食　　　1,000〜3,000　　　20代　　　友人　　　大衆　　　駐車場：有',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(),
                  ),
                  onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return ConditionsDetail();})),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: OutlinedButton(
                  child: Text(
                    '東京都　　　和食　　　1,000〜3,000　　　20代　　　友人　　　大衆　　　駐車場：有',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(),
                  ),
                  onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return ConditionsDetail();})),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
