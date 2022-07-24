import 'package:flutter/material.dart';
import 'dart:async';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'LogInScreen.dart';

class SignUpScreen extends StatefulWidget {
 static const id = 'SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<void>? _launched;
    final Uri _urlf = Uri.parse('https://www.facebook.com/');
    bool _hasCallSupport = false;
    Future<void> _launchUrl(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    }

    final Uri _urlg = Uri.parse('https://accounts.google.com/signin/v2/identifier?elo=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin');
    void initState() {
      super.initState();
      // Check for phone call support.
      canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
        setState(() {
          _hasCallSupport = result;
        });
      });
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.green.shade900,
                Colors.green.shade500,
                Colors.green.shade400,
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              // #login, #welcome

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/911.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Welcome ",
                              style:
                              TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              /*Column(
            children:[
                Image(
                image:  NetworkImage('https://i.pinimg.com/564x/6e/ec/06/6eec063b0173b41669573d78cff2637e.jpg') ),
              ],
          ),*/

              const SizedBox(height: 20),

              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.green.shade900, fontSize: 40),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // #email, #password
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(171, 171, 171, .7),
                                    blurRadius: 20,
                                    offset: Offset(0, 10)),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200)),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle:
                                        TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200)),
                                  ),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                        TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          // #login
                          Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.green[800]),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          // #login SNS
                          const Text(
                            "Sign up with ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue),
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: () => setState(() {
                                        _launched = _launchUrl(_urlf);
                                      }),
                                      child: Text(
                                        "Facebook",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black38),
                                  child:  Center(
                                    child: ElevatedButton(
                                      onPressed: () => setState(() {
                                        _launched = _launchUrl(_urlg);
                                      }),
                                      child: Text(
                                        "Google",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),
                          // #login SNS
                          Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.transparent),
                            child:
                            RaisedButton(
                              color: Colors.transparent,
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, LogInScreen.id);
                              },
                            ),



                          ),
                          /*
                          * recognizer: new TapGestureRecognizer()
                    ..onTap = () { launch('https://www.facebook.com/');

                          * */
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
