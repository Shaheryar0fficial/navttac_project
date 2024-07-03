import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  String selectedButton = 'Graphic Designing (UI/UX Designer)';

  final List<String> buttons = [
    'Graphic Designing (UI/UX Designer)',
    'Advance Web application Development',
    'Certificate in IT (Web Development)',
    'Data Mining / Business Intelligence',
    'Digital Marketing & Search Engine Optimization (SEO)',
    'eCommerce',
    'Graphic Design and Video Editing',
    'Power BI'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NAVTTC Monitoring'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'TRADE LIST',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ...buttons.map((text) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: MenuButton(
                      text: text,
                      isSelected: selectedButton == text,
                      onPressed: () {
                        setState(() {
                          selectedButton = text;
                        });
                      },
                    ),
                  )),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  MenuButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.black : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Row(
            children: [
              Icon(Icons.account_balance,
                  color: isSelected ? Colors.white : Colors.black),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
              if (isSelected) Icon(Icons.check, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
