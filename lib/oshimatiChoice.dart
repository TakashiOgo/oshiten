import 'package:flutter/material.dart';
import 'myBottomNavigationBar.dart';
import 'oshimatiDetail.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'search.dart';

class OshimatiChoice extends StatelessWidget {
  OshimatiChoice({Key? key,
    required this.prefecture,
    required this.genre,
    required this.minPrice,
    required this.maxPrice,
    required this.age,
    required this.scene,
    required this.atmosphere,
    required this.parking,
  }) : super(key: key);
  String prefecture = "";
  String genre = "";
  String minPrice = "";
  String maxPrice = "";
  List<dynamic> age = [];
  String scene = "";
  String atmosphere = "";
  String parking = "";


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
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
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
                  style: TextStyle(fontSize: 20),),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: 40,),
            Container(
              child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('store')
                            .where("prefecture",isEqualTo: prefecture)
                            .where("genre",isEqualTo: genre)
                            .where("minPrice",isEqualTo: minPrice)
                            .where("maxPrice",isEqualTo: maxPrice)
                            .where('age',arrayContainsAny: age)
                            .where('scene',isEqualTo: scene)
                            .where('atmosphere',isEqualTo: atmosphere)
                            .where("parking",isEqualTo: parking)
                            .snapshots(),
                        builder: (context, snapshot){
                          if(snapshot.hasData){
                            List<DocumentSnapshot> conditionsData = snapshot.data!.docs;
                            return Expanded(
                              child: ListView.builder(
                                  itemCount: conditionsData.length,
                                  itemBuilder: (context, index){
                                    Map<String, dynamic> conditionData = conditionsData[index].data() as Map<String, dynamic>;
                                    return Container(
                                      width: double.infinity,
                                      // padding: EdgeInsets.all(10),
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.all(10),
                                          primary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          side: BorderSide(),
                                        ),
                                        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                          return OshimatiDetail(
                                            prefecture: conditionData['prefecture'],
                                            genre: conditionData['genre'],
                                            minPrice: conditionData['minPrice'],
                                            maxPrice: conditionData['maxPrice'],
                                            age: conditionData['age'],
                                            scene: conditionData['scene'],
                                            atmosphere: conditionData['atmosphere'],
                                            parking: conditionData['parking'],
                                            imgUrl: conditionData['imgUrl'],
                                            storeName: conditionData['storeName'],
                                            introduction: conditionData['introduction'],
                                            profileImg: conditionData['profileImg'],
                                            userName: conditionData['userName'],
                                            userId: conditionData['myId'],
                                            data: conditionData['data'],
                                            goodOshiten: conditionData['goodOshiten']
                                          );})),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              child: Image(image: NetworkImage(conditionData['imgUrl'])),
                                            ),
                                            SizedBox(width: 20,),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(child: Text(conditionData['storeName'],style: TextStyle(fontSize: 20),),),
                                                        SizedBox(height: 10,),
                                                        Container(
                                                          child: Text(conditionData['introduction'],style: TextStyle(fontSize: 15),),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                            Consumer<GoodOshiten>(
                                                builder: (context, goodoshiten, child) {
                                                      return goodoshiten.goodOshitenValue == 1?Container(
                                                        padding: EdgeInsets.all(10),
                                                        child: Text('BO',style: TextStyle(fontSize: 25),),
                                                        decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                      ):Container();
                                                    }
                                                  ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            );
                          }
                          return const Center(child: Text("この条件のお店は、まだオシテンされていません。",style: TextStyle(fontSize: 30),),);
                        }
                    ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
