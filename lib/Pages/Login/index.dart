import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Services/Authentication/index.dart';
import 'package:mobile/Components/Loading/index.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Authentication _auth = Authentication();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // State
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: new AppBar(
              brightness: Brightness.light,
              backgroundColor: Color(0xFFF5FFFA),
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xFF322153),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            backgroundColor: Color(0xFFF5FFFA),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 60),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 50),
                        width: 80,
                        child: Image.asset(
                          "assets/images/simbolo-consulta.png",
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          onChanged: (str) {
                            setState(() => email = str);
                          },
                          validator: (value) =>
                              value.isEmpty ? 'Insira um e-mail válido' : null,
                          decoration: InputDecoration(
                            hintText: "Digite seu e-mail",
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
                              Icons.email,
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Color(0xFFF7F7F7),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        child: TextFormField(
                          validator: (val) => val.length < 6
                              ? 'A senha deve ter mais de 6 caracteres'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          decoration: InputDecoration(
                            hintText: "Digite sua senha",
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
                              Icons.vpn_key,
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Color(0xFFF7F7F7),
                          ),
                          obscureText: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Esqueceu a senha?",
                                style: TextStyle(color: Color(0xFF757575)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: EdgeInsets.only(top: 15),
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'Não é possível entrar com essas credenciais';
                                  loading = false;
                                });
                              }
                            }
                          },
                          child: Text(
                            "Entrar".toUpperCase(),
                            style: TextStyle(color: Colors.black),
                          ),
                          color: Color(0xFFE0E0E0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "• ou •".toUpperCase(),
                              style: TextStyle(
                                color: Color(0xFF757575),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: EdgeInsets.only(top: 20),
                        child: RaisedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          label: Text(
                            "Entrar com o google".toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                          color: Color(0xFFE2325A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: EdgeInsets.only(top: 10),
                        child: RaisedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          label: Text(
                            "Entrar com o facebook".toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                          ),
                          color: Color(0xFF3F51B5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                //Navigator.pushNamed(context, '/register');
                                widget.toggleView();
                              },
                              child: Text(
                                "Novo por aqui? Cadastre-se",
                                style: TextStyle(
                                  color: Color(0xFF757575),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
