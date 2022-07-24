import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'WelcomeScreen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, HomeScreen.id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size =
        MediaQuery.of(context).size; //make theme of size for all screens

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
                          ],  ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "logo",
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ],),

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
                        topRight: Radius.circular(60),),

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
                            "Hello",
                            style: TextStyle(
                                color: Colors.green.shade900, fontSize: 40),
                          ),
                          SizedBox(
                            height: 20,
                            width: 370,
                          ),
                          // #email, #password

                          const SizedBox(height: 40),
                          // #login
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
