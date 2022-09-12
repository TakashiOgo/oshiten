import 'package:flutter/material.dart';
import 'package:oshiten_app/myBottomNavigationBar.dart';
import 'oshimatiChoice.dart';
import 'main.dart';
import 'search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Oshimati extends StatelessWidget {
  const Oshimati({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('推し待ち'),
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
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyBottomNavigationBar(selectedIndex: 0);})),
                  child: const Text('新しく探す', style: TextStyle(fontSize: 15),),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Consumer<SearchProvider>(
                builder: (context, search, child) {
                  return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('conditions').doc(search.myId).collection('eachCondition').snapshots(),
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
                                            return OshimatiChoice(
                                              prefecture: conditionData['prefecture'],
                                              genre: conditionData['genre'],
                                              minPrice: conditionData['minPrice'],
                                              maxPrice: conditionData['maxPrice'],
                                              age: conditionData['age'],
                                              scene: conditionData['scene'],
                                              atmosphere: conditionData['atmosphere'],
                                              parking: conditionData['parking'],
                                            );
                                          })),
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
                        return const Center(child: Text('推し待ちの条件が登録されていません',style: TextStyle(fontSize: 20),),);
                      }
                  );
                }
              ),
            ],
          ),
        ),
    );
  }
}