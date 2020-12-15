import 'package:bitcoin/login_Page.dart';
import 'package:bitcoin/register_Screen.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class main_Page extends StatefulWidget {
  static String id = "main_Page";
  @override
  _main_PageState createState() => _main_PageState();
}

// ignore: camel_case_types
class _main_PageState extends State<main_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) => Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/ui.jpg"), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 85,
                left: 50,
                child: Container(
                  child: Column(
                    children: [
                      InkWell(
                        splashColor: Colors.black,
                        onTap: () {
                          Navigator.pushNamed(context, login_Page.id);
                        },
                        child: Material(
                          elevation: 50.0,
                          borderRadius: BorderRadius.circular(30),
                          // color: Colors.transparent,
                          child: Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.orange.shade600,
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Material(
                        elevation: 50.0,
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          splashColor: Colors.white,
                          onTap: () {
                            Navigator.pushNamed(context, register_Screen.id);
                          },
                          child: Container(
                            width: 300,
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
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 245,
                  left: 83,
                  child: Hero(
                    tag: 'logo',
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/bitcoinlogo.png"),
                      backgroundColor: Colors.transparent,
                      radius: 110,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
