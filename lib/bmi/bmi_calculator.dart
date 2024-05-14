import 'dart:math';

import 'package:flutter/material.dart';

import 'bmi_results/bmi_results.dart';


class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});
  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

bool clickedMale = true;
double height=100;
int weight=50;
int age=20;
class _BmiScreenState extends State<BmiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        clickedMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: clickedMale ? Colors.blue : Colors.grey),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male, size: 80),
                          Text(
                            'MALE',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        clickedMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: clickedMale ? Colors.grey : Colors.blue),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, size: 80),
                          Text(
                            'FEMALE',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(
            height: 12,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.grey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${height.round()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 50),
                      ),
                      const SizedBox(width: 3),
                      const Text('cm'),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 0,
                    max: 500,
                    onChanged: (value) {
                        setState(() {
                          height=value;
                        });                    },
                  )
                ],
              ),
            ),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          Text('${weight}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 50)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  },
                                  );
                                },
                                heroTag: 'weight-'
                                ,mini: true,backgroundColor: Colors.blue,
                                child: const Icon(Icons.remove,),
                              ),
                              const SizedBox(width: 36,),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                heroTag: 'weight+',
                                mini: true,backgroundColor: Colors.blue,
                                child: const Icon(Icons.add),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('AGE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          Text('${age}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 50)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;

                                  });
                                },
                                heroTag:'age-' ,
                                mini: true,backgroundColor: Colors.blue,
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 36,),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                heroTag: 'age+',
                                mini: true,backgroundColor: Colors.blue,
                                child: const Icon(Icons.add),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
                onPressed: () {
                  setState(() {
                    double result=weight/ pow(height/100,2);
                    print(result.round());
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>bmiScreen_Results(
                      age: age,
                      gender: clickedMale,
                      result: result.round(),
                    ),),);
                  });
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                )),
          ),
        ],
      ),
    );
  }
}
