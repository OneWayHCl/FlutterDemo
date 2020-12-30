import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  StepperDemo({Key key}) : super(key: key);

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
                data: Theme.of(context).copyWith(primaryColor: Colors.black),
                child: Stepper(
                    currentStep: _currentStep,
                    onStepTapped: (value) {
                      setState(() {
                        _currentStep = value;
                      });
                    },
                    onStepContinue: () {
                      setState(() {
                        _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                      });
                    },
                    onStepCancel: () {
                      setState(() {
                        _currentStep > 0 ? _currentStep -= 1 : _currentStep = 2;
                      });
                    },
                    steps: [
                      Step(
                          title: Text('123'),
                          subtitle: Text('456'),
                          content: Text('123456'),
                          isActive: _currentStep == 0),
                      Step(
                          title: Text('234'),
                          subtitle: Text('567'),
                          content: Text('234567'),
                          isActive: _currentStep == 1),
                      Step(
                          title: Text('345'),
                          subtitle: Text('678'),
                          content: Text('345678'),
                          isActive: _currentStep == 2)
                    ]))
          ],
        ),
      ),
    );
  }
}
