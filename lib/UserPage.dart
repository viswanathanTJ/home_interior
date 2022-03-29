
// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tcard.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}
List<String> images = [
  'https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aG9tZSUyMGludGVyaW9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1100&q=80',
  'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=658&q=80',
  'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=853&q=80',
  // 'https://unsplash.com/photos/T6d96Qrb5MY',
];

List<Widget> cards = List.generate(
  images.length,
  (int index) {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 23.0,
            spreadRadius: -13.0,
            color: Colors.black54,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        // child: AssetImage()
        child: Image.network(
          images[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  },
);
class _UserPageState extends State<UserPage> {
  TCardController _controller = TCardController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home Interior Collections",
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(),
              child: TCard(
                cards: cards,
                leftIcon: ElevatedButton(
                  // the left icon on the card
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(52, 52),
                    elevation: 0,
                    primary: Colors.red,
                    shape: CircleBorder(
                      side: BorderSide(width: 0, color: Colors.transparent),
                    ),
                  ),
                  onPressed: null,
                  child: const Icon(
                    Icons.close,
                    color: Colors.black45,
                    size: 32,
                  ),
                ),
                // the right icon if you want it.
                rightIcon: const Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 32,
                ),
                size: Size(360, 480),
                controller: _controller,
                // onForward: (index, info) {
                //   print(index);
                //   var offset = 3;
                //   if (index >= cards.length - offset) {
                //     print('loading more...');
                //     List<Widget> addCards = List.generate(
                //             // generate or load more cards from your server
                //             )
                //         .toList();
                //     setState(() {
                //       cards.addAll(addCards);
                //     });
                //     _controller.append(addCards); // append more cards
                //   }
                // },
                onBack: (index, info) {
                  print(index);
                },
                onEnd: () {
                  print('end');
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print(_controller);
                    _controller.back();
                  },
                  child: Text('Back'),
                ),
                OutlineButton(
                  onPressed: () {
                    _controller.reset();
                  },
                  child: Text('Reset'),
                ),
                OutlineButton(
                  onPressed: () {
                    _controller.forward();
                  },
                  child: Text('Forward'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
