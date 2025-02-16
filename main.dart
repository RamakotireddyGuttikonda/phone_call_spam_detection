// // // import 'package:flutter/material.dart';

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});

// // //   // This widget is the root of your application.
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Flutter Demo',
// // //       theme: ThemeData(
// // //         // This is the theme of your application.
// // //         //
// // //         // TRY THIS: Try running your application with "flutter run". You'll see
// // //         // the application has a purple toolbar. Then, without quitting the app,
// // //         // try changing the seedColor in the colorScheme below to Colors.green
// // //         // and then invoke "hot reload" (save your changes or press the "hot
// // //         // reload" button in a Flutter-supported IDE, or press "r" if you used
// // //         // the command line to start the app).
// // //         //
// // //         // Notice that the counter didn't reset back to zero; the application
// // //         // state is not lost during the reload. To reset the state, use hot
// // //         // restart instead.
// // //         //
// // //         // This works for code too, not just values: Most code changes can be
// // //         // tested with just a hot reload.
// // //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// // //         useMaterial3: true,
// // //       ),
// // //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// // //     );
// // //   }
// // // }

// // // class MyHomePage extends StatefulWidget {
// // //   const MyHomePage({super.key, required this.title});

// // //   // This widget is the home page of your application. It is stateful, meaning
// // //   // that it has a State object (defined below) that contains fields that affect
// // //   // how it looks.

// // //   // This class is the configuration for the state. It holds the values (in this
// // //   // case the title) provided by the parent (in this case the App widget) and
// // //   // used by the build method of the State. Fields in a Widget subclass are
// // //   // always marked "final".

// // //   final String title;

// // //   @override
// // //   State<MyHomePage> createState() => _MyHomePageState();
// // // }

// // // class _MyHomePageState extends State<MyHomePage> {
// // //   int _counter = 0;

