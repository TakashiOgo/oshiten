import 'package:flutter/material.dart';
import 'conditionsDetail.dart';
import 'myBottomNavigationBar.dart';
import 'conditionsSort.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'oshimatiChoice.dart';

class ConditionsSortResults extends StatelessWidget {
  const ConditionsSortResults({Key? key}) : super(key: key);

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
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Consumer<SortProvider>(
                builder: (context, sort, child) {
                  return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collectionGroup('eachCondition')
                      .where("prefecture",isEqualTo: sort.selectedPrefectureValue)
                      .where("genre",isEqualTo: sort.selectedGenreValue)
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
                                        return ConditionsDetail(
                                          prefecture: conditionData['prefecture'],
                                          genre: conditionData['genre'],
                                          minPrice: conditionData['minPrice'],
                                          maxPrice: conditionData['maxPrice'],
                                          age: conditionData['age'],
                                          scene: conditionData['scene'],
                                          atmosphere: conditionData['atmosphere'],
                                          parking: conditionData['parking'],
                                          userName: conditionData['userName'],
                                          profileImg: conditionData['profileImg'],
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
                        return const Center(child: CircularProgressIndicator(),);
                      }
                  );
                }
              ),
              Container(height: 10,),
            ]
          ),
        ),
    );
  }
}
