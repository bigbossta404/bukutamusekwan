import 'dart:async';
import 'package:path/path.dart';
import 'package:buku_tamu_flutter/pages/mainpages.dart';
import 'package:buku_tamu_flutter/widgets/form_buku.dart';
import 'package:buku_tamu_flutter/widgets/splash.dart';
import 'package:buku_tamu_flutter/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: GestureDetector(
                child: Center(
                    child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xff121E35), Color(0xff5E7298)])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/logo.png",
                            height: 150,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: <Widget>[
                                Text("KATALOG",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 40)),
                                Text("Sekretariat DPRD Kota Cirebon",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                        fontSize: 30))
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                                flex: 1,
                                child: Card(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  color: Color(0xffD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  elevation: 5,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    borderRadius: BorderRadius.circular(50.0),
                                    onTap: () {
                                      showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(
                                                builder: (context, setState) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom),
                                                child: Wrap(
                                                  children: <Widget>[
                                                    Container(
                                                      color: Colors.transparent,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xffEFEFEF),
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        40),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        40))),
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  20),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 30,
                                                                  right: 30),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 25,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Tambah Daftar Tamu",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                30,
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                      Text(
                                                                        "silahkan isi data yang telah disediakan",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  // Text(
                                                                  //   DateFormat(
                                                                  //           'MM/dd/yyyy hh:mm:ss')
                                                                  //       .format(
                                                                  //           DateTime.now()),
                                                                  // ),
                                                                  Spacer(),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 25,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            20),
                                                                child: Column(
                                                                  children: [
                                                                    TextField(
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20),
                                                                        decoration:
                                                                            InputDecoration(
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Color(0xffF69F32), width: 3),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          border:
                                                                              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                                          hintText:
                                                                              "Nama anda",
                                                                          // hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black12),
                                                                          labelText:
                                                                              "Nama Lengkap",
                                                                        )),
                                                                    SizedBox(
                                                                      height:
                                                                          25,
                                                                    ),
                                                                    TextField(
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20),
                                                                        decoration:
                                                                            InputDecoration(
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Color(0xffF69F32), width: 3),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          border:
                                                                              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                                          hintText:
                                                                              "Instansi",
                                                                          // hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black12),
                                                                          labelText:
                                                                              "Instansi",
                                                                        )),
                                                                    SizedBox(
                                                                      height:
                                                                          25,
                                                                    ),
                                                                    TextField(
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20),
                                                                        decoration:
                                                                            InputDecoration(
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(color: Color(0xffF69F32), width: 3),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          border:
                                                                              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                                          hintText:
                                                                              "Keperluan",
                                                                          labelText:
                                                                              "Keperluan",
                                                                        )),
                                                                    SizedBox(
                                                                      height:
                                                                          25,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                          });
                                    },
                                    child: Column(children: <Widget>[
                                      Container(
                                        height: 120,
                                        width: 180,
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.people,
                                              size: 40,
                                            ),
                                            Text(
                                              'Tamu',
                                              style: TextStyle(fontSize: 20),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Card(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  color: Color(0xffD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  elevation: 5,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    borderRadius: BorderRadius.circular(50.0),
                                    onTap: () {
                                      _launchURL();
                                    },
                                    child: Column(children: <Widget>[
                                      Container(
                                        height: 120,
                                        width: 180,
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.newspaper,
                                              size: 40,
                                            ),
                                            Text(
                                              'Berita',
                                              style: TextStyle(fontSize: 20),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                )),
                            Flexible(
                                flex: 1,
                                child: Card(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  color: Color(0xffD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  elevation: 5,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    borderRadius: BorderRadius.circular(50.0),
                                    onTap: () {},
                                    child: Column(children: <Widget>[
                                      Container(
                                        height: 120,
                                        width: 180,
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.question_answer,
                                              size: 40,
                                            ),
                                            Text(
                                              'Pertanyaan',
                                              style: TextStyle(fontSize: 20),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                onLongPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WelcomeScreen();
                  }));
                },
              ),
            ),
          );
        }
      },
    );
  }
}

// Card katalogCard(IconData iconData, String text, cardFunction) {

// }

_launchURL() async {
  const url = 'https://dprd.cirebonkota.go.id';
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}

// class Signature extends CustomClipper {
//   List<Offset> points;
//   Signature({this.points});

//   @override
//  void paint(Canvas canvas, Size size){

// Paint paint = new Paint()
// ..color = Colors.black
// ..strokeCap = StrokeCap.round
// ..strokeWidth = 5.0;

//   for(int i = 0; i<points.length-1; i++){
//     if(points[i] != null && points[i+1] != null){
//         canvas.drawLine(points[i], points[i+1], paint)
//     }
//   }
//  }

//   @override
//   bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;
// }

void showMyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Text(
          'Message',
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
