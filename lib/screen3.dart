import 'package:flutter/material.dart';
import 'package:navttac2/screen4.dart';
import 'package:navttac2/screen5a.dart';
import 'package:navttac2/screen6.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String selectedButton = 'Institute Details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NAVTTC Monitoring'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MenuButton(
              text: 'Institute Details',
              isSelected: selectedButton == 'Institute Details',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InstituteIdPage()));

                setState(() {
                  selectedButton = 'Institute Details';
                });
              },
            ),
            SizedBox(height: 10),
            MenuButton(
              text: 'Institute Profile',
              isSelected: selectedButton == 'Institute Profile',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PartnerInstitueProfile()));

                setState(() {
                  selectedButton = 'Institute Profile';
                });
              },
            ),
            SizedBox(height: 10),
            MenuButton(
              text: 'Allied/Other Facilities',
              isSelected: selectedButton == 'Allied/Other Facilities',
              onPressed: () {
                setState(() {
                  selectedButton = 'Allied/Other Facilities';
                });
              },
            ),
            SizedBox(height: 10),
            MenuButton(
              text: 'Trades',
              isSelected: selectedButton == 'Trades',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen4(),
                    ));
                setState(() {
                  selectedButton = 'Trades';
                });
              },
            ),
            SizedBox(height: 10),
            MenuButton(
              text: 'Overall Experience',
              isSelected: selectedButton == 'Overall Experience',
              onPressed: () {
                setState(() {
                  selectedButton = 'Overall Experience';
                });
              },
            ),
            SizedBox(height: 10),
            MenuButton(
              text: 'Add/Edit Details',
              isSelected: selectedButton == 'Add/Edit Details',
              onPressed: () {
                setState(() {
                  selectedButton = 'Add/Edit Details';
                });
              },
            ),
            SizedBox(height: 100),
            ElevatedButton(
                onPressed: () {},
                child: Text('PREVIEW', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                )),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {},
                child: Text('SAVE', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                )),
          ],
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
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              if (isSelected) Spacer(),
              if (isSelected) Icon(Icons.check, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}


//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NAVTTC Monitoring'),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             NavigationButton(
//               label: 'Institute Details',
//               icon: Icons.account_balance,
//               onPressed: () {
//                 // Navigate to Institute Details screen
//               },
//             ),
//             NavigationButton(
//               label: 'Institute Profile',
//               icon: Icons.account_box,
//               onPressed: () {
//                 // Navigate to Institute Profile screen
//               },
//             ),
//             NavigationButton(
//               label: 'Allied/Other Facilities',
//               icon: Icons.business_center,
//               onPressed: () {
//                 // Navigate to Allied/Other Facilities screen
//               },
//             ),
//             NavigationButton(
//               label: 'Trades',
//               icon: Icons.work,
//               onPressed: () {
//                 // Navigate to Trades screen
//               },
//             ),
//             NavigationButton(
//               label: 'Add/Edit Details',
//               icon: Icons.edit,
//               onPressed: () {
//                 // Navigate to Add/Edit Details screen
//               },
//             ),
//             Spacer(),
//             ActionButton(
//               label: 'PREVIEW',
//               onPressed: () {
//                 // Preview action
//               },
//             ),
//             ActionButton(
//               label: 'SUBMIT',
//               onPressed: () {
//                 // Submit action
//               },
//             ),
//             SizedBox(height: 16),
//             LogoutButton(
//               onPressed: () {
//                 // Logout action
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NavigationButton extends StatelessWidget {
//   final String label;
//   final IconData icon;
//   final VoidCallback onPressed;

//   const NavigationButton({
//     required this.label,
//     required this.icon,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ElevatedButton.icon(
//         icon: Icon(icon),
//         label: Text(label),
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           foregroundColor: Colors.black,
//           backgroundColor: Colors.white,
//           minimumSize: Size(double.infinity, 50),
//           textStyle: TextStyle(fontSize: 16),
//           side: BorderSide(color: Colors.black),
//           alignment: Alignment.centerLeft,
//         ),
//       ),
//     );
//   }
// }

// class ActionButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onPressed;

//   const ActionButton({
//     required this.label,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ElevatedButton(
//         child: Text(label),
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           foregroundColor: Colors.white,
//           backgroundColor: Colors.black,
//           minimumSize: Size(double.infinity, 50),
//           textStyle: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
// }

// class LogoutButton extends StatelessWidget {
//   final VoidCallback onPressed;

//   const LogoutButton({
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: Text('LOG OUT'),
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.black,
//         minimumSize: Size(double.infinity, 50),
//         textStyle: TextStyle(fontSize: 16),
//       ),
//     );
//   }
// }
