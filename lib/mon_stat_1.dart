import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:navttac2/mon_stat_2.dart';
import 'package:navttac2/screen3.dart';

class monitored_institutes extends StatefulWidget {
  const monitored_institutes({super.key});

  @override
  State<monitored_institutes> createState() => _monitored_institutesState();
}

class _monitored_institutesState extends State<monitored_institutes> {
  List<Map<String, dynamic>> institutes = [
    {
      "id": 817,
      "name": "Institute of Business Management",
      "date": "21 May 2024",
      "status": "Completed"
    },
    {
      "id": 345,
      "name": "Institute of 123",
      "date": "15 May 2024",
      "status": "Incomplete"
    },
    {
      "id": 23,
      "name": "Institute of 789",
      "date": "12 May 2024",
      "status": "Completed"
    },
    {
      "id": 65,
      "name": "Institute of abc",
      "date": "11 May 2024",
      "status": "Incomplete"
    },
    {
      "id": 120,
      "name": "Institute of xyz",
      "date": "10 May 2024",
      "status": "Completed"
    },
    {
      "id": 566,
      "name": "Institute of management",
      "date": "4 May 2024",
      "status": "Incomplete"
    },
  ];

  late List<Map<String, dynamic>> filteredInstitutes;
  String searchQuery = '';
  String statusFilter = 'All';

  @override
  void initState() {
    super.initState();
    filteredInstitutes = List.from(institutes);
  }

  void updateFilter() {
    setState(() {
      filteredInstitutes = institutes.where((institute) {
        final matchesSearch =
            institute["name"].toLowerCase().contains(searchQuery.toLowerCase());
        final matchesStatus = statusFilter == 'All' ||
            institute["status"].toLowerCase() == statusFilter.toLowerCase();
        return matchesSearch && matchesStatus;
      }).toList();
    });
  }

  void exportToExcel() async {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    // sheetObject.appendRow(["Institute Id", "Name", "Monitored Date", "Status"]);

    for (var institute in filteredInstitutes) {
      sheetObject.appendRow([
        institute["id"],
        institute["name"],
        institute["date"],
        institute["status"]
      ]);
    }

    var fileBytes = excel.save();

    File('Monitored_Institutes.xlsx')
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Exported to Monitored_Institutes.xlsx')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoring Status'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Monitored Institutes: ${filteredInstitutes.length}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'SEARCH',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                  updateFilter();
                });
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: statusFilter,
                  items: ['All', 'Completed', 'Incomplete']
                      .map((status) => DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      statusFilter = value!;
                      updateFilter();
                    });
                  },
                ),
                // Removing the export button from here and moving it to the bottom navigation bar
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredInstitutes.length,
                itemBuilder: (context, index) {
                  final institute = filteredInstitutes[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text('Institute Id: ${institute["id"]}\n'
                          'Name: ${institute["name"]}\n'
                          'Monitored Date: ${institute["date"]}'),
                      trailing: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: institute["status"] == 'Completed'
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          institute["status"],
                          style: TextStyle(color: Colors.white),
                        ),
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
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle details action
                },
                child: Row(
                  children: [
                    Icon(Icons.details),
                    SizedBox(width: 5),
                    Text('Details'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => export_to_excel(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.file_download),
                    SizedBox(width: 5),
                    Text('Export to Excel'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
