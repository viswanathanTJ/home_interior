import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_interior/Database/AdminDB.dart';
import 'package:house_interior/Database/UserDB.dart';
import 'package:house_interior/GlobalVariable.dart';
import 'package:house_interior/HomeActivity.dart';
import 'package:house_interior/RegistrationActivity.dart';
import 'package:house_interior/UserPage.dart';
import 'package:motion_toast/motion_toast.dart';

class LoginActivity extends StatefulWidget{
  @override
  State<LoginActivity> createState() => _LoginActivity();
}
class _LoginActivity extends State<LoginActivity>{
  final mail_id = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AdminDB.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/light-1.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/light-2.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/clock.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey))
                              ),
                              child: TextField(
                                controller: mail_id,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: password,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ]
                                
                            )
                        ),

                        child: Center(
                          child: GestureDetector(
                        onTap: () {
                              print('clicked');
                              // AdminDB adminDB = new AdminDB();
                              // UserDB userDB = new UserDB('', '', '');
                              UserDB.init();
                              AdminDB.init();
                              // bool aCheck =  as bool;
                              // bool uCheck = userDB.check(mail_id.text, password.text) as bool;
                              if(mail_id.text=="admin" && password.text == "admin") {
Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (_) => HomeActivity(mail_id.text)),
                                    (Route<dynamic> route) => false);
                              } else {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserPage()));

                              }
                              // if(AdminDB.Check(mail_id.text, password.text, 1)){
                                showToast('success');
                              // }else if(await UserDB.check(mail_id.text, password.text)){
                              //   showToast('success');
                              // }else{
                              //   showWarning('Authentication Failed');
                              // }
                            },
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      SizedBox(height: 70,),
                      GestureDetector(
                        child: Text('Register', style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1))),
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationActivity()));
                        },
                      ),
                      SizedBox(height: 30,),
                      Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  void showToast(String text){
    MotionToast.success(description: Text(text), title: const Text('Info',),).show(context);
  }
  void showWarning(String text){
    MotionToast.warning(description: Text(text), title: const Text('Info',),).show(context);
  }
}