import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bmi_calc.dart';
import '../components/button.dart';
import '../components/card.dart';
import '../components/gender_option.dart';
import '../components/round_button.dart';
import '../provider/auth_provider.dart';
import 'results.dart';
import 'package:provider/provider.dart';

const numberStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);
const textStyle = TextStyle(
  fontSize: 18.0,
);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final buttonColor = Colors.black12.withOpacity(0.5);
  final colours = Colors.white.withOpacity(0.1);
  final inactiveColour = Colors.black12.withOpacity(0.1);
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'LOGOUT',
            onPressed: () async {
              try {
                await authProvider.signOut(context);
              } catch (e) {
                // Handle sign-out error if needed
                rethrow;
              }
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxCard(
                    onClick: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? colours
                        : inactiveColour,
                    cardChild: const GenderOption(
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: BoxCard(
                    onClick: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? colours
                        : inactiveColour,
                    cardChild: const GenderOption(
                      label: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BoxCard(
              colour: colours,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: textStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberStyle,
                      ),
                      const Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0XFF02B290),
                      inactiveTrackColor: colours,
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BoxCard(
                    colour: colours,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGTH',
                            style: textStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: numberStyle,
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                colour: buttonColor,
                                icon: FontAwesomeIcons.plus,
                                iconColor: Colors.white,
                                tap: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              RoundIconButton(
                                colour: buttonColor,
                                icon: FontAwesomeIcons.minus,
                                iconColor: Colors.white,
                                tap: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              )
                            ],
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: BoxCard(
                    colour: colours,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: textStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numberStyle,
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                colour: buttonColor,
                                icon: FontAwesomeIcons.plus,
                                iconColor: Colors.white,
                                tap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              RoundIconButton(
                                colour: buttonColor,
                                icon: FontAwesomeIcons.minus,
                                iconColor: Colors.white,
                                tap: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
          CalcButton(
            navigate: () {
              BMICALCULATOR calcBMI =
                  BMICALCULATOR(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResults: calcBMI.calculateBMI(),
                            bmiText: calcBMI.getResult(),
                            bmiFeedBack: calcBMI.feedBack(),
                            gender: selectedGender == Gender.male
                                ? 'MALE'
                                : 'FEMALE',
                            height: height.toString(),
                            weight: weight.toString(),
                            age: age.toString(),
                          )));
            },
            colour: const Color(0XFF02B290),
            height: 80.0,
            text: const Text(
              'CALCULATE BMI',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
