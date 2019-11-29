import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_vote_app/pages/votes/first_page.dart';
import 'package:web_vote_app/styles/app_string.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        html.window.open(devfest2019SongdoLink, "");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                                image: NetworkImage(devfestImage),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken))),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  profileImage,
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          top: 16,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "플러터로 IoT개발, 어렵지 않아",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "부재: 야 너두 Native처럼 할 수 있어",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                "박제창(JAICHANG.PARK)",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Dreamwalker",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("Angel Robotics"),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                        return VoteTestPage();
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.green[300]),
                      child: Center(
                        child: Text(
                          "입장하기",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    ));
  }

  _launchURL() async {
    const url = '';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
