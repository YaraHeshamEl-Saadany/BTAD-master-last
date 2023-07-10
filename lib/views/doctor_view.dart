import 'package:flutter/material.dart';
import 'package:btad/helpers/firebase_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/user.dart';
import '../screens/doctor_record.dart';
import '../screens/patient_list_screen.dart';

class DoctorView extends StatelessWidget {
  final UserModel user;
  final Map<String, dynamic> chatData;

  const DoctorView({Key? key, required this.user, required this.chatData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BTAD"),
        actions: [
          IconButton(
            onPressed: () {
              signOut(context);
            },
            icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Theme.of(context).primaryColor,
                child: Text(
                  "${auth.currentUser!.email}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PatientListScreen(
                        user: user,
                      ),
                    ),
                  );
                },
                leading: const FaIcon(FontAwesomeIcons.comment),
                title: const Text("Medicines"),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorPatientRecordPage(
                        userEmail: "${auth.currentUser!.email}",
                      ),
                    ),
                  );
                },
                leading: const FaIcon(FontAwesomeIcons.list),
                title: const Text("View Record"),
              ),
              ListTile(
                onTap: () {
                  signOut(context);
                },
                leading: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
                title: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PatientListScreen(
                        user: user,
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/last-chat.jpg',
                        fit: BoxFit.cover,
                        width: 400,
                        height: 320,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Chat",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorPatientRecordPage(
                        userEmail: "${auth.currentUser!.email}",
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/r.jpg',
                        fit: BoxFit.cover,
                        width: 400,
                        height: 250,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Record View",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
