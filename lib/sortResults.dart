import 'package:flutter/material.dart';
import 'conditionsDetail.dart';
import 'myBottomNavigationBar.dart';

class SortResults extends StatelessWidget {
  const SortResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('絞り込み結果'),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyBottomNavigationBar(selectedIndex: 3,);})),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
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
