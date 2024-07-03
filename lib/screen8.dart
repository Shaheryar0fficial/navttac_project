import 'package:flutter/material.dart';
import 'package:navttac2/screen8b.dart';

class Allied_Facilities extends StatefulWidget {
  const Allied_Facilities({super.key});

  @override
  State<Allied_Facilities> createState() => _Allied_FacilitiesState();
}

class _Allied_FacilitiesState extends State<Allied_Facilities> {
  bool isAffiliated = true;
  bool hasComplaintSystem = false;
  bool hasInternetFacility = false;
  bool hasIndustrialLinkage = false;
  bool hasTrainingPlans = true;

  Map<String, int> ratings = {
    'Admission Facilitation': 0,
    'Complaint Management System': 0,
    'Internet Facility': 0,
    'Industrial Linkage': 0,
    'On Job Training Plans/Status': 0,
  };

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
                'Allied/Other Facilities 1/3',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              buildFacilityRow('Admission Facilitation', isAffiliated, (value) {
                setState(() {
                  isAffiliated = value;
                });
              }),
              buildRatingRow('Admission Facilitation'),
              buildRemarksField(),
              buildFacilityRow(
                  'Complaint Management System', hasComplaintSystem, (value) {
                setState(() {
                  hasComplaintSystem = value;
                });
              }),
              buildRatingRow('Complaint Management System'),
              buildRemarksField(),
              buildFacilityRow('Internet Facility', hasInternetFacility,
                  (value) {
                setState(() {
                  hasInternetFacility = value;
                });
              }),
              buildRatingRow('Internet Facility'),
              buildRemarksField(),
              buildFacilityRow('Industrial Linkage', hasIndustrialLinkage,
                  (value) {
                setState(() {
                  hasIndustrialLinkage = value;
                });
              }),
              buildRatingRow('Industrial Linkage'),
              buildRemarksField(),
              buildFacilityRow('On Job Training Plans/Status', hasTrainingPlans,
                  (value) {
                setState(() {
                  hasTrainingPlans = value;
                });
              }),
              buildRatingRow('On Job Training Plans/Status'),
              buildRemarksField(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Allied_Facilities2()));
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
}
