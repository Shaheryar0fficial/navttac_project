import 'package:flutter/material.dart';
import 'package:navttac2/screen3.dart';

class MonitoringScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NAVTTC Monitoring'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // First Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MonitoringItem(
                  icon: Icons.bar_chart,
                  label: 'Start Monitoring',
                  targetScreen: Screen2(), // Specify the target screen here
                ),
                MonitoringItem(
                  icon: Icons.pie_chart,
                  label: 'Monitoring Status',
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MonitoringItem(
                  icon: Icons.headset_mic,
                  label: 'Support',
                ),
                MonitoringItem(
                  icon: Icons.chat_bubble,
                  label: 'Live Chat',
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Third Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MonitoringItem(
                  icon: Icons.feedback,
                  label: 'Feedback',
                ),
                MonitoringItem(
                  icon: Icons.help,
                  label: 'FAQ\'s',
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Single Item Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MonitoringItem(
                  icon: Icons.sync,
                  label: 'Sync Data',
                  isSingle: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MonitoringItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSingle;
  final Widget? targetScreen;

  const MonitoringItem({
    Key? key,
    required this.icon,
    required this.label,
    this.isSingle = false,
    this.targetScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: targetScreen != null
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => targetScreen!),
              );
            }
          : null,
      child: Container(
        width: isSingle
            ? MediaQuery.of(context).size.width
            : (MediaQuery.of(context).size.width / 2) - 24,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50.0, color: Colors.white),
              SizedBox(height: 10.0),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
