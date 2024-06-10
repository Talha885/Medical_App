// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:medilab/doctors_list.dart';
import 'package:medilab/hospital_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of hospital names
  final List<Map<String, String>> hospitals = [
    {'id': '1', 'name': 'Sahiwal Hospitals', 'details': '5 Hospitals'},
    {'id': '2', 'name': 'Lahore Hospitals', 'details': '5 Hospitals'},
    // Add more hospitals here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.9,
                  width: double.infinity,
                  color: Colors.blue[700],
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage:
                                      AssetImage('assets/profile.png'),
                                ),
                                SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Hi Talha',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Welcome back',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.shopping_bag,
                                    size: 20,
                                  ),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 70),
                child: Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 211, 206, 206)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Hospitals(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    "assets/db1.png",
                                    height: 30,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Clinic Visit",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Doctors(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    "assets/doctor.png",
                                    height: 30,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Doctors",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/db3.png",
                                    height: 30,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Pharmacy",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    "assets/db4.png",
                                    height: 30,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Appointments",
                                  style: TextStyle(fontSize: 8),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/db5.png",
                                  height: 30,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Diseases",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/db6.png",
                                  height: 30,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Covid-19",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Hospitals',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text('View all'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 13,
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 170,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hospitals.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Hospitals(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/hospital.jpg',
                              fit: BoxFit.fill,
                              width: 200,
                              height: 150,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        hospitals[index]['name']!,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        hospitals[index]['details']!,
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
