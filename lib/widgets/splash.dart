import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Color(0xff212121),
        body: Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xff121E35), Color(0xff5E7298)])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/logo.png",
                      height: 150,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        child: Text("Sekretariat DPRD Kota Cirebon",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 30)))
                  ],
                )),
                // Container(
                //   margin: EdgeInsets.all(10),
                //   child: Text(
                //     "Sekretariat DPRD Kota Cirebon",
                //     style: TextStyle(
                //         fontWeight: FontWeight.w600,
                //         color: Colors.white,
                //         fontSize: 30),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
