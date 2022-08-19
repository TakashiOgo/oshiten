import 'package:flutter/material.dart';
import 'myPage.dart';

class userRegister extends StatefulWidget {
  const userRegister({Key? key}) : super(key: key);

  @override
  State<userRegister> createState() => _userRegisterState();
}

enum genderValue {man,woman}

class _userRegisterState extends State<userRegister> {

  genderValue _gValue = genderValue.man;

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
                const TextField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'パスワード(確認用)', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 30,),
                const TextField(
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
                  onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context){return myPage();})),
                  child: const Text('登録', style: TextStyle(fontSize: 25),),
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

  _onRadioSelected(value) {
    setState((){
      _gValue = value;
    });
  }
}
