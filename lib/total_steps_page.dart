// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:my_google_fit/widgets.dart';

import 'constant.dart';

class TotalStepsPage extends StatefulWidget {
  const TotalStepsPage({super.key});

  @override
  State<TotalStepsPage> createState() => _TotalStepsPageState();
}

class _TotalStepsPageState extends State<TotalStepsPage> {
  HealthFactory health = HealthFactory();
  int _nofSteps = 10;
  AppState _state = AppState.FETCHING_DATA;
  Future fetchStepData() async {
    int? steps;
    // int? calories;

    // get steps for today (i.e., since midnight)
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    bool requested = await health.requestAuthorization([HealthDataType.STEPS]);

    if (requested) {
      try {
        // List<HealthDataPoint> caloriesData=  await health.getHealthDataFromTypes(
        //       midnight, now, [HealthDataType.ACTIVE_ENERGY_BURNED]);

        steps = await health.getTotalStepsInInterval(midnight, now);
      } catch (error) {
        print("Caught exception in getTotalStepsInInterval: $error");
      }

      print('Total number of steps: $steps');

      setState(() {
        _nofSteps = (steps == null) ? 0 : steps;
        _state = (steps == null) ? AppState.NO_DATA : AppState.STEPS_READY;
      });
    } else {
      print("Authorization not granted - error in authorization");
      setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  @override
  void initState() {
    fetchStepData();
    super.initState();
  }

  Widget _content() {
    if (_state == AppState.NO_DATA)
      return contentNoData();
    else if (_state == AppState.STEPS_READY)
      return stepsFetched();
    else if (_state == AppState.FETCHING_DATA)
      return contentFetchingData();
    else
      return contentNotFetched();
  }

  Widget stepsFetched() {
    return Text('Total number of steps: $_nofSteps');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Total steps"),
        ),
        body: Center(child: _content()));
  }
}
