import 'package:bitcoin/home_page.dart';
import 'package:bitcoin/main_Page.dart';
import 'package:flutter/material.dart';
import 'contants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

// ignore: camel_case_types
class login_Page extends StatefulWidget {
  static String id = "login_Page";
  @override
  _login_PageState createState() => _login_PageState();
}

// ignore: camel_case_types
class _login_PageState extends State<login_Page> {
  final auth = FirebaseAuth.instance;
  String email;
  String password;
  bool circle = false;
  bool hide = true;
  Icon icon = Icon(
    Icons.visibility_off_rounded,
    color: Colors.grey.shade900,
  );
  Icon iconHide = Icon(
    Icons.visibility_off_rounded,
    color: Colors.grey.shade900,
  );
  Icon iconShow = Icon(Icons.visibility, color: Colors.grey.shade900);
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  void _showSnackbar() {
    final snack = SnackBar(
      content: Text("Sign in Failed"),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
    );
    _globalKey.currentState.showSnackBar(snack);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          key: _globalKey,
          resizeToAvoidBottomInset: false,
          body: ModalProgressHUD(
            inAsyncCall: circle,
            progressIndicator: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/LoginUI.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                ListView(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                            tag: 'logo',
                            child: Image.asset("images/bitcoinlogo.png")),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                          onSubmitted: (String value) {
                            email = value;
                          },
                          onChanged: (String value) {
                            email = value;
                          },
                          decoration: KTextFieldDecoration.copyWith(
                              hintText: "Enter Email"),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          onChanged: (String value) {
                            password = value;
                          },
                          onSubmitted: (String value) {
                            password = value;
                          },
                          obscureText: hide,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: icon,
                              onPressed: () {
                                // ignore: unnecessary_statements
                                setState(() {
                                  if (hide == true) {
                                    hide = false;
                                    icon = iconHide;
                                  } else {
                                    hide = true;
                                    icon = iconShow;
                                  }
                                });
                              },
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            hintText: "Enter Password",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            fillColor: Colors.white70,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.orange.shade900, width: 2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          splashColor: Colors.black54,
                          elevation: 10,
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.orange.shade600,
                          onPressed: () async {
                            setState(() {
                              circle = true;
                            });
                            try {
                              final user =
                                  await auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (user != null) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));
                                setState(() {
                                  circle = false;
                                });
                              }
                            } catch (e) {
                              _showSnackbar();
                              setState(() {
                                circle = false;
                              });
                            }
                          },
                          child: Text(
                            "Log In",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
                Positioned(
                    top: 10,
                    left: 5,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, main_Page.id);
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
