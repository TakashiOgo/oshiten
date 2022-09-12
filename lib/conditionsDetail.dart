import 'package:flutter/material.dart';
import 'storeIntroduction.dart';
import 'myBottomNavigationBar.dart';

class ConditionsDetail extends StatelessWidget {
  ConditionsDetail({Key? key,
    required this.prefecture,
    required this.genre,
    required this.minPrice,
    required this.maxPrice,
    required this.age,
    required this.scene,
    required this.atmosphere,
    required this.parking,
    required this.userName,
    required this.profileImg,
  }) : super(key: key);
  String prefecture = "";
  String genre = "";
  String minPrice = "";
  String maxPrice = "";
  List<dynamic> age = [];
  String scene = "";
  String atmosphere = "";
  String parking = "";
  String userName = "";
  String profileImg = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('条件詳細'),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return const MyBottomNavigationBar(selectedIndex: 3,);})),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?100:50,
                    backgroundImage: NetworkImage('${profileImg}'),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text('${userName}',style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Text(
                '${prefecture}  '+
                    '${genre}　 '+
                    '${minPrice}〜${maxPrice}　'+
                    '${age}'.substring(1,'${age}'.length-1)+
                    '    '+
                    '${scene}'
                        // .substring(1,'${scene}'.length-1)+
                    '    '+
                    '${atmosphere}'
                        // .substring(1,'${atmosphere}'.length-1)+
                    '    '+
                    '${parking}',
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
                    onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return StoreIntroduction(
                        prefecture: prefecture,
                        genre: genre,
                        minPrice: minPrice,
                        maxPrice: maxPrice,
                        age: age,
                        scene: scene,
                        atmosphere: atmosphere,
                        parking: parking,
                      );
                    })),
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
