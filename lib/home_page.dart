import 'dart:developer';
import 'dart:io' show Platform;
import 'package:demo/SocialMedia.dart';
import 'package:demo/TakePictureScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:provider/provider.dart';
import 'package:demo/screens/feed_screen.dart';




class home_page extends StatelessWidget {

  // This widget is the root of your application.
  String qrString = "";
  Future _launchURL() async {
    const url = 'https://www.amazon.com/Laura-Mercier-Secret-Concealer-Ounce/dp'
        '/B00062A0MK/ref=sr_1_5?crid=197GBPZN3AWVD&keywords=laura+mercier+secret'
        '+concealer&qid=1653667093&sprefix=laura+mercier+sec%2Caps%2C116&sr=8-5';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    void expiryDialog() {
      showDialog(context: context,
          barrierDismissible: true, //force user to tap button
          builder: (context) {
            return AlertDialog(
                title: Text("Your Product is About to Expire!"),
              titleTextStyle:
              TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
              actionsOverflowButtonSpacing: 20,
              actions: [
                ElevatedButton(
                    onPressed: (){

                  },
                    child: Text("Amazon"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent , // set the background color
                      ),
                ),
                ElevatedButton(
                    onPressed: (){},
                    child: Text("Sephora"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black , // set the background color
                  ),
                ),
                ElevatedButton(onPressed: (){},
                    child: Text("Walmart"),
                    style: ElevatedButton.styleFrom(
                    primary: Colors.blue , // set the background color
                  ),
                ),
              ],
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                ],
              ),
            );
          }
      );
    }
    void reorderDialog() {
      showDialog(context: context,
          barrierDismissible: true, //force user to tap button
          builder: (context) {
            return AlertDialog(
                title: Text("Would you like to re-order?"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(

                    )
                  ],
                ),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    _launchURL();

                  },
                  child: Text("Amazon"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent , // set the background color
                  ),
                ),
                ElevatedButton(
                  onPressed: (){},
                  child: Text("Sephora"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black , // set the background color
                  ),
                ),
                ElevatedButton(onPressed: (){},
                  child: Text("Walmart"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue , // set the background color
                  ),
                ),
              ],
            );
          }
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('My Collection'),
          ),
      body: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("Laura Mercier Secret Concealer"),
                  subtitle: Text("Original Life: 12M"),
                  leading: Icon(Icons.battery_full),
                  trailing: Wrap(
                    spacing: 6, // space between two icons
                    children: const <Widget>[
                      Icon(Icons.access_alarm_sharp), // icon-1
                      Text("12M"), // icon-2
                    ],

                  ),
                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.yellow, width: 1), borderRadius: BorderRadius.circular(5)),
                  onTap: () {
                    reorderDialog();
                  },
                ),
                ListTile(title: Text("Sania's Brow Bar Angled Mechanical Brow Pencil "),
                  subtitle: Text("Original Life: 12M"),
                  leading: Icon(Icons.anchor),
                  trailing: Wrap(
                    spacing: 6, // space between two icons
                    children: const <Widget>[
                      Icon(Icons.access_alarm_sharp), // icon-1
                      Text("10M"), // icon-2
                    ],
                  ),
                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.yellow, width: 1), borderRadius: BorderRadius.circular(5)),

                ),
                ListTile(title: Text("Sephora Ultra Shine Lip Gel"),
                  textColor: Colors.red,
                  subtitle: Text("Original Life: 12M"),
                  leading: Icon(Icons.access_alarm),
                  trailing: Wrap(
                    spacing: 6, // space between two icons
                    children: const <Widget>[
                      Icon(Icons.access_alarm_sharp, color: Colors.red,),
                      // icon-1
                      Text("8 Days"),
                      // icon-2
                    ],
                  ),
                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.yellow, width: 1), borderRadius: BorderRadius.circular(5)),

                  onTap: () {
                    expiryDialog();
                  },
                ),
                ListTile(title: Text("Morphe Micro Brow Pencil"),
                  subtitle: Text("Original Life: 12M"),
                  leading: Icon(Icons.ballot),
                  trailing: Wrap(
                    spacing: 6, // space between two icons
                    children: const <Widget>[
                      Icon(Icons.access_alarm_sharp), // icon-1
                      Text("1M"), // icon-2
                    ],
                  ),
                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.yellow, width: 1), borderRadius: BorderRadius.circular(5)),

                )
              ],
              shrinkWrap: true,
            ),


      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 110,
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      child: const Icon(Icons.add),
                      backgroundColor: Colors.deepPurple[300],
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const QRViewExample(),
                        ));
                      },
                    ),
                  ]),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: new Text('My Collection'),
                      color: Colors.pink[200],
                      textColor: Colors.white,
                      onPressed: () async {
                        /*
                        try {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProfileInfo(userID)));
                        }
                        catch (e) {
                          print(e);
                        }*/
                      },
                    ),
                    RaisedButton(
                      child: new Text('My Community'),
                      color: Colors.pink[200],
                      textColor: Colors.white,
                      onPressed: () async {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FeedScreen()),
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

  createListTile(String name, String date) {
    DateTime now = new DateTime.now();

    ListTile tempListTile = ListTile(
      title: Text(name), leading: Icon(Icons.ballot), trailing: Wrap(
      spacing: 6, // space between two icons
      children: <Widget>[
        Icon(Icons.access_alarm_sharp), // icon-1
        Text(date + "M"), // icon-2
      ],
    ),
    );
    return tempListTile;
  }
}
class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    void legalDialogue(){
      showDialog(context: context,
          barrierDismissible: true, //force user to tap button
          builder: (context)
          {
            return AlertDialog(
                title: Text("Capture Success"),
                content: SingleChildScrollView(
                  child: ListBody(
                  children: const <Widget>[
                    Text('Barcode Scanned: 17919 01539'),
                    Text('Product Name: Teint Idole Ultra Wear'),
                    Text('Expiration Time: 6M'),
                  ],
                  ),
                ),
                actions: <Widget>[
                  RaisedButton(
                      child: new Text('Add to My Collection'),
                      color: Colors.orangeAccent,
                      textColor: Colors.black,
                      onPressed: () async {
                        try {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => home_page()));
                        }
                        catch (e) {
                          print(e);
                        };

                      }
                  ),
                ]
            );
          }
      );
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    const Text('Barcode/Expiry Reader'),
                    const Text('Single picture extracts barcode info, expiration date, and adds it to collection'),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      RaisedButton(
                        child: new Text('Capture'),
                        color: Colors.blue,
                        textColor: Colors.black,
                        onPressed: () async {

                                            try {
                                              legalDialogue();
                                            }
                                            catch (e) {
                                              print(e);
                                            }
      },
    ),
                ],
              ),
    ]
            ),
          )
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.blue,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}