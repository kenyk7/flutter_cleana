import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_cleana/src/themes.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Stack(
            children: [
              Positioned.fill(
                  child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.black87,
                      Colors.black12,
                      Colors.black87,
                      Colors.black,
                    ],
                  ),
                ),
              )),
              SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text.rich(
                      const TextSpan(
                        text: 'Wine.',
                        children: [
                          TextSpan(
                            text: 'ur',
                            style: TextStyle(
                              color: AppColors.primary,
                            ),
                          )
                        ],
                      ),
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                bottom: 120,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Image.network('https://i.imgur.com/R6Q67Cg.png'),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => Get.offNamed('/products'),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Text('Explore your tastes'),
                          ),
                          SizedBox(
                            width: 32,
                            height: 32,
                            child: FloatingActionButton(
                              onPressed: () => Get.offNamed('/products'),
                              child: const Icon(Icons.chevron_right),
                              backgroundColor: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
