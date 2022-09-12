import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'myBottomNavigationBar.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class PictureProvider extends ChangeNotifier {

  File? _image;
  String imageUrl = '';
  String myId = FirebaseAuth.instance.currentUser!.uid;
  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController commentEditingController = TextEditingController();


  Future<void> openImagePicker() async {
    final XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
      uploadFile();
    }
    notifyListeners();
  }

  Future<void> uploadFile()async{
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child('images').child(myId).child(id);
    await reference.putFile(_image!);
    imageUrl =  await reference.getDownloadURL();
    notifyListeners();
  }

  void profileAdd() async {
    await FirebaseFirestore.instance.collection('profile').doc(myId).set({
      'userName': userNameEditingController.text,
      'comment': commentEditingController.text,
      'profileImgUrl': imageUrl,
    });
    notifyListeners();
  }

}


class MyPageEdit extends StatefulWidget {
  const MyPageEdit({Key? key}) : super(key: key);

  @override
  State<MyPageEdit> createState() => _MyPageEditState();
}

class _MyPageEditState extends State<MyPageEdit> {

  final _formKey = GlobalKey<FormState>();
  String myId = FirebaseAuth.instance.currentUser!.uid;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Consumer<PictureProvider>(
                builder: (context, picture, child) {
                return Column(
                  children: [
                    picture.imageUrl==''?const Icon(Icons.image):Image.network(picture.imageUrl),
                    const SizedBox(height: 50,),
                    ElevatedButton(
                      onPressed: (){
                        picture.openImagePicker();
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                      ),
                      child: const Text('画像を選択', style: TextStyle(color: Colors.white),),
                    ),
                    const SizedBox(height: 50),
                    Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance.collection('profile').doc(myId).snapshots(),
                          builder: (context, snapshot){
                            if(snapshot.hasData&&snapshot.data!.exists){
                              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                              return TextFormField(
                                validator: (val) {
                                  return val!.isEmpty ? "ユーザーネームを入力してください" : null;
                                },
                                controller: picture.userNameEditingController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()
                                ),
                                maxLines: 1,
                              );
                            }else{
                              return TextFormField(
                                validator: (val) {
                                  return val!.isEmpty ? "ユーザーネームを入力してください" : null;
                                },
                                controller: picture.userNameEditingController,
                                decoration: const InputDecoration(
                                    labelText: 'ユーザーネーム',
                                    border: OutlineInputBorder()
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    const SizedBox(height: 50),
                    Container(
                      width: MediaQuery.of(context).size.width/1.3,
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance.collection('profile').doc(myId).snapshots(),
                        builder: (context, snapshot){
                          if(snapshot.hasData&&snapshot.data!.exists){
                            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                            return TextFormField(
                              validator: (val) {
                                return val!.isEmpty ? "コメントを入力してください" : null;
                              },
                              controller: picture.commentEditingController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()
                              ),
                              maxLines: 10,
                            );
                          }else{
                            return TextFormField(
                              validator: (val) {
                                return val!.isEmpty ? "コメントを入力してください" : null;
                              },
                              controller: picture.commentEditingController,
                              decoration: const InputDecoration(
                                  labelText: 'コメント',
                                  border: OutlineInputBorder()
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 50,),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            picture.profileAdd();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyBottomNavigationBar(selectedIndex: 3,);}));
                          }else{
                            Container();
                          }
                        });
                      },
                      child: const Text('登録',style: TextStyle(fontSize: 30),))
                  ],
                );
              }
            ),
          ),
        )
      )
    );
  }
}
