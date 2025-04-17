import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/styles/styles.dart';

class onBoardingWidget extends StatelessWidget {
  final Image image;
  final String text1;
  final String text2;
  final String buttonText;
  final VoidCallback onPressed;

  onBoardingWidget(
      {required this.image,
      this.text1 = '',
      this.text2 = '',
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: image),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      text1,
                      textAlign: TextAlign.center,
                      style: kGilroy28700,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015),
                    Text(
                      text2,
                      textAlign: TextAlign.center,
                      style: kGilroy16500,
                    ),
                  ],
                )),
                FractionallySizedBox(
                  widthFactor: 0.85,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(61, 123, 66, 1),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: onPressed,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(buttonText,
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              )),
                          SizedBox(width: 8),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
