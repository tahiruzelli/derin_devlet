import 'package:flutter/material.dart';

import 'mainPage.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/background.png",
              height: height, width: width, fit: BoxFit.fill),
          Container(
            height: height,
            width: width,
            child: Column(
              children: [
                Container(
                  height: height * 0.488,
                  width: width,
                  child: Image.asset("assets/derindevlet.gif"),
                ),
                Container(
                  height: height * 0.488,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      button(
                          height, width, "YENİ OYUN", Icons.arrow_forward_ios),
                      button(height, width, "AYARLAR", Icons.settings),
                      button(height, width, "İSTATİSTİK", Icons.graphic_eq),
                      button(height, width, "BAĞIŞ", Icons.attach_money),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "created by SOFTINYO AŞ",
                      style: TextStyle(color: Colors.white),
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

  button(double height, double width, String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        },
        child: Container(
          height: height * 0.05,
          width: width * 0.46,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(icon, color: Colors.grey),
              ),
              Padding(
                padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*0.12),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
