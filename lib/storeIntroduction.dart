import 'package:flutter/material.dart';
import 'conditionsLineUp.dart';
import 'myBottomNavigationBar.dart';

class StoreIntroduction extends StatelessWidget {
  const StoreIntroduction({Key? key}) : super(key: key);

  final snackBar = const SnackBar(
    backgroundColor: Colors.blue,
    content: Text('オシテンされました！', style: TextStyle(color: Colors.white, fontSize: 24,),),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('店紹介'),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyBottomNavigationBar(selectedIndex: 3,);})),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                MediaQuery.of(context).size.height/3:MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                MediaQuery.of(context).size.width/1.5:MediaQuery.of(context).size.width/1,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(15),
                child: Text('店名',style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(15),
                child: Text('コメント　　コメント　　コメント',style: TextStyle(fontSize: 15),),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(20),
                child: Text('東京都　　　和食　　　1,000〜3,000　　　20代　　　友人　　　大衆　　　駐車場：有',
                  style: TextStyle(fontSize: 20),),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Future.delayed(Duration(seconds: 2),(){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyBottomNavigationBar(selectedIndex: 2);}));
                      });
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: const Text('オシテン！',style: TextStyle(fontSize: 20),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
