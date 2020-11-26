import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math';

import 'datas.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  static AudioPlayer audioPlugin = AudioPlayer();
  Datas datas = Datas();

  var rand = Random();
  List title = [
    "Diyanet İşleri Bakanı",
    "Hazine ve Maliye Bakanı",
    "Milli Savunma Bakanı",
    "İçişleri Bakanı",
    "Adalet Bakanı",
    "Aile ve Sosyal Hizmetler Bakanı",
    "Çevre ve Şehircilik Bakanı",
    "Dışişleri Bakanı",
    "Enerji ve Tabii Kaynaklar Bakanı",
    "Gençlik ve Spor Bakanı",
    "Kültür ve Turizm Bakanı",
    "Milli Eğitim Bakanı",
    "Sağlık Bakanı",
    "Sanayi ve Teknoloji Bakanı",
    "Tarım ve Orman Bakanı",
    "Ticaret Bakanı",
    "Ulaştırma ve Altyapı Bakanı",
  ];

  double para = 50;
  double halk = 50;
  double ordu = 50;
  @override
  Widget build(BuildContext context) {
    int sayi = rand.nextInt(10);
    print(sayi);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/background.png",
            fit: BoxFit.fill,
            height: height,
            width: width,
          ),
          Container(
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 0.16,
                  width: width * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5),
                          chart(Icons.attach_money, para),
                          SizedBox(height: 5),
                          Text(
                            "Para: $para",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5),
                          chart(Icons.people, halk),
                          SizedBox(height: 5),
                          Text(
                            "Halk: $halk",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5),
                          chart(Icons.star, ordu),
                          SizedBox(height: 5),
                          Text(
                            "Ordu: $ordu",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                //kişi baslik
                Text(
                  datas.sorular[sayi]['bakan'],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                //image
                CircleAvatar(
                  radius: 150,
                  backgroundImage:
                      AssetImage(datas.sorular[sayi]['bakanImgUrl']),
                  // child: Container(
                  //   height: height * 0.4,
                  //   width: width,
                  //   child: Image.asset(
                  //     ,
                  //   ),
                  // ),
                ),
                //question
                Padding(
                  padding: EdgeInsets.only(left:width*0.05),
                  child: Container(
                    height: height * 0.16,
                    width: width * 0.8,
                    child: Text(
                      datas.sorular[sayi]['soru'],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                //buttons
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.05),
                  child: Container(
                    height: height * 0.15,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 1,
                                  width: width * 0.1,
                                  color: Colors.grey,
                                ),
                                Container(
                                  height: 1,
                                  width: width * 0.1,
                                  color: Colors.grey,
                                ),
                                Container(
                                  height: 1,
                                  width: width * 0.1,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                
                                setState(() {
                                  audioPlugin.play("music.mp3");
                                  if (datas.sorular[sayi]['artacakDeger'] ==
                                      'halk') {
                                    halk += datas.sorular[sayi]['artacakPuan'];
                                  } else if (datas.sorular[sayi]
                                          ['artacakDeger'] ==
                                      'para') {
                                    para += datas.sorular[sayi]['artacakPuan'];
                                  } else if (datas.sorular[sayi]
                                          ['artacakDeger'] ==
                                      'ordu') {
                                    ordu += datas.sorular[sayi]['artacakPuan'];
                                  }
                                  if (datas.sorular[sayi]['azalacakDeger'] ==
                                      'halk') {
                                    halk -= datas.sorular[sayi]['azalacakPuan'];
                                  } else if (datas.sorular[sayi]
                                          ['azalacakDeger'] ==
                                      'para') {
                                    para -= datas.sorular[sayi]['azalacakPuan'];
                                  } else if (datas.sorular[sayi]
                                          ['azalacakDeger'] ==
                                      'ordu') {
                                    ordu -= datas.sorular[sayi]['azalacakPuan'];
                                  }
                                });
                              },
                              child: Container(
                                height: height * 0.1,
                                width: width * 0.35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    datas.sorular[sayi]['secenekOlumlu'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (datas.sorular[sayi]['artacakDeger'] ==
                                      'halk') {
                                    halk -= datas.sorular[sayi]['artacakPuan'];
                                  } else if (datas.sorular[sayi]
                                          ['artacakDeger'] ==
                                      'para') {
                                    para -= datas.sorular[sayi]['artacakPuan'];
                                  } else if (datas.sorular[sayi]
                                          ['artacakDeger'] ==
                                      'ordu') {
                                    ordu -= datas.sorular[sayi]['artacakPuan'];
                                  }
                                  if (datas.sorular[sayi]['azalacakDeger'] ==
                                      'halk') {
                                    halk += datas.sorular[sayi]['azalacakPuan'];
                                  } else if (datas.sorular[sayi]
                                          ['azalacakDeger'] ==
                                      'para') {
                                    para += datas.sorular[sayi]['azalacakPuan'];
                                  } else if (datas.sorular[sayi]
                                          ['azalacakDeger'] ==
                                      'ordu') {
                                    ordu += datas.sorular[sayi]['azalacakPuan'];
                                  }
                                });
                              },
                              child: Container(
                                height: height * 0.1,
                                width: width * 0.35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    datas.sorular[sayi]['secenekOlumsuz'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 1,
                                  width: width * 0.1,
                                  color: Colors.grey,
                                ),
                                Container(
                                  height: 1,
                                  width: width * 0.1,
                                  color: Colors.grey,
                                ),
                                Container(
                                  height: 1,
                                  width: width * 0.1,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Stack chart(IconData icon, double deger) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9999),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: SfRadialGauge(
            // title: GaugeTitle(
            //   text: "Bisiklet",
            //   textStyle: GoogleFonts.poppins(fontSize: 40),
            // ),
            axes: <RadialAxis>[
              RadialAxis(
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    positionFactor: 0.1,
                    angle: 89,
                    widget: Icon(
                      icon,
                      size: 50,
                      color: Color(0xFF151515),
                    ),
                  )
                ],
                radiusFactor: 0.9,
                pointers: <GaugePointer>[
                  RangePointer(
                    color: Color(0xFF151515),
                    value: deger,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 0.2,
                    sizeUnit: GaugeSizeUnit.factor,
                  )
                ],
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.2,
                  cornerStyle: CornerStyle.endCurve,
                  color: Color.fromARGB(30, 50, 150, 200),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
