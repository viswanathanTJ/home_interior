import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeActivity extends StatefulWidget{
  String who;

  HomeActivity(this.who);

  @override
  State<HomeActivity> createState() => _HomeActivity();

}
class _HomeActivity extends State<HomeActivity>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){

            }, child: Text('Add')),
            SizedBox(height: 20,),
            FutureBuilder(
                builder: (context, snapshot) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(image: AssetImage('images/bg1.jpg'), height: 200,width: double.infinity, fit: BoxFit.fill,),
                            SizedBox(height: 20,)
                          ],
                        ),
                      );
                    },
                    itemCount: 10,);
                }),
          ],
        ),
      )
    );
  }

}