import 'package:flutter/material.dart';


class CheckedBox extends StatefulWidget {
  final String title;

  CheckedBox({Key key, this.title}): super(key: key);

  @override
  _CheckedBoxState createState() => _CheckedBoxState();
}

final GlobalKey<_CheckedBoxState> checkedBoxKeyW = GlobalKey<_CheckedBoxState>();
final GlobalKey<_CheckedBoxState> checkedBoxKeyC = GlobalKey<_CheckedBoxState>();

class _CheckedBoxState extends State<CheckedBox> {
  bool activated = false;

  void setActivated(bool val){
    setState(() {
      activated = val;
    });
  }
  bool getActivated(){
    return activated;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Checkbox(
            value: activated,
            onChanged: (newValue) {
              setState(() {
                activated = !activated;
              });
            },
          ),
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
