import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key); // changed

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Offset _offset = Offset(0.2, 0.6);


  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(0.01 * _offset.dy)
          ..rotateY(-0.01 * _offset.dx),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset(0.2, 0.6)),
          child: _app(context),
        )
    );
  }

  _app(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('Perspective 3D Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/0027.png",scale: 1.5,),
          ],
        ),
      ),

    );
  }

}


