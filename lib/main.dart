import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as Firestore;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:demo/home_page.dart';
import 'package:demo/service_locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary:  Colors.pink[200],
          secondary:  Colors.purple[500],
        ),
        textTheme: Typography(platform: TargetPlatform.iOS).black,
        appBarTheme: AppBarTheme(

        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";

    final emailField = TextField(
      //keyboardType: TextInputType.number,
      obscureText: false, //allows users to see text
      //style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Google Email Address",
          helperText: "ex beauty@gmail.com",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onChanged: (value){
        email = value.trim();
      },
    );

    final passwordField = TextField(
      obscureText: true, //hides the text
      //style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          helperText: "ex. myMak3up1",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onChanged: (value){
        password = value.trim();
      },
    );



    Future emailVerify() async{
      try {
        email = "jyalarid@gmail.com";
        password = "Hnt*r030";

        final newUser = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        Fluttertoast.showToast(
            msg: "Login Success",
            timeInSecForIosWeb: 3,
        );

        Navigator.push(context, MaterialPageRoute(builder: (context) => home_page()),
        );
      }
      catch (e) {
        print(e);
        Fluttertoast.showToast(
            msg: "Login Failed" ,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red
        );
      }
    }

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: ()  async {
          await emailVerify();
          //print(email);
          //print(password);
          //print("login attempt");
        },
        child: Text("Login",
            textAlign: TextAlign.center,
      ),
    ));


    return Scaffold(
        appBar: AppBar(
          title: Text('Beauty Track'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              //color: Theme.of(context).accentColor,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //SizedBox(height: 275, child: Image.asset("Pics/logo.PNG",fit: BoxFit.contain,),),
                    SizedBox(height: 45.0), emailField,
                    SizedBox(height:15.0), passwordField,
                    SizedBox(height: 15.0,), loginButon,
                    //SizedBox(height: 15.0,), createAccountButton,

                  ],
                ),
              ),
            ),
          ),
        )

    );
  }
}
