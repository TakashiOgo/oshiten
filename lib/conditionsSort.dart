import 'package:flutter/material.dart';
import 'sortResults.dart';
import 'package:provider/provider.dart';
import 'search.dart';
import 'myBottomNavigationBar.dart';


class ConditionsSort extends StatelessWidget {
  ConditionsSort({Key? key}) : super(key: key);

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
                                          title: Text('50代以上'),
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
                                          title: Text('50代以上'),
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return SortResults();})),
                        child: const Text('絞り込み',style: TextStyle(fontSize: 20),)
                    ),
                  ),
                ]
            )
        ),
      )
    );
  }
}
