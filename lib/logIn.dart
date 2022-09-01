import 'package:flutter/material.dart';
import 'myBottomNavigationBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('ログイン'),),
      body: Center(
        child: SizedBox(
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
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        handleSignIn();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){return MyBottomNavigationBar(selectedIndex: 3);}));
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
          )
        ),
      ),
    );
  }
}
