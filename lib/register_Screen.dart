import 'package:bitcoin/main_Page.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'contants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class register_Screen extends StatefulWidget {
  static String id = "register_Screen";
  @override
  _register_ScreenState createState() => _register_ScreenState();
}

class _register_ScreenState extends State<register_Screen> {
  final auth = FirebaseAuth.instance;
  bool circle = false;
  String email;
  String password;
  bool hide = true;
  Icon icon = Icon(
    Icons.visibility_off_rounded,
    color: Colors.grey.shade900,
  );
  Icon iconHide = Icon(
    Icons.visibility_off_rounded,
    color: Colors.grey.shade900,
  );

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  void _showSnackbar() {
    final snack = SnackBar(
      content: Text("Email Already in use!"),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
    );
    _globalKey.currentState.showSnackBar(snack);
  }

  Icon iconShow = Icon(Icons.visibility, color: Colors.grey.shade900);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: circle,
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.black),
        ),
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/LoginUI.jpg"),
                      fit: BoxFit.cover),
                ),
                child: ListView(
                  shrinkWrap: false,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/bitcoinlogo.png"))),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: TextField(
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                        keyboardType: TextInputType.name,
                        decoration: KTextFieldDecoration.copyWith(
                            hintText: "Enter Full Name"),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: TextField(
                        onSubmitted: (String value) {
                          email = value;
                        },
                        onChanged: (String value) {
                          email = value;
                        },
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                        keyboardType: TextInputType.emailAddress,
                        decoration: KTextFieldDecoration.copyWith(
                            hintText: "Enter Email"),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: TextField(
                        onChanged: (String value) {
                          password = value;
                        },
                        onSubmitted: (String value) {
                          password = value;
                        },
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                        obscureText: hide,
                        decoration: KTextFieldDecoration.copyWith(
                          hintText: "Enter Password",
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
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Material(
                        elevation: 50.0,
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          splashColor: Colors.white,
                          onTap: () async {
                            setState(() {
                              circle = true;
                            });
                            try {
                              final user =
                                  await auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (user != null) {
                                setState(() {
                                  circle = false;
                                });
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Icon(
                                            Icons.check_circle,
                                            size: 30,
                                          ),
                                          content: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Text(
                                              'Registration Successful',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ));
                              }
                            } catch (e) {
                              setState(() {
                                circle = false;
                              });
                              _showSnackbar();
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.orange.shade600,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
