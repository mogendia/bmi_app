import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi/cubit/app_states.dart';
import 'package:bmi/views/result_screen.dart';

import '../cubit/app_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //first tab vars
  int weight = 50;
  bool isMaleAdult = true;
  double heightVal = 160;
  int age = 20;
   double bfp = 20;
   double finalRes = 50;
  double fatPercent = 50.5;

  //second tab vars

  int weight1 = 50;
  bool isMaleChild = true;
  double heightVal1 = 160;
  int age1 = 20;
   double finalRes1 = 50;
   double bfp1 = 20;
  double fatPercent1 = 50.5;

  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(
                        icon: Text(
                      'ADULTS',
                      style: TextStyle(fontSize: 20, fontFamily: 'janna'),
                    )),
                    Tab(
                      icon: Text(
                        'IMMATURES',
                        style: TextStyle(fontSize: 20, fontFamily: 'janna'),
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        AppCubit.get(context).themeToggle();
                      },
                      icon: Icon(
                        cubit.isDark == false
                            ? Icons.brightness_4
                            : Icons.brightness_4_outlined,
                        size: 23,
                      ))
                ],
                title: const Text('BMI Calculator'),
                centerTitle: true,
              ),
              body: TabBarView(
                children: [
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                genderDetector(
                                  onTap: () {
                                    setState(() {
                                      isMaleAdult = true;
                                    });
                                  },
                                  genderIcon: Icons.male,
                                  genderType: 'Male',
                                  color: isMaleAdult
                                      ? Colors.indigo

                                      : Colors.blueGrey,
                                  context: context,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                genderDetector(
                                  onTap: () {
                                    setState(() {
                                      isMaleAdult = false;
                                    });
                                  },
                                  genderIcon: Icons.female,
                                  genderType: 'Female',
                                  color: !isMaleAdult
                                      ? Colors.indigo
                                      : Colors.blueGrey,
                                  context: context,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Height",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 35),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          heightVal.toStringAsFixed(1),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 35),
                                        ),
                                        const SizedBox(
                                          height: 1,
                                          width: 5,
                                        ),
                                        const Text(
                                          'cm',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35),
                                        ),
                                      ],
                                    ),
                                    Slider(
                                        min: 90,
                                        max: 210,
                                        value: heightVal,
                                        onChanged: (newValue) {
                                          setState(() {
                                            heightVal = newValue;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                dataPicker(
                                    onClick2: (){
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    context: context, data: "Age", dataNum: age,
                                onClick: (){
                                  setState(() {
                                    age++;
                                  });
                                }, hero: '2', hero1: '6999'
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                dataPicker(context: context,
                                    data: 'Weight',
                                    dataNum: weight,
                                    onClick: (){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    onClick2: (){
                                      setState(() {
                                        weight--;
                                      });
                                    }, hero: '6', hero1: '6595')
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    finalRes =
                                        weight / pow(heightVal / 100, 2);
                                    if (isMaleAdult) {
                                      bfp = 1.20 * finalRes - 0.23 * age - 16.2;
                                    } else {
                                      bfp = 1.20 * finalRes - 0.23 * age + 5.4;
                                    }
                                  });
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return TestResult(
                                        fatPercent: bfp,
                                        age: age,
                                        isMale: isMaleAdult,
                                        finalResult: finalRes);
                                  }));
                                },
                                child: const Text(
                                  'CALCULATE',
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'janna'),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                genderDetector(
                                  onTap: () {
                                    setState(() {
                                      isMaleChild = true;
                                    });
                                  },
                                  genderIcon: Icons.male,
                                  genderType: 'Male',
                                  color: isMaleChild
                                      ? Colors.indigo
                                      : Colors.blueGrey,
                                  context: context,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                genderDetector(
                                  onTap: () {
                                    setState(() {
                                      isMaleChild = false;
                                    });
                                  },
                                  genderIcon: Icons.female,
                                  genderType: 'Female',
                                  color: !isMaleChild
                                      ? Colors.indigo
                                      : Colors.blueGrey,
                                  context: context,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Height",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 35),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          heightVal1.toStringAsFixed(1),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 35),
                                        ),
                                        const SizedBox(
                                          height: 1,
                                          width: 5,
                                        ),
                                        const Text(
                                          'cm',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35),
                                        ),
                                      ],
                                    ),
                                    Slider(
                                        min: 90,
                                        max: 210,
                                        value: heightVal1,
                                        onChanged: (newValue) {
                                          setState(() {
                                            heightVal1 = newValue;
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                dataPicker(
                                    onClick2: (){
                                      setState(() {
                                        age1--;
                                      });
                                    },
                                    context: context, data: "Age", dataNum: age1,
                                    onClick: (){
                                      setState(() {
                                        age1++;
                                      });
                                    }, hero: '58', hero1: '444'
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                dataPicker(context: context,
                                    data: 'Weight',
                                    dataNum: weight1,
                                    onClick: (){
                                      setState(() {
                                        weight1++;
                                      });
                                    },
                                    onClick2: (){
                                      setState(() {
                                        weight1--;
                                      });
                                    }, hero: '884', hero1: '54599')
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    finalRes1 =
                                        weight1 / pow(heightVal1 / 100, 2);
                                    if (isMaleChild) {
                                      bfp1 = 1.51 * finalRes1 - 0.70 * age1 - 2.2;
                                    } else {
                                      bfp1 = 1.51 * finalRes1 - 0.70 * age1 + 1.4;
                                    }
                                  });
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return TestResult(
                                            fatPercent: bfp1,
                                            age: age1,
                                            isMale: isMaleChild,
                                            finalResult: finalRes1);
                                      }));
                                },
                                child: const Text(
                                  'CALCULATE',
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'janna'),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
      listener: (context, state) {},
    );
  }

  Widget dataPicker({
    required BuildContext context,
    required String hero,
    required String hero1,

    required String data,
    required dynamic dataNum,
    required onClick,
    required onClick2
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * .40,
      decoration: BoxDecoration(
          color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            data,
            style:
            const TextStyle(
                fontSize: 22
            )          ),
          Text(
            '$dataNum',
            style:
                const TextStyle(
                  fontSize: 20
                )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                mini: true,
                heroTag: hero,
                onPressed: onClick,
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                heroTag: hero1,
                mini: true,
                onPressed: onClick2,
                child: const Icon(Icons.remove),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget genderDetector({
  required onTap,
  required IconData genderIcon,
  required String genderType,
  required Color color,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width * .40,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(genderIcon),
          Text(
            genderType,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 30),
          )
        ],
      ),
    ),
  );
}
