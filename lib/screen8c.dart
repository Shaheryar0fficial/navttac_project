import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Allied_Facilities3 extends StatefulWidget {
  const Allied_Facilities3({super.key});

  @override
  State<Allied_Facilities3> createState() => _Allied_Facilities3State();
}

class _Allied_Facilities3State extends State<Allied_Facilities3> {
  bool isPMSPortalAccess = false;
  bool isFirstAidBoxAvailable = false;
  bool isFireAlarmSystem = false;

  Map<String, int> ratings = {
    'Picture of PMS portal access': 0,
    'Availability of First Aid Box': 0,
    'Fire Alarm System': 0,
  };

  XFile? pmsPortalImage;
  XFile? firstAidBoxImage;
  XFile? fireAlarmImage;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.04;
    double fontSize = MediaQuery.of(context).size.width * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: const Text('NAVTTC Monitoring'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Allied/Other Facilities 3/3',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              buildFacilityRow(
                  'Picture of PMS portal access', isPMSPortalAccess, (value) {
                setState(() {
                  isPMSPortalAccess = value;
                });
              }),
              buildRatingRow('Picture of PMS portal access'),
              buildRemarksField(),
              buildImagePreview(pmsPortalImage),
              buildUploadButton('pmsPortal'),
              buildFacilityRow(
                  'Availability of First Aid Box', isFirstAidBoxAvailable,
                  (value) {
                setState(() {
                  isFirstAidBoxAvailable = value;
                });
              }),
              buildRatingRow('Availability of First Aid Box'),
              buildRemarksField(),
              buildImagePreview(firstAidBoxImage),
              buildUploadButton('firstAidBox'),
              buildFacilityRow('Fire Alarm System', isFireAlarmSystem, (value) {
                setState(() {
                  isFireAlarmSystem = value;
                });
              }),
              buildRatingRow('Fire Alarm System'),
              buildRemarksField(),
              buildImagePreview(fireAlarmImage),
              buildUploadButton('fireAlarm'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      // Handle save action
                    },
                    child: Text('SAVE', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFacilityRow(
      String title, bool value, ValueChanged<bool> onChanged) {
    double fontSize = MediaQuery.of(context).size.width * 0.05;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: fontSize * 0.8)),
          Row(
            children: [
              Text('No',
                  style:
                      TextStyle(color: Colors.black, fontSize: fontSize * 0.7)),
              Switch(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text('Yes',
                  style:
                      TextStyle(color: Colors.black, fontSize: fontSize * 0.7)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRatingRow(String facility) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(10, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                ratings[facility] = index + 1;
              });
            },
            child: Icon(
              index < ratings[facility]! ? Icons.star : Icons.star_border,
              size: MediaQuery.of(context).size.width * 0.08,
              color: Colors.black,
            ),
          );
        }),
      ),
    );
  }

  Widget buildRemarksField() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Remarks',
        ),
      ),
    );
  }

  Widget buildImagePreview(XFile? image) {
    double height = MediaQuery.of(context).size.height * 0.2;

    return Container(
      height: height,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: image != null
          ? Image.file(
              File(image.path),
              fit: BoxFit.cover,
            )
          : Icon(
              Icons.add_a_photo,
              size: height * 0.5,
            ),
    );
  }

  Widget buildUploadButton(String imageType) {
    double fontSize = MediaQuery.of(context).size.width * 0.05;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: ElevatedButton.icon(
        onPressed: () => _pickImage(imageType),
        icon: Icon(Icons.upload_file, size: fontSize * 0.6),
        label: Text('Upload', style: TextStyle(fontSize: fontSize * 0.7)),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.black),
          minimumSize:
              Size(double.infinity, MediaQuery.of(context).size.height * 0.05),
        ),
      ),
    );
  }

  Future<void> _pickImage(String imageType) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (imageType == 'pmsPortal') {
        pmsPortalImage = pickedFile;
      } else if (imageType == 'firstAidBox') {
        firstAidBoxImage = pickedFile;
      } else if (imageType == 'fireAlarm') {
        fireAlarmImage = pickedFile;
      }
    });
  }
}
