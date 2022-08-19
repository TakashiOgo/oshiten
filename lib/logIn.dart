import 'package:flutter/material.dart';
import 'package:oshiten_app/bottomNavigationBar.dart';
import 'myPage.dart';


class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width/1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'e-mail', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 30,),
              const TextField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'パスワード', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return bottomNavigationBar();})),
                child: const Text('ログイン', style: TextStyle(fontSize: 25),),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
