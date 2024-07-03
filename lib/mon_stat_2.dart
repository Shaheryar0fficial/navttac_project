import 'package:flutter/material.dart';

class export_to_excel extends StatefulWidget {
  const export_to_excel({super.key});

  @override
  State<export_to_excel> createState() => _export_to_excelState();
}

class _export_to_excelState extends State<export_to_excel> {
  final List<Map<String, String>> instituteData = [
    {
      "id": "817",
      "name": "Institute of Business Management",
      "date": "21 May 2024"
    },
    {"id": "345", "name": "Institute of 123", "date": "15 May 2024"},
    {"id": "23", "name": "Institute of 789", "date": "12 May 2024"},
    {"id": "65", "name": "Institute of abc", "date": "11 May 2024"},
    {"id": "120", "name": "Institute of xyz", "date": "10 May 2024"},
    {"id": "566", "name": "Institute of management", "date": "4 May 2024"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('NAVTTC Monitoring'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Scroll Down to End for Export All',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _exportToExcel,
              icon: Icon(Icons.file_download),
              label: Text('EXPORT TO EXCEL'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: instituteData.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Institute Id: ${instituteData[index]['id']}"),
                          Text("Name: ${instituteData[index]['name']}"),
                          Text(
                              "Monitored Date: ${instituteData[index]['date']}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.details),
                label: Text('DETAILS'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
              ElevatedButton.icon(
                onPressed: _exportToExcel,
                icon: Icon(Icons.file_download),
                label: Text('EXPORT EXCEL'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _exportToExcel() {
    // Add functionality to export data to Excel
    // For example, you can use the 'excel' package to generate an Excel file.
  }
}
