import 'package:flutter/material.dart';
import 'myBottomNavigationBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'search.dart';

class currentPicIndex extends ChangeNotifier{

  int picIndex = 0;

  void changePicIndex(int index){
    picIndex = index;
    notifyListeners();
  }

}

List<Widget> storePic = [
  Image.asset('images/profilePic/pic2.png'),
  Image.asset('images/profilePic/pic3.png'),
  Image.asset('images/profilePic/pic4.png'),
  Image.asset('images/profilePic/pic5.png'),
];

class SearchDetail extends StatelessWidget {
  const SearchDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('お店詳細'),
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
            child: Column(
              children: [
                Container(
                  child: Consumer<currentPicIndex>(
                    builder: (context, pic, child) {
                      return CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height <
                              MediaQuery.of(context).size.width?400:200,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            pic.changePicIndex(index);
                          },
                        ),
                        items: storePic,
                      );
                    },
                  ),
                ),
                Consumer<currentPicIndex>(
                  builder: (context, pic, child){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: storePic.map((url) {
                        int index = storePic.indexOf(url);
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pic.picIndex == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    );
                  }
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text('店名'),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text('コメント　　コメント　　コメント'),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.all(20),
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
                SizedBox(height: 50,),
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.height < MediaQuery.of(context).size.width?100:50,
                        backgroundImage: AssetImage('images/profilePic/pic1.png'),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(child: Text('ユーザーネーム',style: TextStyle(fontSize: 20),),),
                            SizedBox(height: 10,),
                            Container(
                              child: Text('このお店は最高です！ぜひ行ってみてください！！',style: TextStyle(fontSize: 15),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
