import 'package:flutter/material.dart';
import 'main.dart';

class PlusMinusDetector extends StatefulWidget {
  final onPlusMinus;
  final int initialValue;

  PlusMinusDetector({Key key, this.onPlusMinus, this.initialValue}) : super (key:key);

  @override
  _PlusMinusDetectorState createState() => _PlusMinusDetectorState();
}

final GlobalKey<_PlusMinusDetectorState> plusMinusWidgetKey = GlobalKey<_PlusMinusDetectorState>();

class _PlusMinusDetectorState extends State<PlusMinusDetector> {
  int value = 0;

  @override
  void initState() {
    this.value = widget.initialValue;
    super.initState();
  }

  void setValue(int val) {
    setState(() {
      value = val;
    });
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            setState(() {
              value--;
              if(value <= 0){
                value = 0;
              }
            });
            widget.onPlusMinus(value);
          },
          child: Container(
            child: Icon(Icons.remove, color: Colors.black,),
            color: Colors.grey[400],
            height: 50,
            width: 50,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            value.toString(),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              value++;
            });
            widget.onPlusMinus(value);
          },
          child: Container(
            child: Icon(Icons.add, color: Colors.black,),
            color: Colors.grey[400],
            height: 50,
            width: 50,
          ),
        ),
      ],
    );
  }
}
