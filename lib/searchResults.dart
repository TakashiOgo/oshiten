import 'package:flutter/material.dart';
import 'conditionsDetail.dart';
import 'searchDetail.dart';
import 'myBottomNavigationBar.dart';
import 'package:provider/provider.dart';
import 'search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SearchResults extends StatelessWidget {
  SearchResults({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('検索結果'),
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
              Consumer<SearchProvider>(
                  builder: (context, search, child) {
                    return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('store')
                            .where("prefecture",isEqualTo: search.selectedPrefectureValue)
                            .where("genre",isEqualTo: search.selectedGenreValue)
                            // .where("maxPrice",isGreaterThan: search.selectedMaxPriceValue)
                            .where("minPrice",isEqualTo: search.selectedMinPriceValue)
                            .where("maxPrice",isEqualTo: search.selectedMaxPriceValue)
                            .where('age',arrayContainsAny: search.ageLists)
                            .where('scene',isEqualTo: search.selectedSceneValue)
                            .where('atmosphere',isEqualTo: search.selectedAtmosphereValue)
                            // .where("teenAge",isEqualTo: search.teenAgeValue)
                            // .where("twentiesAge",isEqualTo: search.twentiesValue)
                            // .where("thirtiesAge",isEqualTo: search.thirtiesValue)
                            // .where("fortiesAge",isEqualTo: search.fortiesValue)
                            // .where("fiftiesAge",isEqualTo: search.fiftiesValue)
                            // .where("overSixtiesAge",isEqualTo: search.overSixtiesValue)
                            // .where('pretty',isEqualTo: search.prettyValue)
                            // .where('luxury',isEqualTo: search.luxuryValue)
                            // .where('retro',isEqualTo: search.retroValue)
                            // .where('public',isEqualTo: search.publicValue)
                            .where("parking",isEqualTo: search.parking)
                            // .where("scene",whereIn: [search.sceneLists])
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
                                      padding: EdgeInsets.all(10),
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          padding: EdgeInsets.all(30),
                                          primary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          side: BorderSide(),
                                        ),
                                        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                          return SearchDetail(
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
                                          );})),
                                        child: Text(
                                          '${conditionData['prefecture']}  '+
                                          '${conditionData['genre']}　 '+
                                          '${conditionData['minPrice']}〜${conditionData['maxPrice']}　'+
                                          '${conditionData['age']}'.substring(1,'${conditionData['age']}'.length-1)+
                                          '    '+
                                          '${conditionData['scene']}'
                                              // .substring(1,'${conditionData['scene']}'.length-1)+
                                          '    '+
                                          '${conditionData['atmosphere']}'
                                              // .substring(1,'${conditionData['atmosphere']}'.length-1)+
                                          '    '+
                                          '${conditionData['parking']}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            );
                          }
                          return const Center(child: Text("この条件のお店は、まだオシテンされていません。",style: TextStyle(fontSize: 30),),);
                        }
                    );
                  }
              ),
              Container(height: 30,),
            ],
        ),
      ),
    );
  }
}
