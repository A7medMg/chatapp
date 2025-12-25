import 'package:flutter/material.dart';
import '../login/loginScreen.dart';
import 'onbordingModel.dart';

class OnbordingScreen extends StatefulWidget {
  static String id = "onbording";

  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnbordingModel> data = [
    OnbordingModel(
      image: "assets/images/cuate.png",
      text: "Chat with friends anytime, anywhere.",
    ),
    OnbordingModel(
      image: "assets/images/pana.png",
      text: "Secure messaging you can trust.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          Image.asset("assets/images/Classic.png"),

          // 🟢 PageView
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: data.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(data[index].image),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        data[index].text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffA23603),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // 🟢 أزرار التحكم
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: currentIndex == 0
                      ? null
                      : () {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Text("Back"),
                ),

                TextButton(
                  onPressed: () {
                    if (currentIndex == data.length - 1) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    currentIndex == data.length - 1 ? "Start" : "Next",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
