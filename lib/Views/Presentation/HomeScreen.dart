import 'package:flutter/material.dart';
import 'package:hatmiyaseen/Configuration/AppColors.dart';
import 'package:hatmiyaseen/Views/Elements/CustomButton.dart';
import 'package:hatmiyaseen/Views/Elements/CustomContainer.dart';
import 'package:hatmiyaseen/Views/Elements/CustomText.dart';
import 'package:hatmiyaseen/Views/Presentation/PDFScreen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedButtonIndex;

  double get progress => (selectedButtonIndex ?? 0) / 41;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyContainer(
        color: AppColors.backgroundColor,
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              text: "AOA Aftab",
              fontWeight: FontWeight.bold,
              size: 25,
              color: AppColors.textColor,
            ),

            const SizedBox(height: 40),

            // Progress Circle
            CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 15.0,
              percent: progress,
              center: MyText(
                text: "${selectedButtonIndex ?? 0} / 41",
                fontWeight: FontWeight.bold,
                size: 20,
                color: AppColors.textColor,
              ),
              progressColor: Colors.black,
              backgroundColor: Colors.yellow,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              animationDuration: 1500,
            ),

            const SizedBox(height: 10),

            // Progress Text
            // MyText(
            //   text: "${selectedButtonIndex ?? 0} / 41",
            //   fontWeight: FontWeight.bold,
            //   size: 50,
            //   color: AppColors.textColor,
            // ),
            const SizedBox(height: 20),

            // ROUND BUTTONS GRID
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 25,
                crossAxisSpacing: 20,
                childAspectRatio: 1.3,
              ),
              children: [
                buildCircleButton(1),
                buildCircleButton(2),
                buildCircleButton(3),
                buildCircleButton(4),
                buildCircleButton(5),
                buildCircleButton(6),
              ],
            ),

            const SizedBox(height: 20),

            // Done Button
            MyButton(
              onPressed: () {},
              btnLabel: "Done",
              textColor: Colors.white,
              color: Colors.red,
              fontSize: 25,
              height: 50,
              width: 150,
            ),

            const SizedBox(height: 10),

            // PDF Button
            MyButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PDFScreen()),
                );
              },
              btnLabel: "Read Surat Yaseen",
              textColor: Colors.white,
              color: Colors.red,
              fontSize: 25,
              height: 50,
              width: 220,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCircleButton(int label) {
    bool isSelected = selectedButtonIndex == label;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedButtonIndex = label;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.white : Colors.black,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
      ),
      child: MyText(
        text: label.toString(),
        fontWeight: FontWeight.bold,
        size: 40,
        color: isSelected ? Colors.black : Colors.white,
      ),
    );
  }
}
