import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class searchProvider extends ChangeNotifier {

  var selectedPrefecturesValue = "北海道";
  final prefecturesLists = <String>["北海道","青森県","秋田県","岩手県","山形県","宮城県","福島県"];
  var selectedGenreValue = "和食";
  final genreLists = <String>["和食","イタリアン","フレンチ","中華"];
  var selectedMinPriceValue = "下限なし";
  final minPriceLists = <String>["下限なし","¥1,000","¥2,000","¥3,000","¥4,000","¥5,000","¥6,000","¥8,000","¥10,000","¥15,000","¥20,000"];
  var selectedMaxPriceValue = "上限なし";
  final maxPriceLists = <String>["上限なし","¥1,000","¥2,000","¥3,000","¥4,000","¥5,000","¥6,000","¥8,000","¥10,000","¥15,000","¥20,000"];

}

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);

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
                    child: Consumer<searchProvider>(
                      builder: (context, search, child) {
                        DropdownButton<String>(
                          value: selectedPrefecturesValue,
                          items: prefecturesLists.map((String list)=>
                            DropdownMenuItem(value: list,child: Text(list))).toList(),
                          onChanged: (String? value){
                            selectedPrefecturesValue = value!;
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