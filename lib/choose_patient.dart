// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medilab/add_new_patient.dart';
import 'package:medilab/confirm_appointment.dart';

class ChoosePatient extends StatefulWidget {
  const ChoosePatient({super.key});

  @override
  State<ChoosePatient> createState() => _ChoosePatientState();
}

class _ChoosePatientState extends State<ChoosePatient> {
  final List patients = [
    {
      'id': '1',
      'image': 'assets/patient.png',
      'name': 'Patient 1',
      'label': 'Heart Patient',
    },
    {
      'id': '2',
      'image': 'assets/patient.png',
      'name': 'Patient 2',
      'label': 'Heart Patient',
    },
    {
      'id': '3',
      'image': 'assets/patient.png',
      'name': 'Patient 3',
      'label': 'Heart Patient',
    },
  ];

  String selectedPatientId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patients',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Find the Service you want',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 17,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          size: 17,
                        ))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              child: Expanded(
                child: patients.isEmpty
                    ? Center(
                        child: Text(
                          'No Patient in Record',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: patients.length,
                        itemBuilder: (context, index) {
                          final patient = patients[index];
                          final isSelected = selectedPatientId == patient['id'];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPatientId = patient['id']!;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              padding: EdgeInsets.all(8),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      patient['image']!,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          patient['name']!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Divider(
                                          height: 5,
                                          thickness: 1,
                                          color: Colors.grey[200],
                                        ),
                                        Text(
                                          patient['label']!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => AddNewPatient())));
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add New Patient',
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => ConfirmAppointment())));
          },
          child: Text(
            'Continue',
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
