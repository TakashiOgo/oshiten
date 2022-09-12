import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'conditionsLineUp.dart';
import 'myBottomNavigationBar.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart'
;import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';



class StoreIntroduction extends StatefulWidget {
  StoreIntroduction({Key? key,
    required this.prefecture,
    required this.genre,
    required this.minPrice,
    required this.maxPrice,
    required this.age,
    required this.scene,
    required this.atmosphere,
    required this.parking
  }) : super(key: key);
  String prefecture = "";
  String genre = "";
  String minPrice = "";
  String maxPrice = "";
  List<dynamic> age = [];
  String scene = "";
  String atmosphere = "";
  String parking = "";

  @override
  State<StoreIntroduction> createState() => _StoreIntroductionState();
}

class _StoreIntroductionState extends State<StoreIntroduction> {

  File? _image;
  String _imageUrl = '';
  String myId = FirebaseAuth.instance.currentUser!.uid;
  TextEditingController storeEditingController = TextEditingController();
  TextEditingController introductionEditingController = TextEditingController();

  Future<void> openImagePicker() async {
    final XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
      uploadFile();
    }
  }

  Future<void> uploadFile()async{
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child('images').child(myId).child(id);
    await reference.putFile(_image!);
    _imageUrl =  await reference.getDownloadURL();
  }

  final snackBar = const SnackBar(
    backgroundColor: Colors.blue,
    content: Text('オシテンされました！', style: TextStyle(color: Colors.white, fontSize: 24,),),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('店紹介'),
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
              _imageUrl==''?const Icon(Icons.image):Image.network(_imageUrl),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: (){
                  openImagePicker();
                },
                child: const Text('画像を選択', style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: storeEditingController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '店名',
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: introductionEditingController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '紹介コメント',
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${widget.prefecture}  '+
                      '${widget.genre}　 '+
                      '${widget.minPrice}〜${widget.maxPrice}　'+
                      '${widget.age}'.substring(1,'${widget.age}'.length-1)+
                      '    '+
                      '${widget.scene}'
                          // .substring(1,'${widget.scene}'.length-1)+
                      '    '+
                      '${widget.atmosphere}'
                          // .substring(1,'${widget.atmosphere}'.length-1)+
                      '    '+
                      '${widget.parking}',
                  style: TextStyle(fontSize: 20,),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(20),
                child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance.collection('profile').doc(myId).snapshots(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData&&snapshot.data!.exists){
                        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                        return ElevatedButton(
                            onPressed: () {
                              FirebaseFirestore.instance.collection('store').doc(DateTime.now().toString(),).set({
                                'imgUrl': _imageUrl,
                                'storeName': storeEditingController.text,
                                'introduction': introductionEditingController.text,
                                'prefecture': widget.prefecture,
                                'genre': widget.genre,
                                'minPrice': widget.minPrice,
                                'maxPrice': widget.maxPrice,
                                'age': widget.age,
                                'scene': widget.scene,
                                "atmosphere": widget.atmosphere,
                                'parking': widget.parking,
                                'profileImg': data['profileImgUrl'],
                                'userName': data['userName'],
                                'myId': myId,
                                'goodOshiten': 0,
                                'data': DateTime.now().toString(),
                              });
                              Future.delayed(Duration(seconds: 2),(){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyBottomNavigationBar(selectedIndex: 2);}));
                              });
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                            child: const Text('オシテン！',style: TextStyle(fontSize: 20),)
                        );
                      }else{
                        return Container();
                      }
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}