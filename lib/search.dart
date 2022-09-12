import 'package:flutter/material.dart';
import 'package:oshiten_app/myBottomNavigationBar.dart';
import 'oshimati.dart';
import 'searchResults.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchProvider extends ChangeNotifier {

  var selectedPrefectureValue = "北海道";
  static final prefecturesLists = <String>[
    "北海道","青森県","秋田県","岩手県","山形県","宮城県","福島県",
    "茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県",
    "新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県",
    "三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県",
    "鳥取県","島根県","岡山県","広島県","山口県",
    "徳島県","香川県","愛媛県","高知県",
    "福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"
  ];
  var selectedGenreValue = "和食";
  static final genreLists = <String>[
    "和食","イタリアン","フレンチ","中華","西洋","アジア・エスニック","創作料理","居酒屋・バー","カフェ",
    "ラーメン","カレー","焼肉","鍋","パン","スイーツ"
  ];
  var selectedMinPriceValue = "下限なし";
  static final minPriceLists = <String>[
    "下限なし","¥1,000","¥2,000","¥3,000","¥4,000","¥5,000","¥6,000","¥8,000","¥10,000","¥15,000","¥20,000"
  ];
  var selectedMaxPriceValue = "上限なし";
  static final maxPriceLists = <String>[
    "上限なし","¥1,000","¥2,000","¥3,000","¥4,000","¥5,000","¥6,000","¥8,000","¥10,000","¥15,000","¥20,000"
  ];
  var selectedSceneValue = "友人";
  static final sceneLists = <String>[
    "友人","家族","会社","会食","デート"
  ];
  var selectedAtmosphereValue = "キレイめ";
  static final atmosphereLists = <String>[
    "キレイめ","高級","レトロ","大衆"
  ];

  bool teenAgeChecked = false;
  bool twentiesChecked = false;
  bool thirtiesChecked = false;
  bool fortiesChecked = false;
  bool fiftiesChecked = false;
  bool overSixtiesChecked = false;
  // bool friendChecked = false;
  // bool familyChecked = false;
  // bool companyChecked = false;
  // bool memorialDinnerChecked = false;
  // bool datingChecked = false;
  // bool prettyChecked = false;
  // bool luxuryChecked = false;
  // bool retroChecked = false;
  // bool publicChecked = false;
  bool parkingChecked = true;
  bool noParkingChecked = false;
  bool parkingCheckedGroup = true;

  String parking = "駐車場 : 有";

  List<String> ageLists = [];
  // List<String> sceneLists = [];
  // List<String> atmosphereLists = [];
  String teenAgeValue = "";
  String twentiesValue = "";
  String thirtiesValue = "";
  String fortiesValue = "";
  String fiftiesValue = "";
  String overSixtiesValue = "";
  // String prettyValue = "";
  // String luxuryValue = "";
  // String retroValue = "";
  // String publicValue = "";

  String myId = FirebaseAuth.instance.currentUser!.uid;


  void sortAgeLists() {
    ageLists.sort();
    notifyListeners();
  }

  void changePrefecture(String? value){
    selectedPrefectureValue = value!;
    notifyListeners();
  }

  void changeGenre(String? value){
    selectedGenreValue = value!;
    notifyListeners();
  }

  void changeMinPrice(String? value){
    selectedMinPriceValue = value!;
    notifyListeners();
  }

  void changeMaxPrice(String? value){
    selectedMaxPriceValue = value!;
    notifyListeners();
  }

  void changeTeenAge(bool? value){
    teenAgeChecked = value!;
    ageLists.contains("10代")? ageLists.remove("10代"): ageLists.add("10代");
    teenAgeValue == ""?teenAgeValue = "10代": teenAgeValue = "";
    notifyListeners();
  }

  void changeTwenties(bool? value){
    twentiesChecked = value!;
    ageLists.contains("20代")? ageLists.remove("20代"): ageLists.add("20代");
    twentiesValue == ""?twentiesValue = "20代": twentiesValue = "";
    notifyListeners();
  }

  void changeThirties(bool? value){
    thirtiesChecked = value!;
    ageLists.contains("30代")? ageLists.remove("30代"): ageLists.add("30代");
    thirtiesValue == ""?thirtiesValue = "30代": thirtiesValue = "";
    notifyListeners();
  }

  void changeForties(bool? value){
    fortiesChecked = value!;
    ageLists.contains("40代")? ageLists.remove("40代"): ageLists.add("40代");
    fortiesValue == ""?fortiesValue = "40代": fortiesValue = "";
    notifyListeners();
  }

  void changeFifties(bool? value){
    fiftiesChecked = value!;
    ageLists.contains("50代")? ageLists.remove("50代"): ageLists.add("50代");
    fiftiesValue == ""?fiftiesValue = "50代": fiftiesValue = "";
    notifyListeners();
  }

  void changeOverSixties(bool? value){
    overSixtiesChecked = value!;
    ageLists.contains("60代")? ageLists.remove("60代"): ageLists.add("60代");
    overSixtiesValue == ""?overSixtiesValue = "60代以上": overSixtiesValue = "";
    notifyListeners();
  }

  void changeScene(String? value){
    selectedSceneValue = value!;
    // sceneLists.contains("友人")? sceneLists.remove("友人"): sceneLists.add("友人");
    notifyListeners();
  }

  void changeAtmosphere(String? value){
    selectedAtmosphereValue = value!;
    // sceneLists.contains("友人")? sceneLists.remove("友人"): sceneLists.add("友人");
    notifyListeners();
  }

  // void changeFriend(bool? value){
  //   friendChecked = value!;
  //   sceneLists.contains("友人")? sceneLists.remove("友人"): sceneLists.add("友人");
  //   notifyListeners();
  // }
  //
  // void changeFamily(bool? value){
  //   familyChecked = value!;
  //   sceneLists.contains("家族")? sceneLists.remove("家族"): sceneLists.add("家族");
  //   notifyListeners();
  // }
  //
  // void changeCompany(bool? value){
  //   companyChecked = value!;
  //   sceneLists.contains("会社")? sceneLists.remove("会社"): sceneLists.add("会社");
  //   notifyListeners();
  // }
  //
  // void changeMemorialDinner(bool? value){
  //   memorialDinnerChecked = value!;
  //   sceneLists.contains("会食")? sceneLists.remove("会食"): sceneLists.add("会食");
  //   notifyListeners();
  // }
  //
  // void changeDating(bool? value){
  //   datingChecked = value!;
  //   sceneLists.contains("デート")? sceneLists.remove("デート"): sceneLists.add("デート");
  //   notifyListeners();
  // }

  // void changePretty(bool? value){
  //   prettyChecked = value!;
  //   atmosphereLists.contains("キレイめ")? atmosphereLists.remove("キレイめ"): atmosphereLists.add("キレイめ");
  //   prettyValue == ""?prettyValue = "キレイめ": prettyValue = "";
  //   notifyListeners();
  // }
  //
  // void changeLuxury(bool? value){
  //   luxuryChecked = value!;
  //   atmosphereLists.contains("高級")? atmosphereLists.remove("高級"): atmosphereLists.add("高級");
  //   luxuryValue == ""?luxuryValue = "高級": luxuryValue = "";
  //   notifyListeners();
  // }
  //
  // void changeRetro(bool? value){
  //   retroChecked = value!;
  //   atmosphereLists.contains("レトロ")? atmosphereLists.remove("レトロ"): atmosphereLists.add("レトロ");
  //   retroValue == ""?retroValue = "レトロ": retroValue = "";
  //   notifyListeners();
  // }
  //
  // void changePublic(bool? value){
  //   publicChecked = value!;
  //   atmosphereLists.contains("大衆")? atmosphereLists.remove("大衆"): atmosphereLists.add("大衆");
  //   publicValue == ""?publicValue = "大衆": publicValue = "";
  //   notifyListeners();
  // }

  void changeParking(bool? value) {
    parkingCheckedGroup = value!;
    parkingChecked == true?parking = "駐車場 : 有":"駐車場 : 無";
    notifyListeners();
  }

}

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);

  bool _isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('検索'),
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: Consumer<SearchProvider>(
                      builder: (context, search, child) {
                        search.ageLists.isNotEmpty
                            ? _isDisabled = true: _isDisabled = false;
                        return StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection('profile').doc(search.myId).snapshots(),
                            builder: (context, snapshot) {
                              if(snapshot.hasData&&snapshot.data!.exists) {
                              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                                return ElevatedButton(
                                  onPressed: _isDisabled ? () {
                                    FirebaseFirestore.instance.collection('conditions').doc(search.myId).collection('eachCondition').add({
                                      'prefecture': search.selectedPrefectureValue,
                                      'genre': search.selectedGenreValue,
                                      'minPrice': search.selectedMinPriceValue,
                                      'maxPrice': search.selectedMaxPriceValue,
                                      'age': search.ageLists,
                                      'teenAge': search.teenAgeChecked,
                                      'twentiesAge': search.twentiesChecked,
                                      'thirtiesAge': search.thirtiesChecked,
                                      'fortiesAge': search.fortiesChecked,
                                      'fiftiesAge': search.fiftiesChecked,
                                      'overSixtiesAge': search.overSixtiesChecked,
                                      'scene': search.selectedSceneValue,
                                      'atmosphere': search.selectedAtmosphereValue,
                                      'parking': search.parking,
                                      'date': DateTime.now().toString(),
                                      'userName': data['userName'],
                                      'profileImg': data['profileImgUrl'],
                                    });
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                      return MyBottomNavigationBar(selectedIndex: 1);
                                    }));
                                  } : null,
                                  child: const Text('新しく登録する', style: TextStyle(fontSize: 15),)
                                );
                              }else{
                                return Container();
                              }
                          }
                        );
                      }
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Consumer<SearchProvider>(
                      builder: (context, search, child) {
                        return ElevatedButton(
                            onPressed: (){
                              search.sortAgeLists();
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context){
                                  return SearchResults(
                                  );
                                })
                             );
                            }
                                ,
                            child: const Text('検索',style: TextStyle(fontSize: 15),)
                        );
                      }
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text('エリア'),
                    ),
                    Container(
                        child: Consumer<SearchProvider>(
                          builder: (context, search, child) {
                            return DropdownButton<String>(
                              value: search.selectedPrefectureValue,
                              items: SearchProvider.prefecturesLists.map((String list)=>
                                  DropdownMenuItem(value: list,child: Text(list))).toList(),
                              onChanged: (String? value){
                                search.changePrefecture(value);
                              },
                            );
                          },
                        )
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text('ジャンル'),
                    ),
                    Container(
                        child: Consumer<SearchProvider>(
                          builder: (context, search, child) {
                            return DropdownButton<String>(
                              value: search.selectedGenreValue,
                              items: SearchProvider.genreLists.map((String list)=>
                                  DropdownMenuItem(value: list,child: Text(list))).toList(),
                              onChanged: (String? value){
                                search.changeGenre(value);
                              },
                            );
                          },
                        )
                    ),
                  ],
                )
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Text('価格'),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Consumer<SearchProvider>(
                              builder: (context, search, child) {
                                return DropdownButton<String>(
                                  value: search.selectedMinPriceValue,
                                  items: SearchProvider.minPriceLists.map((String list)=>
                                      DropdownMenuItem(value: list,child: Text(list))).toList(),
                                  onChanged: (String? value){
                                    search.changeMinPrice(value);
                                  },
                                );
                              },
                            )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/10,
                            alignment: Alignment.center,
                            child: Text('~'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Consumer<SearchProvider>(
                              builder: (context, search, child) {
                                return DropdownButton<String>(
                                  value: search.selectedMaxPriceValue,
                                  items: SearchProvider.maxPriceLists.map((String list)=>
                                      DropdownMenuItem(value: list,child: Text(list))).toList(),
                                  onChanged: (String? value){
                                    search.changeMaxPrice(value);
                                  },
                                );
                              },
                            )
                          )
                        ]
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Text('年齢'),
                    ),
                    Container(
                      child: Wrap(
                        children: [
                          Container(
                            width: 130,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child) {
                                  return CheckboxListTile(
                                      title: Text('10代'),
                                      value: search.teenAgeChecked,
                                      onChanged: (bool? value) {
                                        search.changeTeenAge(value);
                                      }
                                  );
                                }
                            ),
                          ),
                          Container(
                            width: 130,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('20代'),
                                      value: search.twentiesChecked,
                                      onChanged: (bool? value) {
                                        search.changeTwenties(value);
                                      }
                                  );
                                }
                            ),
                          ),
                          Container(
                            width: 130,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('30代'),
                                      value: search.thirtiesChecked,
                                      onChanged: (bool? value) {
                                        search.changeThirties(value);
                                      }
                                  );
                                }
                            ),
                          ),
                          Container(
                            width: 130,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('40代'),
                                      value: search.fortiesChecked,
                                      onChanged: (bool? value) {
                                        search.changeForties(value);
                                      }
                                  );
                                }
                            ),
                          ),
                          Container(
                            width: 130,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('50代'),
                                      value: search.fiftiesChecked,
                                      onChanged: (bool? value) {
                                        search.changeFifties(value);
                                      }
                                  );
                                }
                            ),
                          ),
                          Container(
                            width: 160,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('60代以上'),
                                      value: search.overSixtiesChecked,
                                      onChanged: (bool? value) {
                                        search.changeOverSixties(value);
                                      }
                                  );
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text('シーン'),
                      ),
                      Container(
                          child: Consumer<SearchProvider>(
                            builder: (context, search, child) {
                              return DropdownButton<String>(
                                value: search.selectedSceneValue,
                                items: SearchProvider.sceneLists.map((String list)=>
                                    DropdownMenuItem(value: list,child: Text(list))).toList(),
                                onChanged: (String? value){
                                  search.changeScene(value);
                                },
                              );
                            },
                          )
                      ),
                    ],
                  )
              ),
              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.blueGrey),
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   child: Column(
              //     children: [
              //       Container(
              //         child: Text('シーン'),
              //       ),
              //       Container(
              //         child: Wrap(
              //           children: [
              //             Container(
              //               width: 120,
              //               child: Consumer<SearchProvider>(
              //                   builder: (context, search, child) {
              //                     return CheckboxListTile(
              //                         title: Text('友人'),
              //                         value: search.friendChecked,
              //                         onChanged: (bool? value) {
              //                           search.changeFriend(value);
              //                         }
              //                     );
              //                   }
              //               ),
              //             ),
              //             Container(
              //               width: 120,
              //               child: Consumer<SearchProvider>(
              //                   builder: (context, search, child){
              //                     return CheckboxListTile(
              //                         title: Text('家族'),
              //                         value: search.familyChecked,
              //                         onChanged: (bool? value) {
              //                           search.changeFamily(value);
              //                         }
              //                     );
              //                   }
              //               ),
              //             ),
              //             Container(
              //               width: 120,
              //               child: Consumer<SearchProvider>(
              //                   builder: (context, search, child){
              //                     return CheckboxListTile(
              //                         title: Text('会社'),
              //                         value: search.companyChecked,
              //                         onChanged: (bool? value) {
              //                           search.changeCompany(value);
              //                         }
              //                     );
              //                   }
              //               ),
              //             ),
              //             Container(
              //               width: 120,
              //               child: Consumer<SearchProvider>(
              //                   builder: (context, search, child){
              //                     return CheckboxListTile(
              //                         title: Text('会食'),
              //                         value: search.memorialDinnerChecked,
              //                         onChanged: (bool? value) {
              //                           search.changeMemorialDinner(value);
              //                         }
              //                     );
              //                   }
              //               ),
              //             ),
              //             Container(
              //               width: 140,
              //               child: Consumer<SearchProvider>(
              //                   builder: (context, search, child){
              //                     return CheckboxListTile(
              //                         title: Text('デート'),
              //                         value: search.datingChecked,
              //                         onChanged: (bool? value) {
              //                           search.changeDating(value);
              //                         }
              //                     );
              //                   }
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 10,),
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text('雰囲気'),
                      ),
                      Container(
                          child: Consumer<SearchProvider>(
                            builder: (context, search, child) {
                              return DropdownButton<String>(
                                value: search.selectedAtmosphereValue,
                                items: SearchProvider.atmosphereLists.map((String list)=>
                                    DropdownMenuItem(value: list,child: Text(list))).toList(),
                                onChanged: (String? value){
                                  search.changeAtmosphere(value);
                                },
                              );
                            },
                          )
                      ),
                    ],
                  )
              ),
              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.blueGrey),
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   child: Column(
              //     children: [
              //       Container(
              //         child: Text('雰囲気'),
              //       ),
              //       Container(
              //         child: Wrap(
              //           children: [
              //             Container(
              //               width: 160,
              //               child: Consumer<SearchProvider>(
              //                   builder: (context, search, child) {
              //                     return CheckboxListTile(
              //                         title: Text('キレイめ'),
              //                         value: search.prettyChecked,
              //                         onChanged: (bool? value) {
              //                           search.changePretty(value);
              //                         }
              //                     );
              //                   }
              //               ),
              //             ),
              //             Container(
              //               width: 120,
              //               child: Consumer<SearchProvider>(
              //                   builder: (context, search, child){
              //                     return CheckboxListTile(
              //                         title: Text('高級'),
              //                         value: search.luxuryChecked,
              //                         onChanged: (bool? value) {
              //                           search.changeLuxury(value);
              //                         }
              //                     );
              //                   }
              //               ),
              //             ),
              //             Container(
              //               width: 140,
              //               child: Consumer<SearchProvider>(
              //                   builder: (context, search, child){
              //                     return CheckboxListTile(
              //                         title: Text('レトロ'),
              //                         value: search.retroChecked,
              //                         onChanged: (bool? value) {
              //                           search.changeRetro(value);
              //                         }
              //                     );
              //                   }
              //               ),
              //             ),
              //             Container(
              //               width: 120,
              //               child: Consumer<SearchProvider>(
              //                   builder: (context, search, child){
              //                     return CheckboxListTile(
              //                         title: Text('大衆'),
              //                         value: search.publicChecked,
              //                         onChanged: (bool? value) {
              //                           search.changePublic(value);
              //                         }
              //                     );
              //                   }
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 10,),
            Container(
                padding: EdgeInsets.all(10),
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.blueGrey),
                //   borderRadius: BorderRadius.circular(15),
                // ),
              child: Column(
                children: [
                  Container(
                    child: Text('駐車場'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        child: Consumer<SearchProvider>(
                            builder: (context, search, child){
                              return RadioListTile(
                                  title: Text('有'),
                                  value: search.parkingChecked,
                                  groupValue: search.parkingCheckedGroup,
                                  onChanged: (bool? value) {
                                    search.changeParking(value);
                                  }
                              );
                            }
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Consumer<SearchProvider>(
                            builder: (context, search, child){
                              return RadioListTile(
                                  title: Text('無'),
                                  value: search.noParkingChecked,
                                  groupValue: search.parkingCheckedGroup,
                                  onChanged: (bool? value) {
                                    search.changeParking(value);
                                  }
                              );
                            }
                        ),
                      )
                    ],
                  )
                ],
              ),
              )
            ]
          )
        ),
      )
    );
  }
}