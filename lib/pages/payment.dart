import 'package:flutter/material.dart';
import 'package:thasmai/constants/consts.dart';

import '../widgets/bottombutton_w.dart';
import '../widgets/paymenttile.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  bool isPressed = false;

  void ButtonState() {
    setState(() {
      isPressed = !isPressed;
    });
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        isPressed = !isPressed;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.1, fit: BoxFit.cover, image: AssetImage(bgimage))),
        child: SafeArea(
                  child: Padding(
        padding: const EdgeInsets.only(right: 10,left: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.menu, color: Colors.black, size: 35),
                    );
                  },
                ),
                SizedBox(width: 45, height: 45, child: Image.asset(logo)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "Dekshina",
                  ),
                ],
              ),
            ),
            Spacer(),
            PaymentTile(text: 'Meditation Fee', ontap: () {  },),
            Spacer(),
            PaymentTile(text: 'Guru Dekshina', ontap: () {  },),
            Spacer(),
            PaymentTile(text: 'Donations', ontap: () {  },),
            Spacer(flex: 2,),
            BottomButton(
                boolval: isPressed,
                buttontext: "Back",
                ontap: () {
                  ButtonState();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => (),
                  //     ));
                }),
            Spacer(),
          ],
        ),
                  ),
                ),
      ),
    );
  }
}
