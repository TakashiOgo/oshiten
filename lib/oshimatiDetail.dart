import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myBottomNavigationBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'searchDetail.dart';

class BestOshiten extends ChangeNotifier{

  bool checkedBestOshiten = false;

  void changeBestOshiten() {
    if(checkedBestOshiten) {
      checkedBestOshiten = false;
    } else {
      checkedBestOshiten = true;
    }
    notifyListeners();
  }

}

class OshimatiDetail extends StatelessWidget {
  const OshimatiDetail({Key? key}) : super(key: key);

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
                child: Text('東京都　　　和食　　　1,000〜3,000　　　20代　　　友人　　　大衆　　　駐車場：有',
                  style: TextStyle(fontSize: 20),),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(15),
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
              Container(
                alignment: Alignment.centerRight,
                child: Consumer<BestOshiten>(
                  builder: (context, bestoshiten, child) {
                    return ElevatedButton(
                      child: Text('ベストオシテン',style: TextStyle(fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        primary: bestoshiten.checkedBestOshiten?Colors.red:Colors.grey,
                        onPrimary: bestoshiten.checkedBestOshiten?Colors.black:Colors.white,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        bestoshiten.changeBestOshiten();
                      }
                    );
                  }
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}
