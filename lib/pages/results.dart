import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      this.bmiResults,
      this.bmiText,
      this.bmiFeedBack,
      this.gender,
      this.height,
      this.weight,
      this.age});
  final String? bmiResults, bmiText, bmiFeedBack, gender, height, weight, age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
              child: Center(
                child: Text(
                  'YOUR BMI RESULTS',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: BoxCard(
                  colour: Colors.white.withOpacity(0.1),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmiText!,
                        style: const TextStyle(
                            color: Color(0XFF02B290),
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            bmiResults!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 100.0,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Gender :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                gender == 'MALE' ? 'Male' : 'Female',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Age :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                age!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 2.0,
                              ),
                              const Text(
                                'years old',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Height :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                height!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 2.0,
                              ),
                              const Text(
                                'cm',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Weight :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                weight!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 2.0,
                              ),
                              const Text(
                                'kg',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          bmiFeedBack!,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )),
            CalcButton(
              navigate: () {
                bmiResults;
                bmiFeedBack;
                bmiText;
              },
              colour: const Color(0XFF02B290),
              height: 80.0,
              text: const Text(
                'RE-CALCULATE BMI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ]),
    );
  }
}
