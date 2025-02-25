import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:phone_state/phone_state.dart';
import 'package:permission_handler/permission_handler.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Caller ID & Contacts',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.contacts), text: "My Contacts"),
              Tab(icon: Icon(Icons.masks), text: "White List"),
              Tab(icon: Icon(Icons.error), text: "Blocklist"),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                child: Text(
                  "Menu",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.voicemail),
                title: const Text("Voicemails"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VoicemailScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.call),
                title: const Text("Call Records"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CallRecordsScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.security),
                title: const Text("Guardian"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Guardianscreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text("Help"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ContactsPage(),
            Center(child: Text("Whitelist Screen")),
            Center(child: Text("Blocked List Screen")),
          ],
        ),
      ),
    );
  }

}

// Create separate screens for each drawer item
class VoicemailScreen extends StatelessWidget {
  const VoicemailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Voicemails")),
      body: const Center(child: Text("Voicemail content here")),
    );
  }
}




//
// class Guardianscreen extends StatelessWidget {
//   const Guardianscreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Guardian Details")),
//       body: const Center(child: Text("Gaurdian details appear here")),
//     );
//   }
// }

// gaurdian scren

class Guardianscreen extends StatefulWidget {
  const Guardianscreen({super.key});

  @override
  _GuardianscreenState createState() => _GuardianscreenState();
}

class _GuardianscreenState extends State<Guardianscreen> {
  List<Contact> contacts = [];
  Contact? selectedGuardian1;
  Contact? selectedGuardian2;

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      fetchContacts();
    } else {
      print("\ud83d\udea8 Contacts permission denied");
    }
  }

  Future<void> fetchContacts() async {
    if (await FlutterContacts.requestPermission()) {
      List<Contact> fetchedContacts =
      await FlutterContacts.getContacts(withProperties: true);
      setState(() {
        contacts = fetchedContacts;
      });
    }
  }

  void selectGuardian(Contact contact) {
    setState(() {
      if (selectedGuardian1 == null) {
        selectedGuardian1 = contact;
      } else if (selectedGuardian2 == null && selectedGuardian1 != contact) {
        selectedGuardian2 = contact;
      }
    });
  }

  void removeGuardian(int guardianNumber) {
    setState(() {
      if (guardianNumber == 1) {
        selectedGuardian1 = null;
      } else {
        selectedGuardian2 = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guardian Details"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            if (selectedGuardian1 == null || selectedGuardian2 == null)
              Expanded(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(contacts[index].displayName[0]),
                        ),
                        title: Text(contacts[index].displayName),
                        subtitle: contacts[index].phones.isNotEmpty
                            ? Text(contacts[index].phones.first.number)
                            : const Text("No phone number"),
                        trailing: IconButton(
                          icon: Icon(Icons.person_add, color: Colors.green),
                          onPressed: () => selectGuardian(contacts[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 10),
            if (selectedGuardian1 != null || selectedGuardian2 != null)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      if (selectedGuardian1 != null) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Guardian 1:",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold)),
                                Text(
                                  selectedGuardian1!.displayName,
                                  style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                                ),
                                if (selectedGuardian1!.phones.isNotEmpty)
                                  Text(
                                    "Phone: ${selectedGuardian1!.phones.first.number}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => removeGuardian(1),
                            ),
                          ],
                        ),
                      ],
                      const Divider(),
                      if (selectedGuardian2 != null) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Guardian 2:",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold)),
                                Text(
                                  selectedGuardian2!.displayName,
                                  style: TextStyle(fontSize: 16, color: Colors.green),
                                ),
                                if (selectedGuardian2!.phones.isNotEmpty)
                                  Text(
                                    "Phone: ${selectedGuardian2!.phones.first.number}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => removeGuardian(2),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
































class CallRecordsScreen extends StatelessWidget {
  const CallRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Call Records")),
      body: const Center(child: Text("Call records content here")),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help")),
      body: const Center(child: Text("Help content here")),
    );
  }
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

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
    var phoneStatus = await Permission.phone.request();
    var contactsStatus = await Permission.contacts.request();
    var callLogStatus = await Permission.phone.request();

    if (!phoneStatus.isGranted ||
        !contactsStatus.isGranted ||
        !callLogStatus.isGranted) {
      print("🚨 Required permissions not granted!");
    } else {
      print("✅ All required permissions granted.");
    }
  }

  Future<void> fetchContacts() async {
    if (await FlutterContacts.requestPermission()) {
      List<Contact> fetchedContacts =
      await FlutterContacts.getContacts(withProperties: true);
      setState(() {
        contacts = fetchedContacts;
        filteredContacts = fetchedContacts;
      });
    }
  }

  void listenForIncomingCalls() {
    phoneStateStream = PhoneState.stream;
    phoneStateStream?.listen((PhoneState event) async {
      if (event.status == PhoneStateStatus.CALL_INCOMING) {
        String? incomingNumber = event.number;

        if (incomingNumber == null || incomingNumber.isEmpty) {
          print(
              "🚨 Incoming call detected, but number is null. Waiting for update...");
          return;
        }

        print("📞 Call Detected: $incomingNumber, Checking if saved...");
        Map<String, String?> contactInfo = await getContactInfo(incomingNumber);
        String? contactName = contactInfo["name"];
        String contactNumber = contactInfo["number"] ?? "Unknown";

        if (navigatorKey.currentContext != null && mounted) {
          print("✅ Showing popup...");
          showCallerPopup(contactName, contactNumber);
        } else {
          print("❌ Context unavailable when trying to show popup.");
        }
      }
    });
  }

  Future<Map<String, String?>> getContactInfo(String incomingNumber) async {
    if (incomingNumber.isEmpty || incomingNumber == "Unknown") {
      return {"name": null, "number": incomingNumber};
    }

    String normalizedIncoming =
    incomingNumber.replaceAll(RegExp(r'\D'), ''); // Normalize number
    print("🔍 Checking incoming number: $normalizedIncoming");

    for (var contact in contacts) {
      for (var phone in contact.phones) {
        String normalizedSaved = phone.number
            .replaceAll(RegExp(r'\D'), ''); // Normalize saved number

        print("📌 Checking against saved number: $normalizedSaved");

        if (normalizedSaved.endsWith(normalizedIncoming)) {
          print("✅ Match found! Contact: ${contact.displayName}");
          return {
            "name": contact.displayName,
            "number": phone.number
          }; // Return both name and number
        }
      }
    }

    print("❌ No match found.");
    return {
      "name": null,
      "number": incomingNumber
    }; // Return original number if not found
  }

  void showCallerPopup(String? contactName, String contactNumber) {
    if (navigatorKey.currentContext == null) {
      print("🚨 Cannot show popup: No active context.");
      return;
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      if (navigatorKey.currentContext == null || !mounted) {
        print("❌ Context disappeared before showing popup.");
        return;
      }

      showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(contactName != null
                ? "Incoming Call from $contactName "
                : "Unknown Caller"),
            content: Text(contactName != null
                ? "Caller: $contactName\nNumber: $contactNumber"
                : "Unknown Number: $contactNumber\n(Not in Contacts)"),
            actions: [
              TextButton(
                onPressed: () {
                  if (navigatorKey.currentContext != null) {
                    Navigator.of(navigatorKey.currentContext!).pop();
                  }
                },
                child: const Text("Dismiss"),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: searchContacts,
              decoration: const InputDecoration(
                labelText: "Search Contacts",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredContacts.isEmpty
                ? const Center(child: Text("No contacts found"))
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
                      : const Text("No phone number"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
