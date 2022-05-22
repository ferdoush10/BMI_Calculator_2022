import 'package:bmi_calc/constaints/app_constaints.dart';
import 'package:bmi_calc/widgets/left_bar.dart';
import 'package:bmi_calc/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainHexColor,
      appBar: AppBar(
        title: Text(
          "BMI_Calculator",
          style: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                // ignore: no_leading_underscores_for_local_identifiers
                double _h = double.parse(_heightController.text);
                // ignore: no_leading_underscores_for_local_identifiers
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "You are over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You have normal weight";
                  } else {
                    _textResult = "You are under weight";
                  }
                });
              },
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    color: accentHexColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  color: accentHexColor,
                  fontSize: 90,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    color: accentHexColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const LeftBar(barWidth: 40),
            const SizedBox(height: 20),
            const LeftBar(barWidth: 70),
            const SizedBox(height: 20),
            const LeftBar(barWidth: 40),
            const SizedBox(height: 20),
            const RightBar(barWidth: 70),
            const SizedBox(height: 50),
            const RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
