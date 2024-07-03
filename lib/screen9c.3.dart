import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navttac2/screen9c.4.dart';

class Trade3 extends StatefulWidget {
  const Trade3({super.key});

  @override
  State<Trade3> createState() => _Trade3State();
}

class _Trade3State extends State<Trade3> {
  bool cctvInstalled = true;
  bool cctvFunctional = true;
  bool traineesEnrolled = true;

  int cctvInstalledRating = 0;
  int cctvFunctionalRating = 0;
  int traineesEnrolledRating = 0;

  XFile? _cctvImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _cctvImage = pickedFile;
      });
    } catch (e) {
      print("Error picking image: $e");
    }
  }

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
                'Trades 3/4',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              buildFacilityRow('CCTV Cameras Installed', cctvInstalled,
                  (value) {
                setState(() {
                  cctvInstalled = value;
                });
              }),
              buildRatingRow(cctvInstalledRating, (rating) {
                setState(() {
                  cctvInstalledRating = rating;
                });
              }),
              buildUploadButton(),
              buildImagePreview(_cctvImage),
              buildFacilityRow('Is CCTV Functional?', cctvFunctional, (value) {
                setState(() {
                  cctvFunctional = value;
                });
              }),
              buildRatingRow(cctvFunctionalRating, (rating) {
                setState(() {
                  cctvFunctionalRating = rating;
                });
              }),
              buildRemarksField(),
              buildFacilityRow('Trainees Enrolment as per NAVTTC PMS portal',
                  traineesEnrolled, (value) {
                setState(() {
                  traineesEnrolled = value;
                });
              }),
              buildRatingRow(traineesEnrolledRating, (rating) {
                setState(() {
                  traineesEnrolledRating = rating;
                });
              }),
              buildRemarksField(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Trade4(),
                          ));
                      // Add your navigation logic here
                    },
                    child: Text('NEXT', style: TextStyle(color: Colors.white)),
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
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: fontSize * 0.8),
              overflow: TextOverflow.ellipsis,
            ),
          ),
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

  Widget buildRatingRow(int rating, Function(int) onRatingChanged) {
    double starSize = MediaQuery.of(context).size.width * 0.08;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(10, (index) {
          return GestureDetector(
            onTap: () {
              onRatingChanged(index + 1);
            },
            child: Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: Colors.black,
              size: starSize,
            ),
          );
        }),
      ),
    );
  }

  Widget buildUploadButton() {
    double fontSize = MediaQuery.of(context).size.width * 0.05;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: ElevatedButton.icon(
        onPressed: () => _pickImage(),
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

  Widget buildImagePreview(XFile? image) {
    double height = MediaQuery.of(context).size.height * 0.2;
    // double width = MediaQuery.of(context).size.width * 0.8;

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

  Widget buildRemarksField() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Remarks',
        ),
      ),
    );
  }
}
