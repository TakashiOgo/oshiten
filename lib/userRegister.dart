import 'package:flutter/material.dart';
import 'main.dart';
import 'myBottomNavigationBar.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

enum genderValue {man,woman}

class _UserRegisterState extends State<UserRegister> {

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController userNameEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  genderValue _gValue = genderValue.man;

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
    return  Scaffold(
      appBar: AppBar(title: Text('ユーザー登録'),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          alignment: Alignment.center,
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Container(
                width: MediaQuery.of(context).size.width/1.5,
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
                        return val!.length < 8 ? "パスワードは８文字以上必要です": null;
                      },
                      obscureText: true,
                      controller: passwordEditingController,
                      decoration: const InputDecoration(labelText: 'パスワード', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      validator: (val) {
                        return val! == passwordEditingController.text ? null : "パスワードが違います";
                      },
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'パスワード(確認用)', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty ? "ユーザーネームを入力してください" : null;
                      },
                      controller: userNameEditingController,
                      decoration: const InputDecoration(labelText: 'ユーザーネーム', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 30,),
                    RadioListTile(
                      title: Text('男性'),
                      value: genderValue.man,
                      groupValue: _gValue,
                      onChanged: (value)=>_onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('女性'),
                      value: genderValue.woman,
                      groupValue: _gValue,
                      onChanged: (value)=>_onRadioSelected(value),
                    ),
                    const SizedBox(height: 30,),
                    ElevatedButton(
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
                    )
                  ],
                ),
              ),
            )
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
