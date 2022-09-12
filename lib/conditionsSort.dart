import 'package:flutter/material.dart';
import 'conditionsSortResults.dart';
import 'package:provider/provider.dart';
import 'myBottomNavigationBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SortProvider extends ChangeNotifier {

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

  bool teenAgeChecked = false;
  bool twentiesChecked = false;
  bool thirtiesChecked = false;
  bool fortiesChecked = false;
  bool fiftiesChecked = false;
  bool overSixtiesChecked = false;
  bool friendChecked = false;
  bool familyChecked = false;
  bool companyChecked = false;
  bool memorialDinnerChecked = false;
  bool datingChecked = false;
  bool prettyChecked = false;
  bool luxuryChecked = false;
  bool retroChecked = false;
  bool publicChecked = false;
  bool parkingChecked = false;
  bool noParkingChecked = true;
  bool parkingCheckedGroup = false;

  String parking = "駐車場 : 有";

  List<String> ageLists = [];
  List<String> sceneLists = [];
  List<String> atmosphereLists = [];
  String teenAgeValue = "";
  String twentiesValue = "";
  String thirtiesValue = "";
  String fortiesValue = "";
  String fiftiesValue = "";
  String overSixtiesValue = "";
  String prettyValue = "";
  String luxuryValue = "";
  String retroValue = "";
  String publicValue = "";

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

  void changeFriend(bool? value){
    friendChecked = value!;
    sceneLists.contains("友人")? sceneLists.remove("友人"): sceneLists.add("友人");
    notifyListeners();
  }

  void changeFamily(bool? value){
    familyChecked = value!;
    sceneLists.contains("家族")? sceneLists.remove("家族"): sceneLists.add("家族");
    notifyListeners();
  }

  void changeCompany(bool? value){
    companyChecked = value!;
    sceneLists.contains("会社")? sceneLists.remove("会社"): sceneLists.add("会社");
    notifyListeners();
  }

  void changeMemorialDinner(bool? value){
    memorialDinnerChecked = value!;
    sceneLists.contains("会食")? sceneLists.remove("会食"): sceneLists.add("会食");
    notifyListeners();
  }

  void changeDating(bool? value){
    datingChecked = value!;
    sceneLists.contains("デート")? sceneLists.remove("デート"): sceneLists.add("デート");
    notifyListeners();
  }

  void changePretty(bool? value){
    prettyChecked = value!;
    atmosphereLists.contains("キレイめ")? atmosphereLists.remove("キレイめ"): atmosphereLists.add("キレイめ");
    prettyValue == ""?prettyValue = "キレイめ": prettyValue = "";
    notifyListeners();
  }

  void changeLuxury(bool? value){
    luxuryChecked = value!;
    atmosphereLists.contains("高級")? atmosphereLists.remove("高級"): atmosphereLists.add("高級");
    luxuryValue == ""?luxuryValue = "高級": luxuryValue = "";
    notifyListeners();
  }

  void changeRetro(bool? value){
    retroChecked = value!;
    atmosphereLists.contains("レトロ")? atmosphereLists.remove("レトロ"): atmosphereLists.add("レトロ");
    retroValue == ""?retroValue = "レトロ": retroValue = "";
    notifyListeners();
  }

  void changePublic(bool? value){
    publicChecked = value!;
    atmosphereLists.contains("大衆")? atmosphereLists.remove("大衆"): atmosphereLists.add("大衆");
    publicValue == ""?publicValue = "大衆": publicValue = "";
    notifyListeners();
  }

  void changeParking(bool? value) {
    parkingCheckedGroup = value!;
    parking == "駐車場 : 有"?parking = "駐車場 : 無":parking = "駐車場 : 有";
    notifyListeners();
  }

}


class ConditionsSort extends StatelessWidget {
  ConditionsSort({Key? key}) : super(key: key);

  // bool _isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('絞り込み'),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyBottomNavigationBar(selectedIndex: 3,);})),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text('エリア'),
                        ),
                        Container(
                            child: Consumer<SortProvider>(
                              builder: (context, sort, child) {
                                return DropdownButton<String>(
                                  value: sort.selectedPrefectureValue,
                                  items: SortProvider.prefecturesLists.map((String list)=>
                                      DropdownMenuItem(value: list,child: Text(list))).toList(),
                                  onChanged: (String? value){
                                    sort.changePrefecture(value);
                                  },
                                );
                              },
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text('ジャンル'),
                          ),
                          Container(
                              child: Consumer<SortProvider>(
                                builder: (context, sort, child) {
                                  return DropdownButton<String>(
                                    value: sort.selectedGenreValue,
                                    items: SortProvider.genreLists.map((String list)=>
                                        DropdownMenuItem(value: list,child: Text(list))).toList(),
                                    onChanged: (String? value){
                                      sort.changeGenre(value);
                                    },
                                  );
                                },
                              )
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 50,),
                  Container(
                    child: Consumer<SortProvider>(
                      builder: (context, sort, child) {
                        // sort.ageLists.isNotEmpty
                        //     && sort.sceneLists.isNotEmpty && sort.atmosphereLists.isNotEmpty
                        //     ? _isDisabled = true: _isDisabled = false;
                        return ElevatedButton(
                            onPressed: () =>
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return ConditionsSortResults();
                                    })),
                            child: const Text(
                              '絞り込み', style: TextStyle(fontSize: 20),)
                        );
                      },
                    ),
                  ),
                ]
            )
        ),
      )
    );
  }
}
