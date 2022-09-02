import 'package:flutter/material.dart';
import 'myBottomNavigationBar.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:firebase_storage/firebase_storage.dart';


class MyPageEdit extends StatefulWidget {
  const MyPageEdit({Key? key}) : super(key: key);

  @override
  State<MyPageEdit> createState() => _MyPageEditState();
}

class _MyPageEditState extends State<MyPageEdit> {

  File? _image;
  String _imageUrl = '';

  Future<void> openImagePicker() async {
    final XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage != null) {
      _image = File(pickedImage.path);
      uploadFile();
    }
  }

  Future<void> uploadFile() async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child('images').child(id);

    await reference.putFile(_image!);

    setState((){
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            _imageUrl==''?const Icon(Icons.image):Image.network(_imageUrl),
            const SizedBox(height: 50,),
            ElevatedButton(
              onPressed: (){
                openImagePicker();
              },
              child: const Text('画像をアップロード', style: TextStyle(color: Colors.white),),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'ユーザーネーム',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width/1.3,
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'コメント',
                  border: OutlineInputBorder()
               ),
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyBottomNavigationBar(selectedIndex: 3,);})),
              child: Text('登録',style: TextStyle(fontSize: 30),))
          ],
        )
      )
    );
  }
}
