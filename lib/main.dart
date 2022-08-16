import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homerental/Route/LoginScreen.dart';
import 'package:homerental/signin.dart';
// here added asy firebase for not exception erroe
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Rental',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
            // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
                primarySwatch: Colors.blue,
      ),
      home:LoginScreen(),
      //const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
 return Scaffold(
   appBar: AppBar(
     title:Text(widget.title),
     centerTitle: true,
   ),
   body:  Column(
   children: [
     ElevatedButton(onPressed: (){}, child: null,)
   ],
   ),
 );
  }
}
