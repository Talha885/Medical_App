// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class AddNewPatient extends StatefulWidget {
  const AddNewPatient({Key? key}) : super(key: key);

  @override
  State<AddNewPatient> createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String dropdownValue = 'Female';
  String bloodGroupValue = 'None';
  String? selectedCode;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, size: 20),
              ),
              const SizedBox(height: 20),
              Text(
                'Add A Patient',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name*',
                  hintText: 'Enter your first name',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name*',
                  hintText: 'Enter your last name',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: dobController,
                decoration: InputDecoration(
                  labelText: 'Date of Birth*',
                  hintText: 'Select date',
                ),
                onTap: () {
                  // Show date picker or open a date selection dialog
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CountryCodePicker(
                      onChanged: (value) {
                        setState(() {
                          selectedCode = value.toString();
                        });
                      },
                      initialSelection: 'US',
                      favorite: ['+1', 'US'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number*',
                        hintText: 'Enter your phone number',
                      ),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  genderDropDown(),
                  bloodGroupDropDown(),
                ],
              ),
            ],
          ),
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
          onPressed: () {},
          child: Text(
            'Add Patient',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget genderDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gender', style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.keyboard_arrow_down),
          iconSize: 24,
          elevation: 16,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>[
            'Female',
            'Male',
            'Other',
          ].map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
        ),
      ],
    );
  }

  Widget bloodGroupDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Blood Group',
          style: TextStyle(fontSize: 16),
        ),
        Container(
          child: DropdownButton<String>(
            value: bloodGroupValue,
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            elevation: 16,
            onChanged: (String? newValue) {
              setState(() {
                bloodGroupValue = newValue!;
              });
            },
            items: <String>[
              'None',
              'A+',
              'A-',
              'B+',
              'B-',
              'O+',
              'O-',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
