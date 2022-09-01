import 'package:flutter/material.dart';
import 'logIn.dart';
import 'userRegister.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 150, bottom: 10),
              child: const Text('Oshiten',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60, fontStyle: FontStyle.italic),
              ),
            ),
            Container(
              child: const Text('~レストラン紹介アプリ~', style: TextStyle(fontSize: 30)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 120),
              // decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(15)),
              child: TextButton(
                onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return LogIn();})),
                child: const Text('ログイン', style: TextStyle(fontSize: 25),),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 70),
                child: TextButton(
                  onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return UserRegister();})),
                  child: const Text('ユーザー登録はこちらから',
                      style: TextStyle(fontSize: 20,decoration: TextDecoration.underline)),
                )
            ),
          ],
        ),
      ),
    );
  }
}
