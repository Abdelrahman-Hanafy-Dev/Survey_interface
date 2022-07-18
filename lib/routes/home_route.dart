import 'package:flutter/material.dart';
import 'package:survey_interface/constants.dart';
import 'package:survey_interface/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: pageBackground,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'US Airlines Survey',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 40.0,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                const Text(
                  "• The survey's goal is to know more about you and your habits when it comes to travelling!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 23.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '• The Survey consists of three questions.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 23.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '• Each question has three choices you can choose from.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 23.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  '• Your honesty of your answers are very much appreciated.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 23.0,
                  ),
                ),
                const SizedBox(
                  height: 64.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteGenerator.surveyPage);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Go To Survey',
                        style: TextStyle(
                          color: Color(0xFF8C65C7),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
