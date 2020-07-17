import 'package:flutter/material.dart';
import 'package:mobile/Services/Authentication/index.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Components/AppBar/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Authentication _auth = Authentication();

  // State
  String uf = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Color(0xFFF5FFFA),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Center(
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
                width: double.infinity,
                margin: EdgeInsets.only(top: 30),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 6, horizontal: 6),
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
                      Icons.terrain,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Color(0xFFFAFAFA),
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
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 6, horizontal: 6),
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
                    fillColor: Color(0xFFFAFAFA),
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
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 6, horizontal: 6),
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
                      Icons.work,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Color(0xFFFAFAFA),
                  ),
                  items: [
                    'Clínico Geral',
                    'Cardiologista',
                    'Oncologista',
                    'Pediatria',
                    'Nutricionista'
                  ].map((value) {
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
                width: double.infinity,
                height: 40,
                margin: EdgeInsets.only(top: 15),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "Buscar".toUpperCase(),
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Color(0xFFE0E0E0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Início"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text("Perfil"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          title: Text("Agenda"),
        ),
      ]),
    );
  }
}
