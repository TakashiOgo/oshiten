import 'package:flutter/material.dart';
import 'package:oshiten_app/conditionsDetail.dart';
import 'conditionsSort.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      body: Container(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                    onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return ConditionsSort();})),
                    child: const Text('絞り込み',style: TextStyle(fontSize: 15),),
                  style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.all(15))),
                ),
              ),
              SizedBox(height: 20,),
              Consumer<SortProvider>(
                  builder: (context, sort, child) {
                    return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collectionGroup('eachCondition').snapshots(),
                        builder: (context, snapshot){
                          if(snapshot.hasData){
                            List<DocumentSnapshot> eachConditionsData = snapshot.data!.docs;
                            return Expanded(
                              child: ListView.builder(
                                  itemCount: eachConditionsData.length,
                                  itemBuilder: (context, index){
                                    Map<String, dynamic> eachConditionData = eachConditionsData[index].data() as Map<String, dynamic>;
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
                                            prefecture: eachConditionData['prefecture'],
                                            genre: eachConditionData['genre'],
                                            minPrice: eachConditionData['minPrice'],
                                            maxPrice: eachConditionData['maxPrice'],
                                            age: eachConditionData['age'],
                                            scene: eachConditionData['scene'],
                                            atmosphere: eachConditionData['atmosphere'],
                                            parking: eachConditionData['parking'],
                                            userName: eachConditionData['userName'],
                                            profileImg: eachConditionData['profileImg'],
                                          );
                                        })),
                                        child: Text(
                                          '${eachConditionData['prefecture']}  '+
                                          '${eachConditionData['genre']}　 '+
                                          '${eachConditionData['minPrice']}〜${eachConditionData['maxPrice']}　'+
                                          '${eachConditionData['age']}'.substring(1,'${eachConditionData['age']}'.length-1)+
                                          '    '+
                                          '${eachConditionData['scene']}'
                                              // .substring(1,'${eachConditionData['scene']}'.length-1)+
                                          '    '+
                                          '${eachConditionData['atmosphere']}'
                                              // .substring(1,'${eachConditionData['atmosphere']}'.length-1)+
                                          '    '+
                                          '${eachConditionData['parking']}',
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
            ],
          ),
        ),
      ),
    );
  }
}
