import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:flutter_cleana/src/themes.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);

  final String name;
  final String image;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Stack(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: BackButton(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 4),
                                  child: Chip(label: Text('Red')),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 4),
                                  child: Chip(label: Text('Wine')),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Transform.rotate(
                        angle: 9 * math.pi / 180,
                        child: SizedBox(
                          width: (Get.width / 2) - 10,
                          child: Image.network(image),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Service temperature'),
                        Text(
                          '18°',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Opacity(
                opacity: 0.5,
                child: Text(
                    'I have tried it just now, but its not working. Can you please upvote this question? i am new to stack-overflow and people are downvoting.'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  '\$ $price',
                  style: GoogleFonts.dmSerifDisplay(
                    color: AppColors.primary,
                    fontSize: 42,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          btnIcon(Icons.remove),
                          const Text('1'),
                          btnIcon(Icons.add),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: btnIcon(Icons.favorite, active: true),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: Get.width,
                    height: 60,
                    child: CupertinoButton(
                      child: const Text('Add to cart'),
                      onPressed: () => {},
                      color: AppColors.primary,
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

  Container btnIcon(IconData icon, {bool active = false}) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.25),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        icon: Icon(icon, color: active ? AppColors.primary : Colors.white),
        onPressed: () => {},
      ),
    );
  }
}
