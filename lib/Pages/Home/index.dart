import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile/Services/Authentication/index.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseUser currentUser;
  final Authentication _auth = Authentication();
  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      setState(() {
        this.currentUser = user;
      });
    });
  }

  String _getUsername() {
    if (currentUser != null) {
      return currentUser.displayName;
    } else {
      return '';
    }
  }

  String uf = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        brightness: Brightness.light,
        backgroundColor: Color(0xFFF5FFFA),
        elevation: 0,
        /*title: Container(
          width: 40,
          child: Image.asset("assets/images/simbolo-consulta.png"),
        ), */
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Color(0xFF3F51B5),
          ),
          onPressed: () async {
            await _auth.signOut();
          },
        ),
      ),
      backgroundColor: Color(0xFFF5FFFA),
      body: Padding(
        padding: EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Text(
                "Reivente seu jeito de agendar consultas",
                style: GoogleFonts.ubuntu(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF322153),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 300),
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "Busque profissionais por especialidade, localização, preço ou nota de avaliação.",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Color(0xFF6C6C80),
                ),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 40),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: "Estado",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFA0A5BD),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.language,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF7F7F7),
                ),
                items: ['MG', 'RJ', 'SP'].map((value) {
                  return DropdownMenuItem(child: Text(value), value: value);
                }).toList(),
                onChanged: (String value) {
                  setState(() {
                    uf = value;
                  });
                },
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: "Cidade",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFA0A5BD),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF7F7F7),
                ),
                items: ['MG', 'RJ', 'SP'].map((value) {
                  return DropdownMenuItem(child: Text(value), value: value);
                }).toList(),
                onChanged: (String value) {
                  setState(() {
                    uf = value;
                  });
                },
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  hintText: "Especialidade",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFA0A5BD),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.person_pin,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF7F7F7),
                ),
                items: ['MG', 'RJ', 'SP'].map((value) {
                  return DropdownMenuItem(child: Text(value), value: value);
                }).toList(),
                onChanged: (String value) {
                  setState(() {
                    uf = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
