import 'package:flutter/material.dart';
import 'logIn.dart';
import 'userRegister.dart';
import 'myBottomNavigationBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool alreadySignedUp = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController userNameEditingController = TextEditingController();
  genderValue _gValue = genderValue.man;

  void handleSignIn()async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailEditingController.text,
          password: passwordEditingController.text
      );
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('登録されていないアカウントです'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('パスワードが違います'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('登録されていないメールアドレスです'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  void handleSignUp()async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEditingController.text,
        password: passwordEditingController.text,
      );
    }on FirebaseAuthException catch(e) {
      if(e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('すでに使用されているメールアドレスです'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ));
      }else if(e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('パスワードが弱いです'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ));
      }else if(e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('正しいメールアドレスを入力してください'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              alreadySignedUp?SizedBox(height: 40,):SizedBox(height: 150,),
              Container(
                child: const Text('Oshiten',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60, fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: const Text('~レストラン紹介アプリ~', style: TextStyle(fontSize: 30)),
              ),
              alreadySignedUp?SizedBox(height: 40,):SizedBox(height: 100,),
              Container(
                width: MediaQuery.of(context).size.width/1.5,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? "e-mailを入力してください" : null;
                        },
                        controller: emailEditingController,
                        decoration: InputDecoration(labelText: 'e-mail', border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 30,),
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? "パスワードを入力してください" : null;
                        },
                        controller: passwordEditingController,
                        obscureText: true,
                        decoration: const InputDecoration(labelText: 'パスワード', border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 30,),
                      alreadySignedUp?TextFormField(
                        validator: (val) {
                          return val! == passwordEditingController.text ? null : "パスワードが違います";
                        },
                        obscureText: true,
                        decoration: const InputDecoration(labelText: 'パスワード(確認用)', border: OutlineInputBorder()),
                      ):SizedBox(height: 0,),
                      alreadySignedUp?const SizedBox(height: 30,):const SizedBox(height: 0,),
                      alreadySignedUp?TextFormField(
                              validator: (val) {
                                return val!.isEmpty ? "ユーザーネームを入力してください" : null;
                              },
                              controller: userNameEditingController,
                              decoration: const InputDecoration(labelText: 'ユーザーネーム', border: OutlineInputBorder()),
                            ):SizedBox(height: 0,),
                      alreadySignedUp?const SizedBox(height: 30,):const SizedBox(height: 0,),
                      alreadySignedUp?RadioListTile(
                        title: Text('男性'),
                        value: genderValue.man,
                        groupValue: _gValue,
                        onChanged: (value)=>_onRadioSelected(value),
                      ):SizedBox(height: 0,),
                      alreadySignedUp?RadioListTile(
                        title: Text('女性'),
                        value: genderValue.woman,
                        groupValue: _gValue,
                        onChanged: (value)=>_onRadioSelected(value),
                      ):SizedBox(height: 0,),
                      const SizedBox(height: 30,),
                      alreadySignedUp?ElevatedButton(
                          onPressed: (){
                            setState((){
                              if(_formKey.currentState!.validate()){
                                handleSignUp();
                              }
                            });
                          },
                          child: const Text('登録', style: TextStyle(fontSize: 25),),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                          ),
                      ):ElevatedButton(
                        onPressed: (){
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              handleSignIn();
                            }
                          });
                        },
                        child: const Text('ログイン', style: TextStyle(fontSize: 25),),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Container(
                  child: TextButton(
                    onPressed: () {
                      setState((){
                        alreadySignedUp = !alreadySignedUp;
                        emailEditingController.clear();
                        passwordEditingController.clear();
                      });
                    },
                    child: Text(alreadySignedUp?'ログインはこちらから':'ユーザー登録はこちらから',
                        style: TextStyle(fontSize: 20,decoration: TextDecoration.underline)),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
  _onRadioSelected(value) {
    setState((){
      _gValue = value;
    });
  }
}
