import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  var _value = "";

  bool teenAgeChecked = false;
  bool twentiesChecked = false;
  bool thirtiesChecked = false;
  bool fortiesChecked = false;
  bool overFiftiesChecked = false;
  bool friendChecked = false;
  bool familyChecked = false;
  bool datingChecked = false;
  bool companyChecked = false;
  bool memorialDinnerChecked = false;
  bool prettyChecked = false;
  bool luxuryChecked = false;
  bool retroChecked = false;
  bool publicChecked = false;
  bool parkingChecked = false;
  bool noParkingChecked = true;
  bool _parkingChecked = false;


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

  void changeMaxMinPrice(String? value){
    _value = value!;
    selectedMaxPriceValue = selectedMinPriceValue;
    selectedMinPriceValue = _value;
  }

  void changeTeenAge(bool? value){
    teenAgeChecked = value!;
    notifyListeners();
  }

  void changeTwenties(bool? value){
    twentiesChecked = value!;
    notifyListeners();
  }

  void changeThirties(bool? value){
    thirtiesChecked = value!;
    notifyListeners();
  }

  void changeForties(bool? value){
    fortiesChecked = value!;
    notifyListeners();
  }

  void changeOverFifties(bool? value){
    overFiftiesChecked = value!;
    notifyListeners();
  }

  void changeFriend(bool? value){
    friendChecked = value!;
    notifyListeners();
  }

  void changeFamily(bool? value){
    familyChecked = value!;
    notifyListeners();
  }

  void changeDating(bool? value){
    datingChecked = value!;
    notifyListeners();
  }

  void changeCompany(bool? value){
    companyChecked = value!;
    notifyListeners();
  }

  void changeMemorialDinner(bool? value){
    memorialDinnerChecked = value!;
    notifyListeners();
  }

  void changePretty(bool? value){
    prettyChecked = value!;
    notifyListeners();
  }

  void changeLuxury(bool? value){
    luxuryChecked = value!;
    notifyListeners();
  }

  void changeRetro(bool? value){
    retroChecked = value!;
    notifyListeners();
  }

  void changePublic(bool? value){
    publicChecked = value!;
    notifyListeners();
  }

  void changeParking(bool? value){
    _parkingChecked = value!;
    notifyListeners();
  }

}

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('検索'),automaticallyImplyLeading: false,),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                // child: ElevatedButton(
                //   onPressed: onPressed,
                //   child: const Text('検索',style: TextStyle(fontSize: 25),)
                // )
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // width: MediaQuery.of(context).size.width/3,
                      child: Text('エリア'),
                    ),
                    Container(
                        // width: MediaQuery.of(context).size.width/3,
                        // alignment: Alignment.centerRight,
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
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // width: MediaQuery.of(context).size.width/3,
                      child: Text('ジャンル'),
                    ),
                    Container(
                        // width: MediaQuery.of(context).size.width/3,
                        // alignment: Alignment.centerRight,
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
                width: double.infinity,
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
                      width: double.infinity,
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
                                    SearchProvider.maxPriceLists.indexOf(value!) <
                                        SearchProvider.minPriceLists.indexOf(search.selectedMinPriceValue)?
                                    search.changeMaxMinPrice(value):search.changeMaxPrice(value);
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
                            width: 160,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('50代以上'),
                                      value: search.overFiftiesChecked,
                                      onChanged: (bool? value) {
                                        search.changeOverFifties(value);
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
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Text('シーン'),
                    ),
                    Container(
                      child: Wrap(
                        children: [
                          Container(
                            width: 120,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child) {
                                  return CheckboxListTile(
                                      title: Text('友人'),
                                      value: search.friendChecked,
                                      onChanged: (bool? value) {
                                        search.changeFriend(value);
                                      }
                                  );
                                }
                            ),
                          ),
                          Container(
                            width: 120,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('家族'),
                                      value: search.familyChecked,
                                      onChanged: (bool? value) {
                                        search.changeFamily(value);
                                      }
                                  );
                                }
                            ),
                          ),
                          Container(
                            width: 120,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('会社'),
                                      value: search.companyChecked,
                                      onChanged: (bool? value) {
                                        search.changeCompany(value);
                                      }
                                  );
                                }
                            ),
                          ),
                          Container(
                            width: 120,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('会食'),
                                      value: search.memorialDinnerChecked,
                                      onChanged: (bool? value) {
                                        search.changeMemorialDinner(value);
                                      }
                                  );
                                }
                            ),
                          ),
                          Container(
                            width: 140,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('デート'),
                                      value: search.datingChecked,
                                      onChanged: (bool? value) {
                                        search.changeDating(value);
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
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Text('雰囲気'),
                    ),
                    Container(
                      child: Wrap(
                        children: [
                          Container(
                            width: 160,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child) {
                                  return CheckboxListTile(
                                      title: Text('キレイめ'),
                                      value: search.prettyChecked,
                                      onChanged: (bool? value) {
                                        search.changePretty(value);
                                      }
                                  );
                                }
                            ),
                          ),
                          Container(
                            width: 120,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('高級'),
                                      value: search.luxuryChecked,
                                      onChanged: (bool? value) {
                                        search.changeLuxury(value);
                                      }
                                  );
                                }
                            ),
                          ),
                          Container(
                            width: 140,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('レトロ'),
                                      value: search.retroChecked,
                                      onChanged: (bool? value) {
                                        search.changeRetro(value);
                                      }
                                  );
                                }
                            ),
                          ),
                          Container(
                            width: 120,
                            child: Consumer<SearchProvider>(
                                builder: (context, search, child){
                                  return CheckboxListTile(
                                      title: Text('大衆'),
                                      value: search.publicChecked,
                                      onChanged: (bool? value) {
                                        search.changePublic(value);
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
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(15),
                ),
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
                                  groupValue: search._parkingChecked,
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
                                  groupValue: search._parkingChecked,
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