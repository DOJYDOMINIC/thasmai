import 'package:flutter/material.dart';

import '../constants/consts.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, required this.text, required this.ontap,});

  final String text;
  final VoidCallback ontap;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 5),
        child: Container(
          height: height/8,
          width: width,
          decoration: decor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: Text(
                    text,
                    style: timeStyl,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: whitecolor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
