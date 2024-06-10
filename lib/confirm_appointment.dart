// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:medilab/homepage.dart';

class ConfirmAppointment extends StatefulWidget {
  const ConfirmAppointment({super.key});

  @override
  State<ConfirmAppointment> createState() => _ConfirmAppointmentState();
}

class _ConfirmAppointmentState extends State<ConfirmAppointment> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Confirm Appointment',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              'Find the Service you want',
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 238, 238, 238),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hospital Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/hospital.jpg', // replace with actual image path
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey[200],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      SizedBox(width: 5),
                      Text(
                        'Location: Sahiwal, Punjab',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Add Service
                  Row(
                    children: [
                      Text(
                        'Service: ',
                      ),
                      Text(
                        'Cardiology',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Doctor
                  Row(
                    children: [
                      Image.asset(
                        'assets/doctor.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Doctor',
                          ),
                          Text(
                            'Dr. Talha',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(), // Divider
                  // Patient
                  Row(
                    children: [
                      Image.asset(
                        'assets/patient.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Patient',
                          ),
                          Text(
                            'Talha',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(), // Divider
                  // Payment Method
                  Text(
                    'Payment Method',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Payment at the clinic',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 20), // Add space between container and payment divider
            Divider(), // Divider under payment
            // Payment Method
            Text(
              'Payment Method',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Text(
              'Payment at the clinic',
              style: TextStyle(color: Colors.blue),
            ),
            Divider(), // New divider after payment
            // Date Picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Date:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Colors
                                  .blue, // Headings and buttons text color
                              onPrimary:
                                  Colors.white, // Buttons background color
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (pickedDate != null && pickedDate != _selectedDate) {
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Text(
                    '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 50,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Appointment Booked',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Please check the app carefully to keep your health better',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          side: BorderSide(color: Colors.blue),
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Text(
            'Add Appointment',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
