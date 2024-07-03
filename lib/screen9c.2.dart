import 'package:flutter/material.dart';
import 'package:navttac2/screen9c.3.dart';

class Trade2 extends StatefulWidget {
  const Trade2({super.key});

  @override
  State<Trade2> createState() => _Trade2State();
}

class _Trade2State extends State<Trade2> {
  int _rating = 0;

  Widget buildStar(int index) {
    if (index < _rating) {
      return IconButton(
        icon: Icon(Icons.star, color: Colors.amber, size: 36),
        onPressed: () {
          setState(() {
            _rating = index + 1;
          });
        },
      );
    } else {
      return IconButton(
        icon: Icon(Icons.star_border, size: 36),
        onPressed: () {
          setState(() {
            _rating = index + 1;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('NAVTTC Monitoring'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Trades 2/4',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Jawad Multani'),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Assistant Instructor'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Rating of Instructor',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) => buildStar(index)),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Remarks',
                    ),
                    maxLines: 4,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Trade3(),
                      ));
                  // Handle next button press
                },
                child: Text(
                  'NEXT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
