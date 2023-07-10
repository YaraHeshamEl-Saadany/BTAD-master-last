import 'package:flutter/material.dart';

import 'package:btad/helpers/firebase_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/user.dart';

import '../screens/alarm_screen.dart';
import '../screens/appointment_schedule.dart';
import '../screens/doctor_list_screen.dart';
import '../screens/patient_record.dart';

class PatientView extends StatelessWidget {
  final UserModel user;

  const PatientView({
    Key? key,
    required this.user,
  }) : super(key: key);

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
                      builder: (context) => DoctorListScreen(
                        user: user,
                      ),
                    ),
                  );
                },
                leading: const FaIcon(FontAwesomeIcons.comment),
                title: const Text("Chat"),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientRecordsPage(
                          userEmail: "${auth.currentUser!.email}"),
                    ),
                  );
                },
                leading: const FaIcon(FontAwesomeIcons.list),
                title: const Text("View Records"),
              ),
              /*   ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PatientRecordsPage(
                        userEmail: '',
                      ),
                    ),
                  );
                },
                leading: const FaIcon(FontAwesomeIcons.list),
                title: const Text("View Record"),
              ), */
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AppointmentPage(),
                    ),
                  );
                },
                leading: const FaIcon(FontAwesomeIcons.calendar),
                title: const Text("Schedule Appointment"),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AlarmPage(),
                    ),
                  );
                },
                leading: const FaIcon(FontAwesomeIcons.kitMedical),
                title: const Text("Medicines"),
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
                      builder: (context) => DoctorListScreen(
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
                        height: 250,
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PatientRecordsPage(
                        userEmail: '',
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/Medical-Record.jpg',
                        fit: BoxFit.cover,
                        width: 400,
                        height: 250,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "View Record",
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AlarmPage(),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/med.jpg',
                        fit: BoxFit.cover,
                        width: 400,
                        height: 250,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Medicines",
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AppointmentPage(),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/aapointment.jpg',
                        fit: BoxFit.cover,
                        width: 400,
                        height: 250,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Schedule Appointment",
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
