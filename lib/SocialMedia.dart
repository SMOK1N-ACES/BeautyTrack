import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as Firestore;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class SocialMedia extends StatefulWidget {
  @override
  _SocialMedia createState() => _SocialMedia();
}

class _SocialMedia extends State<SocialMedia> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Gallery'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              //color: Theme.of(context).accentColor,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 800, child: Image.asset("Pics/tok.png",fit: BoxFit.contain,),),

                  ],
                ),
              ),
            ),
          ),
        ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
        height: 50,
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: new Text('My Collection'),
                      color: Colors.pink[200],
                      textColor: Colors.white,
                      onPressed: () async {
                        try {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  home_page()));
                        }
                        catch (e) {
                          print(e);
                        };

                      }
                    ),
                    RaisedButton(
                      child: new Text('My Community'),
                      color: Colors.pink[200],
                      textColor: Colors.white,
                      onPressed: () async {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SocialMedia()),
                        );
                      },
                    ),
              ]),
        ],
      ),
    ),
    ),
    );
  }
}