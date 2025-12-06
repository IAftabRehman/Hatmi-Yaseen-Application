import 'package:flutter/material.dart';
import 'package:hatmiyaseen/Configuration/AppColors.dart';
import 'package:hatmiyaseen/Views/Elements/CustomButton.dart';
import 'package:hatmiyaseen/Views/Elements/CustomContainer.dart';
import 'package:hatmiyaseen/Views/Elements/CustomText.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedCount;
  int? selectedButtonIndex;

  double get progress => (selectedButtonIndex ?? 0) / 41;

  Color getProgressColor(int value) {
    if (value < 5) {
      return Colors.red; // 0 – 4
    } else if (value < 10) {
      return Colors.redAccent; // 5 – 9
    } else if (value < 15) {
      return Colors.deepOrangeAccent; // 10 – 14
    } else if (value < 25) {
      return Colors.orange; // 15 – 24
    } else if (value < 35) {
      return Colors.lightGreen; // 25 – 34
    } else {
      return Colors.green; // 35 – 41
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
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

            SizedBox(height: h * 0.05),

            CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 15.0,
              percent: progress,
              center: MyText(
                text: "${selectedButtonIndex ?? 0} / 41",
                fontWeight: FontWeight.bold,
                size: 25,
                color: AppColors.textColor,
              ),
              progressColor: getProgressColor(selectedButtonIndex ?? 0),
              backgroundColor: Colors.white,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              animationDuration: 1500,
            ),

            SizedBox(height: h * 0.05),

            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.8,
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

            SizedBox(height: h * 0.02),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: "کرو",
                size: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),

              Expanded(
                child: MyButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        int? customSelected;

                        return StatefulBuilder(
                          builder: (context, setStateDialog) {
                            return AlertDialog(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),

                              title: Center(
                                child: Text(
                                  "آپ نے کتنی بار پڑھ لیا ہے؟",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),

                              content: DropdownButton<int>(
                                isExpanded: true,
                                hint: MyText(
                                  text: "Select number (7 to 41)",
                                  size: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                value: customSelected,
                                items: List.generate(35, (index) {
                                  int number = index + 7;
                                  return DropdownMenuItem(
                                    value: number,
                                    child: Text(number.toString()),
                                  );
                                }),
                                onChanged: (value) {
                                  setStateDialog(() {
                                    customSelected = value;
                                  });
                                },
                              ),

                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Cancel"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (customSelected != null) {
                                      setState(() {
                                        selectedButtonIndex = customSelected!;
                                      });
                                    }
                                    Navigator.pop(context);
                                  },
                                  child: Text("Done"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  btnLabel: "Click",
                  textStyle: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),

              MyText(
                text: "اگر آپ نے 6 سے زیادہ بار پڑھ لیا ہے تو",
                size: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ],
          ),

          SizedBox(height: h * 0.04),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: CircleBorder(),
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              ),
              child: MyText(
                text: "Done",
                size: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
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
        padding: const EdgeInsets.all(8),
      ),
      child: MyText(
        text: label.toString(),
        fontWeight: FontWeight.bold,
        size: 30,
        color: isSelected ? Colors.black : Colors.white,
      ),
    );
  }
}
