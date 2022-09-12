import 'package:flutter/material.dart';
import 'myBottomNavigationBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StorePic extends ChangeNotifier{

  int picIndex = 0;

  void changePicIndex(int index){
    picIndex = index;
    notifyListeners();
  }

}

List<Widget> storePic = [
  Image.asset('images/profilePic/pic2.png'),
  Image.asset('images/profilePic/pic3.png'),
  Image.asset('images/profilePic/pic4.png'),
  Image.asset('images/profilePic/pic5.png'),
];

class SearchDetail extends StatelessWidget {
  SearchDetail({Key? key,
    required this.prefecture,
    required this.genre,
    required this.minPrice,
    required this.maxPrice,
    required this.age,
    required this.scene,
    required this.atmosphere,
    required this.parking,
    required this.imgUrl,
    required this.storeName,
    required this.introduction,
    required this.profileImg,
    required this.userName,
  }) : super(key: key);

  String prefecture = "";
  String genre = "";
  String minPrice = "";
  String maxPrice = "";
  List<dynamic> age = [];
  String scene = "";
  String atmosphere = "";
  String parking = "";
  String imgUrl = "";
  String storeName = "";
  String introduction = "";
  String profileImg = "";
  String userName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('お店詳細'),
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
                  padding: EdgeInsets.all(15),
                  child: Image(image: NetworkImage(imgUrl)),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text('${storeName}',style: TextStyle(fontSize: 20),),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text('${introduction}',style: TextStyle(fontSize: 18),),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Consumer<SearchProvider>(
                      builder: (context, search, child) {
                        return Text(
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
                          style: TextStyle(fontSize: 20,),);
                      }
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?100:50,
                        backgroundImage: NetworkImage('${profileImg}'),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(child: Text('${userName}',style: TextStyle(fontSize: 20),),),
                            SizedBox(height: 10,),
                            // Container(
                            //   child: Text('このお店は最高です！ぜひ行ってみてください！！',style: TextStyle(fontSize: 15),),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
