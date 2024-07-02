import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:navttac2/screen7.dart';

class PartnerInstitueProfile extends StatefulWidget {
  const PartnerInstitueProfile({super.key});

  @override
  State<PartnerInstitueProfile> createState() => _PartnerInstitueProfileState();
}

class _PartnerInstitueProfileState extends State<PartnerInstitueProfile> {
  bool isNavttcAccredited = true;
  bool isRegistered = false;
  XFile? _institutionalImage;
  XFile? _registrationImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(String imageType) async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (imageType == 'institutional') {
          _institutionalImage = pickedFile;
        } else if (imageType == 'registration') {
          _registrationImage = pickedFile;
        }
      });
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NAVTTC Monitoring'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;

          // Calculate sizes based on screen dimensions
          double padding = width * 0.04;
          double fontSize = width * 0.05;
          double iconSize = width * 0.12;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Partner Institute\'s Profile 1/2',
                    style: TextStyle(fontSize: fontSize),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('NAVTTC Accredited?',
                          style: TextStyle(fontSize: fontSize * 0.8)),
                      Row(
                        children: [
                          Text('No',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: fontSize * 0.7)),
                          Switch(
                            value: isNavttcAccredited,
                            onChanged: (value) {
                              setState(() {
                                isNavttcAccredited = value;
                              });
                            },
                            activeColor: Colors.black,
                          ),
                          Text('Yes',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: fontSize * 0.7)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Institutional Accredited?',
                          style: TextStyle(fontSize: fontSize * 0.8)),
                      ElevatedButton.icon(
                        onPressed: () => _pickImage('institutional'),
                        icon: Icon(Icons.upload_file, size: iconSize * 0.6),
                        label: Text('UPLOAD',
                            style: TextStyle(fontSize: fontSize * 0.7)),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    height: height * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.grey[300],
                    ),
                    child: _institutionalImage == null
                        ? Icon(Icons.add_a_photo, size: iconSize)
                        : Image.file(File(_institutionalImage!.path)),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Is Registered',
                          style: TextStyle(fontSize: fontSize * 0.8)),
                      Row(
                        children: [
                          Text('No',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: fontSize * 0.7)),
                          Switch(
                            value: isRegistered,
                            onChanged: (value) {
                              setState(() {
                                isRegistered = value;
                              });
                            },
                            activeColor: Colors.black,
                          ),
                          Text('Yes',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: fontSize * 0.7)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Name of Registration Authority',
                          style: TextStyle(fontSize: fontSize * 0.8)),
                      ElevatedButton.icon(
                        onPressed: () => _pickImage('registration'),
                        icon: Icon(Icons.upload_file, size: iconSize * 0.6),
                        label: Text('UPLOAD',
                            style: TextStyle(fontSize: fontSize * 0.7)),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    height: height * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.grey[300],
                    ),
                    child: _registrationImage == null
                        ? Icon(Icons.add_a_photo, size: iconSize)
                        : Image.file(File(_registrationImage!.path)),
                  ),
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PartnerInstitueProfile2(),
                          ),
                        );
                      },
                      child: Text("NEXT",
                          style: TextStyle(
                              color: Colors.white, fontSize: fontSize * 0.8)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
