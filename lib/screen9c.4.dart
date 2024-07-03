import 'package:flutter/material.dart';

class Trade4 extends StatefulWidget {
  const Trade4({super.key});

  @override
  State<Trade4> createState() => _Trade4State();
}

class _Trade4State extends State<Trade4> {
  bool tlmProvided = true;
  bool lessonPlansProvided = true;
  bool traineesWellVersed = true;
  bool trainingMaterialProvided = true;

  int tlmRating = 0;
  int lessonPlansRating = 0;
  int traineesRating = 0;
  int trainingMaterialRating = 0;
  int tradeRating = 0;

  String tradeRatingText = 'Very Good';

  Map<String, int> ratings = {
    'NAVTTC TLMs were Provided to the trainees': 0,
    'Weekly/Monthly Lesson Plans Provided to the Trainees': 0,
    'Trainees were well versed with course content': 0,
    'Consumable/training material was provided to the trainees for practice purpose':
        0,
    'Rating of trade': 0,
  };

  List<String> tradeRatingOptions = ['Very Good', 'Good', 'Average', 'Poor'];

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.04;
    double fontSize = MediaQuery.of(context).size.width * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: const Text('NAVTTC Monitoring'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trades 4/4',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              buildFacilityRow(
                  'NAVTTC TLMs were Provided to the trainees', tlmProvided,
                  (value) {
                setState(() {
                  tlmProvided = value;
                });
              }),
              buildRatingRow(
                  'NAVTTC TLMs were Provided to the trainees', tlmRating,
                  (rating) {
                setState(() {
                  tlmRating = rating;
                });
              }),
              buildRemarksField(),
              buildFacilityRow(
                  'Weekly/Monthly Lesson Plans Provided to the Trainees',
                  lessonPlansProvided, (value) {
                setState(() {
                  lessonPlansProvided = value;
                });
              }),
              buildRatingRow(
                  'Weekly/Monthly Lesson Plans Provided to the Trainees',
                  lessonPlansRating, (rating) {
                setState(() {
                  lessonPlansRating = rating;
                });
              }),
              buildRemarksField(),
              buildFacilityRow('Trainees were well versed with course content',
                  traineesWellVersed, (value) {
                setState(() {
                  traineesWellVersed = value;
                });
              }),
              buildRatingRow('Trainees were well versed with course content',
                  traineesRating, (rating) {
                setState(() {
                  traineesRating = rating;
                });
              }),
              buildRemarksField(),
              buildFacilityRow(
                  'Consumable/training material was provided to the trainees for practice purpose',
                  trainingMaterialProvided, (value) {
                setState(() {
                  trainingMaterialProvided = value;
                });
              }),
              buildRatingRow(
                  'Consumable/training material was provided to the trainees for practice purpose',
                  trainingMaterialRating, (rating) {
                setState(() {
                  trainingMaterialRating = rating;
                });
              }),
              buildRemarksField(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              buildTradeRatingRow(),
              buildRemarksField(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      // Save action
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
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: fontSize * 0.8),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
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

  Widget buildRatingRow(
      String facility, int rating, Function(int) onRatingChanged) {
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

  Widget buildTradeRatingRow() {
    double starSize = MediaQuery.of(context).size.width * 0.08;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rating of trade',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    tradeRating = index + 1;
                  });
                },
                child: Icon(
                  index < tradeRating ? Icons.star : Icons.star_border,
                  color: Colors.black,
                  size: starSize,
                ),
              );
            }),
          ),
        ),
        DropdownButtonFormField<String>(
          value: tradeRatingText,
          items: tradeRatingOptions.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              tradeRatingText = value!;
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Select Rating',
          ),
        ),
      ],
    );
  }
}
