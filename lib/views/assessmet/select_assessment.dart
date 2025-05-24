import 'package:flutter/material.dart';
import 'package:gyaanplant_learning_app/model/get_category.dart';
import 'package:gyaanplant_learning_app/urls/url.dart';
import 'package:gyaanplant_learning_app/views/assessmet/animation/sel_assessment_shimmer.dart';
import 'package:gyaanplant_learning_app/views/assessmet/mcq/mcq_screen.dart';

class SelectAssessmentCategory extends StatefulWidget {
  const SelectAssessmentCategory({super.key});

  @override
  State<SelectAssessmentCategory> createState() =>
      _SelectAssessmentCategoryState();
}

class _SelectAssessmentCategoryState extends State<SelectAssessmentCategory> {
  List<GetAssessmentCategory> categories = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      categories = await AppUrl.getAssessmentCategory();
    } catch (e) {
      print('error');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 15.0,
              spreadRadius: 0,
              offset: Offset(0, 0),
              color: Color.fromRGBO(179, 32, 115, 0.18),
            )
          ]),
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Select Category',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 18.0,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const SelectCourseShimmer()
          : Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                const Center(
                  child: Text(
                    'Select Assessment Category',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20.0,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 85,
                ),
                Column(
                  children: [
                    SelectCourse(
                      image1: categories[0].imageUrl,
                      text1: categories[0].title,
                      image2: categories[1].imageUrl,
                      text2: categories[1].title,
                      onPressed1: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MCQAssessment(),
                          ),
                        );
                      },
                      onPressed2: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MCQAssessment(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SelectCourse(
                      image1: categories[2].imageUrl,
                      text1: categories[2].title,
                      image2: categories[0].imageUrl,
                      text2: categories[3].title,
                      onPressed1: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MCQAssessment(),
                          ),
                        );
                      },
                      onPressed2: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MCQAssessment(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
    );
  }
}

class SelectCourse extends StatelessWidget {
  final String? image1;
  final String? text1;
  final String? image2;
  final String? text2;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;

  SelectCourse({
    required this.image1,
    required this.text1,
    required this.image2,
    required this.text2,
    required this.onPressed1,
    required this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width * 0.35;
    const double imageHeight = 160;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: onPressed1,
          child: Column(
            children: [
              Container(
                width: imageWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image1 ?? '',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                text1 ?? '',
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16.0,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 150,
        ),
        GestureDetector(
          onTap: onPressed2,
          child: Column(
            children: [
              Container(
                width: imageWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image2 ?? '',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                text2 ?? '',
                style: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16.0,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