// // //   void _incrementCounter() {
// // //     setState(() {
// // //       // This call to setState tells the Flutter framework that something has
// // //       // changed in this State, which causes it to rerun the build method below
// // //       // so that the display can reflect the updated values. If we changed
// // //       // _counter without calling setState(), then the build method would not be
// // //       // called again, and so nothing would appear to happen.
// // //       _counter++;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // This method is rerun every time setState is called, for instance as done
// // //     // by the _incrementCounter method above.
// // //     //
// // //     // The Flutter framework has been optimized to make rerunning build methods
// // //     // fast, so that you can just rebuild anything that needs updating rather
// // //     // than having to individually change instances of widgets.
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         // TRY THIS: Try changing the color here to a specific color (to
// // //         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
// // //         // change color while the other colors stay the same.
// // //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// // //         // Here we take the value from the MyHomePage object that was created by
// // //         // the App.build method, and use it to set our appbar title.
// // //         title: Text(widget.title),
// // //       ),
// // //       body: Center(
// // //         // Center is a layout widget. It takes a single child and positions it
// // //         // in the middle of the parent.
// // //         child: Column(
// // //           // Column is also a layout widget. It takes a list of children and
// // //           // arranges them vertically. By default, it sizes itself to fit its
// // //           // children horizontally, and tries to be as tall as its parent.
// // //           //
// // //           // Column has various properties to control how it sizes itself and
// // //           // how it positions its children. Here we use mainAxisAlignment to
// // //           // center the children vertically; the main axis here is the vertical
// // //           // axis because Columns are vertical (the cross axis would be
// // //           // horizontal).
// // //           //
// // //           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
// // //           // action in the IDE, or press "p" in the console), to see the
// // //           // wireframe for each widget.
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: <Widget>[
// // //             const Text(
// // //               'You have pushed the button this many times:',
// // //             ),
// // //             Text(
// // //               '$_counter',
// // //               style: Theme.of(context).textTheme.headlineMedium,
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _incrementCounter,
// // //         tooltip: 'Increment',
// // //         child: const Icon(Icons.add),
// // //       ), // This trailing comma makes auto-formatting nicer for build methods.
// // //     );
// // //   }
// // // }











// // import 'package:flutter/material.dart';
// // import 'package:flutter_contacts/flutter_contacts.dart';
// // import 'package:phone_state/phone_state.dart';
// // import 'package:permission_handler/permission_handler.dart';

// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
  
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Caller ID & Contacts',
// //       theme: ThemeData(primarySwatch: Colors.blue),
// //       home: HomeScreen(),
// //     );
// //   }
// // }

// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Home")),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => ContactsPage()),
// //             );
// //           },
// //           child: Text("View Contacts"),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ContactsPage extends StatefulWidget {
// //   @override
// //   _ContactsPageState createState() => _ContactsPageState();
// // }

// // class _ContactsPageState extends State<ContactsPage> {
// //   Stream<PhoneState>? phoneStateStream;
// //   List<Contact> contacts = [];
// //   List<Contact> filteredContacts = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     requestPermissions();
// //     fetchContacts();
// //     listenForIncomingCalls();
// //   }

// //   Future<void> requestPermissions() async {
// //     await Permission.phone.request();
// //     await Permission.contacts.request();
// //   }

// //   Future<void> fetchContacts() async {
// //     if (await FlutterContacts.requestPermission()) {
// //       List<Contact> fetchedContacts = await FlutterContacts.getContacts(withProperties: true);
// //       setState(() {
// //         contacts = fetchedContacts;
// //         filteredContacts = fetchedContacts;
// //       });
// //     }
// //   }

// //   void listenForIncomingCalls() {
// //     phoneStateStream = PhoneState.stream;
// //     phoneStateStream?.listen((PhoneState event) async {
// //       if (event.status == PhoneStateStatus.CALL_INCOMING) {
// //         String incomingNumber = event.number ?? "Unknown";
// //         showCallerPopup(incomingNumber);
// //       }
// //     });
// //   }

// //   Future<void> showCallerPopup(String number) async {
// //     bool isKnown = await isNumberSaved(number);

// //     if (!mounted) return;

// //     Future.delayed(Duration(milliseconds: 500), () {
// //       showDialog(
// //         context: context,
// //         barrierDismissible: false,
// //         builder: (context) {
// //           return AlertDialog(
// //             title: Text(isKnown ? "Known Caller" : "Unknown Caller"),
// //             content: Text(isKnown ? "Call from: $number" : "Unknown Number: $number"),
// //             actions: [
// //               TextButton(
// //                 onPressed: () => Navigator.pop(context),
// //                 child: Text("Dismiss"),
// //               ),
// //             ],
// //           );
// //         },
// //       );
// //     });
// //   }

// //   Future<bool> isNumberSaved(String incomingNumber) async {
// //   // Normalize the incoming number (remove spaces, dashes, and non-digits)
// //   String normalizedIncoming = incomingNumber.replaceAll(RegExp(r'\D'), '');

// //   for (var contact in contacts) {
// //     for (var phone in contact.phones) {
// //       // Normalize saved contact number
// //       String normalizedSaved = phone.number.replaceAll(RegExp(r'\D'), '');

// //       if (normalizedSaved.endsWith(normalizedIncoming)) {
// //         return true; // Match found!
// //       }
// //     }
// //   }
// //   return false; // No match found
// // }


// //   void searchContacts(String query) {
// //     setState(() {
// //       filteredContacts = contacts
// //           .where((contact) =>
// //               contact.displayName.toLowerCase().contains(query.toLowerCase()) ||
// //               contact.phones.any((phone) => phone.number.contains(query)))
// //           .toList();
// //     });
// //   }

// //   void addNewContact() async {
// //   TextEditingController nameController = TextEditingController();
// //   TextEditingController phoneController = TextEditingController();

// //   showDialog(
// //     context: context,
// //     builder: (context) {
// //       return AlertDialog(
// //         title: Text("Add New Contact"),
// //         content: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             TextField(
// //               controller: nameController,
// //               decoration: InputDecoration(labelText: "Enter Name"),
// //             ),
// //             SizedBox(height: 10),
// //             TextField(
// //               controller: phoneController,
// //               keyboardType: TextInputType.phone,
// //               decoration: InputDecoration(labelText: "Enter Phone Number"),
// //             ),
// //           ],
// //         ),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: Text("Cancel"),
// //           ),
// //           TextButton(
// //             onPressed: () async {
// //               String name = nameController.text.trim();
// //               String phone = phoneController.text.trim();

// //               if (name.isEmpty || phone.isEmpty) {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(content: Text("Please fill all fields!")),
// //                 );
// //                 return;
// //               }

// //               Contact newContact = Contact()
// //                 ..name.first = name
// //                 ..phones = [Phone(phone)];

// //               bool permissionGranted = await FlutterContacts.requestPermission();
// //               if (permissionGranted) {
// //                 await FlutterContacts.insertContact(newContact);
// //                 fetchContacts(); // Refresh the list
// //                 Navigator.pop(context);
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(content: Text("Contact Added Successfully!")),
// //                 );
// //               } else {
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   SnackBar(content: Text("Permission Denied! Enable Contacts Permission.")),
// //                 );
// //               }
// //             },
// //             child: Text("Save"),
// //           ),
// //         ],
// //       );
// //     },
// //   );
// // }


// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Contacts")),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: TextField(
// //               onChanged: searchContacts,
// //               decoration: InputDecoration(
// //                 labelText: "Search Contacts",
// //                 prefixIcon: Icon(Icons.search),
// //                 border: OutlineInputBorder(),
// //               ),
// //             ),
// //           ),
// //           Expanded(
// //             child: filteredContacts.isEmpty
// //                 ? Center(child: Text("No contacts found"))
// //                 : ListView.builder(
// //                     itemCount: filteredContacts.length,
// //                     itemBuilder: (context, index) {
// //                       return ListTile(
// //                         leading: CircleAvatar(
// //                           child: Text(filteredContacts[index].displayName[0]),
// //                         ),
// //                         title: Text(filteredContacts[index].displayName),
// //                         subtitle: filteredContacts[index].phones.isNotEmpty
// //                             ? Text(filteredContacts[index].phones.first.number)
// //                             : Text("No phone number"),
// //                       );
// //                     },
// //                   ),
// //           ),
// //         ],
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: addNewContact,
// //         child: Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }











// // import 'package:flutter/material.dart';
// // import 'package:flutter_contacts/flutter_contacts.dart';
// // import 'package:phone_state/phone_state.dart';
// // import 'package:permission_handler/permission_handler.dart';

// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Caller ID & Contacts',
// //       theme: ThemeData(primarySwatch: Colors.blue),
// //       home: HomeScreen(),
// //     );
// //   }
// // }

// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Home")),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => ContactsPage()),
// //             );
// //           },
// //           child: Text("View Contacts"),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ContactsPage extends StatefulWidget {
// //   @override
// //   _ContactsPageState createState() => _ContactsPageState();
// // }

// // class _ContactsPageState extends State<ContactsPage> {
// //   Stream<PhoneState>? phoneStateStream;
// //   List<Contact> contacts = [];
// //   List<Contact> filteredContacts = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     requestPermissions();
// //     fetchContacts();
// //     listenForIncomingCalls();
// //   }

// //   Future<void> requestPermissions() async {
// //     await Permission.phone.request();
// //     await Permission.contacts.request();
// //   }

// //   Future<void> fetchContacts() async {
// //     if (await FlutterContacts.requestPermission()) {
// //       List<Contact> fetchedContacts = await FlutterContacts.getContacts(withProperties: true);
// //       setState(() {
// //         contacts = fetchedContacts;
// //         filteredContacts = fetchedContacts;
// //       });
// //     }
// //   }

// //   void listenForIncomingCalls() {
// //   phoneStateStream = PhoneState.stream;
// //   phoneStateStream?.listen((PhoneState event) async {
// //     print("📞 Incoming Call Event: ${event.status} - ${event.number}");
// //     if (event.status == PhoneStateStatus.CALL_INCOMING) {
// //       String incomingNumber = event.number ?? "Unknown";
// //       bool isKnown = await isNumberSaved(incomingNumber);
// //       print("📞 Call Detected: $incomingNumber, Known: $isKnown");
// //       showCallerPopup(incomingNumber, isKnown);
// //     }
// //   });
// // }


// //   void showCallerPopup(String number, bool isInContacts) {
// //   if (!mounted) {
// //     print("🚨 Widget is disposed, cannot show popup.");
// //     return;
// //   }

// //   Future.delayed(Duration(milliseconds: 500), () {
// //     if (!mounted) return; // Double-check before showing dialog
// //     showDialog(
// //       context: context,
// //       barrierDismissible: false,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text(isInContacts ? "Known Caller" : "Unknown Caller"),
// //           content: Text(isInContacts
// //               ? "Call from: $number\n(Saved in Contacts)"
// //               : "Unknown Number: $number\n(Not in Contacts)"),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.pop(context);
// //               },
// //               child: Text("Dismiss"),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   });
// // }


// //   Future<bool> isNumberSaved(String incomingNumber) async {
// //   String normalizedIncoming = incomingNumber.replaceAll(RegExp(r'\D'), '');
// //   print("🔍 Checking number: $normalizedIncoming");

// //   for (var contact in contacts) {
// //     for (var phone in contact.phones) {
// //       String normalizedSaved = phone.number.replaceAll(RegExp(r'\D'), '');
// //       print("📌 Comparing with saved: $normalizedSaved");
// //       if (normalizedSaved.endsWith(normalizedIncoming)) {
// //         print("✅ Match found!");
// //         return true;
// //       }
// //     }
// //   }
// //   print("❌ No match found.");
// //   return false;
// // }

// //   void searchContacts(String query) {
// //     setState(() {
// //       filteredContacts = contacts
// //           .where((contact) =>
// //               contact.displayName.toLowerCase().contains(query.toLowerCase()) ||
// //               contact.phones.any((phone) => phone.number.contains(query)))
// //           .toList();
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Contacts")),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: TextField(
// //               onChanged: searchContacts,
// //               decoration: InputDecoration(
// //                 labelText: "Search Contacts",
// //                 prefixIcon: Icon(Icons.search),
// //                 border: OutlineInputBorder(),
// //               ),
// //             ),
// //           ),
// //           Expanded(
// //             child: filteredContacts.isEmpty
// //                 ? Center(child: Text("No contacts found"))
// //                 : ListView.builder(
// //                     itemCount: filteredContacts.length,
// //                     itemBuilder: (context, index) {
// //                       return ListTile(
// //                         leading: CircleAvatar(
// //                           child: Text(filteredContacts[index].displayName[0]),
// //                         ),
// //                         title: Text(filteredContacts[index].displayName),
// //                         subtitle: filteredContacts[index].phones.isNotEmpty
// //                             ? Text(filteredContacts[index].phones.first.number)
// //                             : Text("No phone number"),
// //                       );
// //                     },
// //                   ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }




import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:phone_state/phone_state.dart';
import 'package:permission_handler/permission_handler.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // 🔥 Global navigator key
      debugShowCheckedModeBanner: false,
      title: 'Caller ID & Contacts',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactsPage()),
            );
          },
          child: Text("View Contacts"),
        ),
      ),
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Stream<PhoneState>? phoneStateStream;
  List<Contact> contacts = [];
  List<Contact> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    requestPermissions();
    fetchContacts();
    listenForIncomingCalls();
  }

  Future<void> requestPermissions() async {
    await Permission.phone.request();
    await Permission.contacts.request();
  }

  Future<void> fetchContacts() async {
    if (await FlutterContacts.requestPermission()) {
      List<Contact> fetchedContacts = await FlutterContacts.getContacts(withProperties: true);
      setState(() {
        contacts = fetchedContacts;
        filteredContacts = fetchedContacts;
      });
    }
  }

  void listenForIncomingCalls() {
    phoneStateStream = PhoneState.stream;
    phoneStateStream?.listen((PhoneState event) async {
      print("📞 Incoming Call Event: ${event.status} - ${event.number}");
      if (event.status == PhoneStateStatus.CALL_INCOMING) {
        String incomingNumber = event.number ?? "Unknown";
        bool isKnown = await isNumberSaved(incomingNumber);
        print("📞 Call Detected: $incomingNumber, Known: $isKnown");
        showCallerPopup(incomingNumber, isKnown);
      }
    });
  }

  Future<bool> isNumberSaved(String incomingNumber) async {
    String normalizedIncoming = incomingNumber.replaceAll(RegExp(r'\D'), '');
    for (var contact in contacts) {
      for (var phone in contact.phones) {
        String normalizedSaved = phone.number.replaceAll(RegExp(r'\D'), '');
        print("📌 Comparing with saved: $normalizedSaved");
        if (normalizedSaved.endsWith(normalizedIncoming)) {
          print("✅ Match found!");
          return true;
        }
      }
    }
    return false;
  }

  void showCallerPopup(String number, bool isInContacts) {
    if (navigatorKey.currentContext == null) {
      print("🚨 Cannot show popup: No active context.");
      return;
    }

    Future.delayed(Duration(milliseconds: 500), () {
      if (navigatorKey.currentContext == null) return;
      showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(isInContacts ? "Known Caller" : "Unknown Caller"),
            content: Text(isInContacts
                ? "Call from: $number\n(Saved in Contacts)"
                : "Unknown Number: $number\n(Not in Contacts)"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(navigatorKey.currentContext!).pop(),
                child: Text("Dismiss"),
              ),
            ],
          );
        },
      );
    });
  }

  void searchContacts(String query) {
    setState(() {
      filteredContacts = contacts
          .where((contact) =>
              contact.displayName.toLowerCase().contains(query.toLowerCase()) ||
              contact.phones.any((phone) => phone.number.contains(query)))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: searchContacts,
              decoration: InputDecoration(
                labelText: "Search Contacts",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredContacts.isEmpty
                ? Center(child: Text("No contacts found"))
                : ListView.builder(
                    itemCount: filteredContacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(filteredContacts[index].displayName[0]),
                        ),
                        title: Text(filteredContacts[index].displayName),
                        subtitle: filteredContacts[index].phones.isNotEmpty
                            ? Text(filteredContacts[index].phones.first.number)
                            : Text("No phone number"),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
