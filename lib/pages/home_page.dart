import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';




class FindYourDoctorScreen extends StatelessWidget {
  const FindYourDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        
        body: Column(
          children: [
        Padding(
          padding: const EdgeInsets.all(20.0), 
          child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Text('Yiatsi!', style: TextStyle( fontFamily: 'Oswald' ,fontWeight: FontWeight.normal,fontSize: 32)),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                   
                      onTap: () {
                    
                         FirebaseAuth.instance.signOut();
                        // Implement sign out logic here
                      },
                       child: const Icon(PhosphorIcons.chat),
                  ),
                  const SizedBox(width:10),
                  GestureDetector(
                   
                      onTap: () {},
                       child: const Icon(PhosphorIcons.user_fill),
                  ),
                ],
              ),
            ],
          ),
        ),
      
            // Search bar
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: const Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Doctors near you
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Doctors near you',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage('assets/doctor.png'),
                        ),
                        title: const Text('Dr. Anthony Smith'),
                        subtitle: const Text('Pediatrics'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          // Navigate to the Book Appointment screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BookAppointmentScreen()),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////////////////
///
///////////////////////////////////////////////////////////////

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Book an appointment with Dr. Anthony Smith',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
