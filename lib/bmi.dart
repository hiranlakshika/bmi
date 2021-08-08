import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late double height, weight;
    return Form(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Weight KG'),
              onChanged: (value) => weight = double.parse(value),
              minLines: 1,
              maxLength: 5,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Height CM'),
              onChanged: (value) => height = double.parse(value),
              minLines: 1,
              maxLength: 5,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () => calculateBMI(weight, height, context),
              child: Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI(double weight, double height, BuildContext context) {
    var heightInMeters = height / 100.0;
    var bmiValue = weight / (heightInMeters * 2);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your BMI value is $bmiValue'),
      ),
    );
  }
}
