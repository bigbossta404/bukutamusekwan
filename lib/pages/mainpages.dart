import 'package:buku_tamu_flutter/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: [
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
                        children: [
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
                    children: [
                      Flexible(
                          flex: 1,
                          child: katalogCard(Icons.people, "Tamu", "Tamu")),
                      Flexible(
                          flex: 1,
                          child: katalogCard(
                              Icons.newspaper, "Berita", _launchURL)),
                      Flexible(
                          flex: 1,
                          child: katalogCard(
                              Icons.question_answer, "Pertanyaan", 'Tanya')),
                    ],
                  ),
                )
              ],
            ),
          )),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WelcomeScreen();
            }));
          },
        ),
      ),
    );
  }
}

Card katalogCard(IconData iconData, String text, cardFunction) {
  return Card(
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
        cardFunction();
      },
      child: Column(children: [
        Container(
          height: 120,
          width: 180,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 40,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ]),
    ),
  );
}

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
