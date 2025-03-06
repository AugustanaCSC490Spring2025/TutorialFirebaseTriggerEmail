import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';

void main() {
  void main() async {
  /**WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(const MyApp());
}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Trigger Email Tutorial',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Firebase Trigger Email Tutorial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  Future<void> _sendEmail() async {
      //This part code was taken from Firebase Trigger Email Documentation and part from chatgpt
      FirebaseFirestore.instance.collection('mail').add({
        'to': ['isabellesmart21@augustana.edu'],
        'message': {
          'subject': "Hello from Firebase!",
          'text': "This is the plaintext section of the email body.",
          'html': "This is the <code>HTML</code> section of the email body.",
        },
      });
    
    //.then(() => console.log("Queued email for delivery!"));
   
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Push the button to send an email.'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendEmail,
        tooltip: 'Send Email',
        child: const Icon(Icons.add),
      ),
    );
  }
}
