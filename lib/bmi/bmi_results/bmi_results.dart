import 'package:flutter/material.dart';

import '../bmi_calculator.dart';

class bmiScreen_Results extends StatelessWidget {
final bool ?gender;
final int ?result;
final int ?age;
  const bmiScreen_Results({super.key,
    this.gender,
    this.result,
    this.age

});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('BMI Results',style: TextStyle(color: Colors.white),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Gender: ${clickedMale?'Male':'Female'}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Text('Age:  $age',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            const SizedBox(height: 40,),
            Text('Results: $result',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),),
          ],
        ),
      ),
      
    );
  }
}
