import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        brightness: Brightness.light,
        backgroundColor: Color(0xFFF5FFFA),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF5FFFA),
      body: Padding(
        padding: EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 50),
              width: 200,
              child: Image.asset(
                "assets/images/logo-cropped.png",
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 280),
              child: Text(
                "Seu marketplace de consultas médicas",
                style: GoogleFonts.ubuntu(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF322153),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 280),
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Ajudamos pessoas a encontrar médicos por meio de recomendações.",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Color(0xFF6C6C80),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 35),
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text(
            "Vamos lá".toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          color: Color(0xFF3F51B5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
