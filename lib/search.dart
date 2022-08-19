import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// クラス名は大文字で始めるのが通例なので、慣れておくといいです。
class SearchProvider extends ChangeNotifier {

  var selectedPrefecturesValue = "北海道";
  // 値が変わらない変数は、staticをつけてクラスフィールドにするほうが自然です。
  static final prefecturesLists = <String>["北海道","青森県","秋田県","岩手県","山形県","宮城県","福島県"];
  var selectedGenreValue = "和食";
  static final genreLists = <String>["和食","イタリアン","フレンチ","中華"];
  var selectedMinPriceValue = "下限なし";
  static final minPriceLists = <String>["下限なし","¥1,000","¥2,000","¥3,000","¥4,000","¥5,000","¥6,000","¥8,000","¥10,000","¥15,000","¥20,000"];
  var selectedMaxPriceValue = "上限なし";
  static final maxPriceLists = <String>["上限なし","¥1,000","¥2,000","¥3,000","¥4,000","¥5,000","¥6,000","¥8,000","¥10,000","¥15,000","¥20,000"];

  // changeNotifierを呼び出します。変数の値の更新は必ずChangeNotifierの中でメソッドとして定義しましょう。
  void changePrefecture(String? value){
    selectedPrefecturesValue = value!;
    notifyListeners();
  }

}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('検索'),automaticallyImplyLeading: false,),
      body: Container(
        margin: const EdgeInsets.all(40),
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
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    child: Text('エリア'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    alignment: Alignment.centerRight,
                    child: Consumer<SearchProvider>(
                      builder: (context, search, child) {
                        return DropdownButton<String>(
                          // selectedPrefecturesValueはインスタンスフィールドなのでこのように書きます。
                          value: search.selectedPrefecturesValue,
                          // prefecturesListsはクラスフィールドなのでこのように書きます。
                          items: SearchProvider.prefecturesLists.map((String list)=>
                            DropdownMenuItem(value: list,child: Text(list))).toList(),
                          onChanged: (String? value){
                            // 値を更新するメソッドの呼び出し。
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
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    child: Text('ジャンル'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    alignment: Alignment.centerRight,
                    child: DropdownButton<String>(
                      value: selectedGenreValue,
                      items: genreLists.map((String list)=>
                          DropdownMenuItem(value: list,child: Text(list))).toList(),
                      onChanged: (String? value){
                        setState((){
                          selectedGenreValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              )
            ),
            SizedBox(height: 10,),
            Container(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/7,
                    child: Text('価格'),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/4,
                          alignment: Alignment.centerRight,
                          child: DropdownButton<String>(
                            value: selectedMinPriceValue,
                            items: minPriceLists.map((String list)=>
                                DropdownMenuItem(value: list,child: Text(list))).toList(),
                            onChanged: (String? value){
                              setState((){
                                selectedMinPriceValue = value!;
                              });
                            }
                          )
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/10,
                          alignment: Alignment.center,
                          child: Text('~'),
                          ),
                        Container(
                          width: MediaQuery.of(context).size.width/4,
                          alignment: Alignment.centerRight,
                          child: DropdownButton<String>(
                            value: selectedMaxPriceValue,
                            items: maxPriceLists.map((String list)=>
                                DropdownMenuItem(value: list,child: Text(list))).toList(),
                            onChanged: (String? value){
                              setState((){
                                selectedMaxPriceValue = value!;
                              });
                            }
                          )
                        )
                      ]
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}
