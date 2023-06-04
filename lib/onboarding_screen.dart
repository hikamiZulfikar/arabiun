import 'package:flutter/material.dart';
import 'package:project/authentication/login.dart';
import 'package:project/authentication/register.dart';
import 'package:project/authentication/widgets/auth_page_widget.dart';
import 'package:project/model/walkthrough_model.dart';
import 'package:project/styles/button_styles.dart';
import 'package:project/styles/color.dart';
import 'package:project/styles/text_styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  late int _pageIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageIndex = 0;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            height: 600,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: AppColor.cardbluelight,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 2,
                color: AppColor.blackBase,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: AppColor.cardbluelight,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  width: 2,
                  color: AppColor.blackBase,
                ),
              ),
              child: Column(
                children: [
                  Flexible(
                    child: PageView.builder(
                      itemCount: onboarding_data.length,
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          _pageIndex = value;
                        });
                      },
                      itemBuilder: (context, index) => WalkthroughContent(
                        image: onboarding_data[index].image,
                        title: onboarding_data[index].title,
                        description: onboarding_data[index].description,
                      ),
                    ),
                  ),
                  verticalSizedBox(12.0),
                  Row(
                    children: [
                      const Spacer(),
                      ...List.generate(
                        onboarding_data.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: DotIndicator(isActive: index == _pageIndex),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  verticalSizedBox(12.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                        );
                      },
                      style: PrimaryButtons.filledButtonStylePrimaryBase,
                      child: Text(
                        "MULAI",
                        style: TextStyles.button.copyWith(
                          color: AppColor.whiteBase,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    width: double.infinity,
                    height: 48,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      child: const Text(
                        "SUDAH PUNYA AKUN",
                      ),
                    ),
                  ),
                  verticalSizedBox(20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 12,
      width: 24,
      decoration: BoxDecoration(
        color: isActive ? AppColor.primaryDarkest : Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}

class WalkthroughContent extends StatelessWidget {
  const WalkthroughContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    double textPadding = MediaQuery.of(context).size.width * 0.1;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(12.0),
          width: screenWidth,
          height: (screenWidth / 28 * 20) - 40,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: textPadding),
          child: Text(
            title,
            style: TextStyles.headline4,
            textAlign: TextAlign.center,
          ),
        ),
        verticalSizedBox(12.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: textPadding),
          child: Text(
            description,
            style: TextStyles.body2,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
