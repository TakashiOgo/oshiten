import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myBottomNavigationBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'searchDetail.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoodOshiten extends ChangeNotifier{

  bool checkedGoodOshiten = false;
  String myId = FirebaseAuth.instance.currentUser!.uid;
  int goodOshitenValue = 0;


  void changeGoodOshiten() {
    checkedGoodOshiten = true;
    goodOshitenValue = 1;
    notifyListeners();
  }

  final snackBar = const SnackBar(
    backgroundColor: Colors.blue,
    content: Text('グッドオシテンに認定しました！', style: TextStyle(color: Colors.white, fontSize: 24,),),
  );

}

class OshimatiDetail extends StatelessWidget {
  OshimatiDetail({Key? key,
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
    required this.userId,
    required this.data,
    required this.goodOshiten,
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
  String userId = "";
  String data = "";
  int goodOshiten = 0;

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
              Container(
                width: MediaQuery.of(context).size.width/2,
                    alignment: Alignment.centerRight,
                    child: Consumer<GoodOshiten>(
                        builder: (context, goodoshiten, child) {
                          return StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance.collection('store')
                              .where('imgUrl',isEqualTo: imgUrl).snapshots(),
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  List<DocumentSnapshot> storesData = snapshot.data!.docs;
                                  return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(10),
                                        primary: goodoshiten.checkedGoodOshiten?Colors.black:Colors.white,
                                        onPrimary: goodoshiten.checkedGoodOshiten?Colors.white:Colors.black,
                                        shape: const StadiumBorder(),
                                      ),
                                      onPressed: goodoshiten.checkedGoodOshiten == true?null:() {
                                        goodoshiten.changeGoodOshiten();
                                        FirebaseFirestore.instance.collection('profile').doc(userId).update({
                                          'goodOshiten': FieldValue.increment(1),
                                        });
                                        FirebaseFirestore.instance.collection('store').doc(data).update({
                                          'goodOshiten': FieldValue.increment(1),
                                        });
                                        Future.delayed(Duration(seconds: 2),(){});
                                        ScaffoldMessenger.of(context).showSnackBar(goodoshiten.snackBar);
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.thumb_up_alt),
                                          Text('グッドオシテン',style: TextStyle(fontSize: 20),),
                                        ],
                                      )
                                  );
                                }else{
                                  return Container();
                                }
                            }
                          );
                      }
                    ),
                ),
            ],
          ),
        ),
      )
    );
  }
}
