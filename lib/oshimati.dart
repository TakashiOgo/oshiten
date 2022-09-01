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
                      stream: FirebaseFirestore.instance.collection('conditions').snapshots(),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          List<DocumentSnapshot> conditionsData = snapshot.data!.docs;
                          if(conditionsData[8] == search.uid){
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
                                        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return OshimatiChoice();})),
                                        child: Text(
                                          '${conditionData['prefecture']}, '
                                              '${conditionData['genre']},　'
                                              '${conditionData['minPrice']}〜${conditionData['maxPrice']},　'
                                              '${conditionData['age']},　'
                                              '${conditionData['scene']},　'
                                              '${conditionData['atmosphere']}',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            );
                          }
                          return Text('まだ登録されていません');
                        }
                        return const Center(child: CircularProgressIndicator(),);
                      }
                  );
                }
              ),
              Container(height: 10,),
            ],
          ),
        ),
    );
  }
}