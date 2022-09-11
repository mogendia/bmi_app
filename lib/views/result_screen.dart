import 'package:flutter/material.dart';
class TestResult extends StatelessWidget {
  final int age;
  final double finalResult;
  final bool isMale;
  final double fatPercent;

   TestResult(
      {Key? key,
      required this.age,
        required this.fatPercent,
      required this.isMale,
      required this.finalResult})
      : super(key: key);

  String get resultDescription {
    String result = '';
    // if(finalResult < 18.5 && finalResult <  ) {result = 'Underweight';}

    if (finalResult >= 18.5 && finalResult <= 24.9)
    {
      result = 'normal';
    } else if (finalResult >= 25 && finalResult <= 29.9) {
      result = 'Overweight';
    } else if (finalResult >= 30) {
      result = 'Obese';
    } else {
      result = 'Underweight';
    }

    return result;
  }
  String get imagePath {
    String path = '';
    if (finalResult >= 18.5 && finalResult <= 24.9 && isMale)
    {
      path = bodyShapeImages[0]['NormalMan']??'';
    } else if (finalResult >= 18.5 && finalResult <= 24.9 && !isMale)
    {
      path = bodyShapeImages[1]['NormalWoman']??'';
    } else if (finalResult >= 25 && finalResult <= 29.9 && isMale)
    {
      path = bodyShapeImages[0]['OverWeightMan']??'';
    } else if (finalResult >= 25 && finalResult <= 29.9 && !isMale) {
      path = bodyShapeImages[1]['OverWeightWoman']??'';
    } else if (finalResult >= 30 && isMale) {
      path = bodyShapeImages[0]['ObeseMan']??'';
    } else if (finalResult >= 30 && !isMale) {
      path = bodyShapeImages[1]['ObeseWoman']??'';
    } else if (finalResult < 18.5 && isMale) {
      path = bodyShapeImages[0]['UnderweightMan']??'';
    } else if (finalResult < 18.5 && !isMale) {
      path = bodyShapeImages[1]['UnderweightWoman']??'';
    }
    else {
      path = '';
    }
    return path;
  }
  List<Map<String, String>> bodyShapeImages = [
    {
      'UnderweightMan': 'assets/images/man_underweight.png',
      'NormalMan': 'assets/images/man_normal.png',
      'ObeseMan': 'assets/images/man_obese.png',
      'OverweightMan': 'assets/images/man_overweight.png',
    },
    {
      'UnderweightWoman': 'assets/images/underweight_woman.png',
      'NormalWoman': 'assets/images/normal_woman.png',
      'ObeseWoman': 'assets/images/obese_woman.png',
      'OverweightWoman': 'assets/images/overweight_woman.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 25,
          color: Colors.grey,
        ),
        centerTitle: true,
        title: const Text('Test Result'),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(imagePath),
              ),
              Text(
                'Gender: ${isMale ? 'Male' : 'Female'}',
              ),
              Text('Age: $age'),
              Text(
                'BMI:  ${finalResult.toStringAsFixed(1)}',
              ),
              Text('Status: $resultDescription'),
              Text('BFP: ${fatPercent.toStringAsFixed(2)} %'),
            ],
          ),
        ),
      ),
    );
  }
}
