// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert'; // For json decoding
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Surgy Innovations Lab',
//       theme: ThemeData(primarySwatch: Colors.green),
//       home: const AuthForm(),
//     );
//   }
// }

// class AuthForm extends StatefulWidget {
//   const AuthForm({super.key});
//   @override
//   State<AuthForm> createState() => _AuthFormState();
// }

// class _AuthFormState extends State<AuthForm> {
//   bool isLogin = true;
//   bool isLoggedIn = false;

//   final _formKey = GlobalKey<FormState>();
//   String name = '';
//   String email = '';
//   String phone = '';

//   // Change this to your backend URL
//   final String baseUrl = 'http://localhost:5000';

//   Future<void> submit() async {
//     if (!_formKey.currentState!.validate()) return;
//     _formKey.currentState!.save();

//     String finalPhone = phone.trim();
//     if (!finalPhone.startsWith('+')) {
//       finalPhone = '+91$finalPhone';
//     }

//     final url = Uri.parse('$baseUrl/api/auth/${isLogin ? 'login' : 'signup'}');

//     Map<String, String> payload = isLogin
//         ? {'phone': finalPhone}
//         : {'name': name, 'email': email, 'phone': finalPhone};

//     try {
//       final response = await http.post(url, body: payload);
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text(data['msg'] ?? 'Success')));
//         if (isLogin) {
//           setState(() {
//             isLoggedIn = true;
//           });
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Error: ${response.statusCode}')));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Error: $e')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoggedIn) {
//       return Scaffold(
//         appBar: AppBar(title: const Text('Welcome')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Text('🎉 Welcome to Surgy Innovation Labs',
//                   style: TextStyle(fontSize: 22)),
//               SizedBox(height: 10),
//               Text("We're excited to have you on board."),
//             ],
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//           title: Text(isLogin ? 'Login - Surgy Innovations Lab' : 'Signup - Surgy Innovations Lab')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               if (!isLogin) ...[
//                 TextFormField(
//                   decoration: const InputDecoration(labelText: 'Name'),
//                   validator: (val) =>
//                       val == null || val.isEmpty ? 'Enter your name' : null,
//                   onSaved: (val) => name = val ?? '',
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(labelText: 'Email'),
//                   validator: (val) =>
//                       val == null || !val.contains('@') ? 'Enter valid email' : null,
//                   onSaved: (val) => email = val ?? '',
//                 ),
//                 const SizedBox(height: 10),
//                 // WhatsApp info box
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                       color: Colors.green.shade100,
//                       border: Border.all(color: Colors.green),
//                       borderRadius: BorderRadius.circular(8)),
//                   child: Column(
//                     children: [
//                       const Text(
//                         '📢 Before signing up: To receive WhatsApp alerts, you must register your number.',
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       const SizedBox(height: 8),
//                       TextButton(
//                         style: TextButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6)),
//                         ),
//                         onPressed: () {
//                           // Open WhatsApp link
//                           final url = Uri.parse(
//                               'https://wa.me/14155238886?text=join%20eager-forest');
//                           launchUrl(url);
//                         },
//                         child: const Text('✅ Click here to register on WhatsApp'),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//               TextFormField(
//                 decoration: const InputDecoration(
//                     labelText: 'Phone (e.g., +91XXXXXXXXXX)'),
//                 keyboardType: TextInputType.phone,
//                 validator: (val) =>
//                     val == null || val.isEmpty ? 'Enter phone number' : null,
//                 onSaved: (val) => phone = val ?? '',
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: submit,
//                 child: Text(isLogin ? 'Login' : 'Signup'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     isLogin = !isLogin;
//                   });
//                 },
//                 child: Text('Switch to ${isLogin ? 'Signup' : 'Login'}'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Add this helper function to open URLs:


// Future<void> launchUrl(Uri url) async {
//   if (!await launchUrlString(url.toString())) {
//     throw 'Could not launch $url';
//   }
// }

// Future<bool> launchUrlString(String url) async {
//   return await canLaunch(url) ? await launch(url) : false;
// }
import 'package:flutter/material.dart';
import 'widgets/auth_form.dart'; // import your widget here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Surgy Innovations Lab',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const AuthForm(), // Use the AuthForm widget here
    );
  }
}
