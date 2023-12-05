
import 'package:flutter/material.dart';

// PageName:Home

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 40, 0, 100),
      child: Drawer(
        width: MediaQuery.of(context).size.width / 1.09,
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(30))),
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // SizedBox(
            //   height: 220,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: blackcolor,
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.fromLTRB(20, 20, 5, 15),
            //       child: Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(bottom: 25,right: 20),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //             //     GestureDetector(
            //             //         onTap: (){
            //             //           Scaffold.of(context).openEndDrawer();
            //             //         },
            //             //         child: Icon(Icons.menu,size:30,)),
            //             //     Row(
            //             //       children: [
            //             //         SizedBox(
            //             //             height: 30,
            //             //             child: Image(image: AssetImage(logo))),
            //             //         SizedBox(
            //             //           width:20,
            //             //         ),
            //             //         // GestureDetector(
            //             //         //     onTap: (){
            //             //         //       Scaffold.of(context).openEndDrawer();
            //             //         //     },
            //             //         //     // child: SvgPicture.asset('asset/image/Vector.svg'))
            //             //         //   child: Text(""),),
            //             //       ],
            //             //     ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: (){
            //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StartPage(),));
            //   },
            //   child: ListTile(
            //     tileColor: blackcolor,
            //     // leading: SvgPicture.asset('asset/image/home.svg'),
            //     title: Text('Home',
            //         style: GoogleFonts.poppins(
            //           color: Colors.cyan,
            //           fontSize: 15,
            //           fontWeight: FontWeight.w600,
            //         )),
            //   ),
            // ),
          ],
        ),
      ),
    );

  }
}
