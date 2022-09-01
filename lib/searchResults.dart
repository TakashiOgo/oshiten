import 'package:flutter/material.dart';
import 'searchDetail.dart';
import 'myBottomNavigationBar.dart';
import 'package:provider/provider.dart';
import 'search.dart';

class SearchResults extends StatelessWidget {
  SearchResults({Key? key
    // required this.prefectureValue,
    // required this.GenreValue,
    // required this.MinPriceValue,
    // required this.MaxPriceValue,
    // required this.selectedAge,
    // required this.selectedScene,
    // required this.selectedAtmosphere,
    // required this.parking,
  });

  // String prefectureValue = "";
  // String GenreValue = "";
  // String MinPriceValue = "";
  // String MaxPriceValue = "";
  // String selectedAge = "";
  // String selectedScene = "";
  // String selectedAtmosphere = "";
  // String parking = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('検索結果'),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyBottomNavigationBar(selectedIndex: 3,);})),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          // child: Container(
          //   child: Text('この条件のお店は、まだオシテンされていません。'),
          // ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Consumer<SearchProvider>(
                  builder: (context, search, child) {
                    return Text(
                      '${search.selectedPrefectureValue}　'
                      '${search.selectedGenreValue}　'
                      '${search.selectedMinPriceValue}〜${search.selectedMaxPriceValue}　'
                      '${search.ageLists}　${search.sceneLists}　'
                      '${search.atmosphereLists}　'
                      '${search.parking}',
                      style: TextStyle(fontSize: 20),);
                  }
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(),
                  ),
                  onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return SearchDetail();})),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                        300:100,
                        width: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                        300:100,
                        child: Image.asset('images/profilePic/pic2.png'),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(child: Text('店名',style: TextStyle(fontSize: 20),),),
                            SizedBox(height: 10,),
                            Container(
                              child: Text('このお店は最高です！ぜひ行ってみてください！！',style: TextStyle(fontSize: 15),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text('BO',style: TextStyle(fontSize: 25),),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(),
                  ),
                  onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return SearchDetail();})),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                        300:100,
                        width: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?
                        300:100,
                        child: Image.asset('images/profilePic/pic2.png'),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(child: Text('店名',style: TextStyle(fontSize: 20),),),
                            SizedBox(height: 10,),
                            Container(
                              child: Text('このお店は最高です！ぜひ行ってみてください！！',style: TextStyle(fontSize: 15),),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text('BO',style: TextStyle(fontSize: 25),),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
