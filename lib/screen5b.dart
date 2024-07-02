import 'package:flutter/material.dart';

class Institutedetails extends StatefulWidget {
  @override
  _InstitutedetailsState createState() => _InstitutedetailsState();
}

class _InstitutedetailsState extends State<Institutedetails> {
  final TextEditingController instituteNameController = TextEditingController();
  final TextEditingController instituteIdController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController directorNameController = TextEditingController();
  final TextEditingController directorPhoneController = TextEditingController();
  final TextEditingController monitoringOfficerNameController =
      TextEditingController();
  final TextEditingController monitoringOfficerTitleController =
      TextEditingController();
  final TextEditingController monitoringOfficerPhoneController =
      TextEditingController();
  final TextEditingController visitDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NAVTTC Monitoring'),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Institute\'s Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              buildTextField(
                controller: instituteNameController,
                hintText: 'Institute of Business Management',
                icon: Icons.account_balance,
              ),
              buildTextField(
                controller: instituteIdController,
                hintText: 'Enter Institute ID',
                icon: Icons.text_fields,
              ),
              buildTextField(
                controller: addressController,
                hintText: 'Korangi Creek Road, Karachi',
                icon: Icons.location_on,
              ),
              buildTextField(
                controller: stateController,
                hintText: 'Sindh',
                icon: Icons.location_city,
              ),
              buildTextField(
                controller: cityController,
                hintText: 'Karachi, Korangi',
                icon: Icons.location_city,
              ),
              buildTextField(
                controller: directorNameController,
                hintText: 'Dr. Imran Batada',
                icon: Icons.person,
              ),
              buildTextField(
                controller: directorPhoneController,
                hintText: '03001234567',
                icon: Icons.phone,
              ),
              buildTextField(
                controller: monitoringOfficerNameController,
                hintText: 'Dr. Imran Batada',
                icon: Icons.person,
              ),
              buildTextField(
                controller: monitoringOfficerTitleController,
                hintText: 'Monitoring Officer',
                icon: Icons.business_center,
              ),
              buildTextField(
                controller: monitoringOfficerPhoneController,
                hintText: '03001234567',
                icon: Icons.phone,
              ),
              buildTextField(
                controller: visitDateController,
                hintText: '21-05-2024',
                icon: Icons.calendar_today,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('SAVE', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(double.infinity, 50), // Full width
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
