import 'package:flutter/material.dart';
import 'myBottomNavigationBar.dart';
import 'oshimatiDetail.dart';

class OshimatiChoice extends StatelessWidget {
  const OshimatiChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('推し待ち'),
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
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Text('東京都　　　和食　　　1,000〜3,000　　　20代　　　友人　　　大衆　　　駐車場：有',
                    style: TextStyle(fontSize: 20),),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(height: 40,),
              Container(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(),
                  ),
                  onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return OshimatiDetail();})),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                        300:100,
                        width: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                        300:100,
                        child: Image.asset('images/profilePic/pic2.png'),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(child: Text('店名',style: TextStyle(fontSize: 20),),),
                            SizedBox(height: 10,),
                            Container(
                              child: Text('このお店は最高です！ぜひ行ってみてください！！',style: TextStyle(fontSize: 15),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text('BO',style: TextStyle(fontSize: 25),),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
