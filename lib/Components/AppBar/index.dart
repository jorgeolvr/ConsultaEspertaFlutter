import 'package:flutter/material.dart';
import 'package:mobile/Models/User/index.dart';
import 'package:mobile/Services/Authentication/index.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Authentication _auth = Authentication();

  @override
  Widget build(BuildContext context) {
    // State global para acessar dados do usuário
    final user = Provider.of<User>(context);

    _showBottomModalSheet() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    user.displayName,
                    style: TextStyle(fontSize: 18),
                  ),
                  InkWell(
                    onTap: () async {
                      await _auth.signOut();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sair",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF322153),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    }

    return new AppBar(
      brightness: Brightness.light,
      backgroundColor: Color(0xFFF5FFFA),
      elevation: 0,
      leading: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(
          Icons.account_circle,
          //size: 30,
          color: Color(0xFF322153),
        ),
        onPressed: () {
          _showBottomModalSheet();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
