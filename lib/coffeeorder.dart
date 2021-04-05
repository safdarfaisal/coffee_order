import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'boxfield.dart';
import 'plusminus.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';


class CoffeeOrder extends StatefulWidget {
  @override
  _CoffeeOrderState createState() => _CoffeeOrderState();
}

class _CoffeeOrderState extends State<CoffeeOrder> {
  TextEditingController controller = TextEditingController();
  String display = '';
  int coffeeQty = 0;
  String whippedCream = '';
  String chocolate = '';
  int price = 5;
  int finalPrice = 0;
  int whippedCreamPrice = 0;
  int chocolatePrice = 0;


  setCoffeeQty(val) {
    setState(() {
      coffeeQty = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF1DF),
      appBar: AppBar(
        title: Text(
          'Just Java',
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide.none,
                        left: BorderSide.none,
                        right: BorderSide.none),
                  ),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Name',
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                ),
                Text(
                  'TOPPINGS',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFFA84030),
                  ),
                ),
                CheckedBox(
                  key: checkedBoxKeyW,
                  title: 'Whipped Cream',
                ),
                CheckedBox(
                  key: checkedBoxKeyC,
                  title: 'Chocolate',
                ),
                Text(
                  'QUANTITY',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFFA84030),
                  ),
                ),
                PlusMinusDetector(
                  key: plusMinusWidgetKey,
                  onPlusMinus: setCoffeeQty,
                  initialValue: coffeeQty,
                ),
                Text(
                  'Order Summary',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Color(0xFFA84030),
                  ),
                ),
                Text(display),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if(checkedBoxKeyW.currentState.getActivated()){
                        whippedCreamPrice = 1;
                        whippedCream = '\n+ Whipped Cream';
                      }
                      else{
                        whippedCreamPrice = 0;
                        whippedCream = '';
                      }
                      if(checkedBoxKeyC.currentState.getActivated()){
                        chocolatePrice = 1;
                        chocolate = '\n+ Chocolate';

                      }
                      else{
                        chocolatePrice = 0;
                        chocolate = '';
                      }
                      finalPrice = coffeeQty * (price + whippedCreamPrice + chocolatePrice);
                      display = '\nName: ' + controller.text
                           + whippedCream + chocolate + '\nQuantity: '
                          + coffeeQty.toString() + '\nPrice: ' + finalPrice.toString();
                    });
                  },
                  child: Text('Order'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        setState(() {
                          coffeeQty = 0;
                          plusMinusWidgetKey.currentState.setValue(coffeeQty);
                          controller.clear();
                          checkedBoxKeyC.currentState.setActivated(false);
                          checkedBoxKeyW.currentState.setActivated(false);
                          display = '';
                          whippedCream = '';
                          chocolate = '';
                          price = 5;
                        });
                      },
                      child: Text('Reset'),
                    ),
                    TextButton(
                      onPressed: () {
                        WcFlutterShare.share(
                          sharePopupTitle: 'Share',
                          subject: 'This is subject',
                          text: display,
                          mimeType: 'text/plain',
                        );
                      },
                      child: Text('Share Order'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
