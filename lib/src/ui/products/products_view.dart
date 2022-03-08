import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:math' as math;

import 'package:flutter_cleana/src/themes.dart';
import 'package:flutter_cleana/src/ui/common/app_loading.dart';
import 'package:flutter_cleana/src/ui/common/bottom_bar.dart';
import 'package:flutter_cleana/src/ui/users/users_ctrl.dart';
import 'package:flutter_cleana/src/ui/detail_view.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersCtrl = Get.find<UsersCtrl>();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: const BottomBar(),
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text.rich(
            TextSpan(
              text: 'Hi ',
              children: [
                TextSpan(
                  text: 'Keny',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              // onTap: () => Get.to(const ConfigView()),
              child: const SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://picsum.photos/48'),
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
          bottom: const TabBar(
            isScrollable: false,
            indicatorColor: AppColors.primary,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Red wine'),
              Tab(text: 'White wine'),
              Tab(text: 'Rose wine'),
            ],
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
        ),
        body: TabBarView(children: [
          listingProducts(usersCtrl),
          listingProducts(usersCtrl),
          listingProducts(usersCtrl),
          listingProducts(usersCtrl),
        ]),
      ),
    );
  }

  Opacity searchForm() {
    return Opacity(
      opacity: 0.75,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 48,
              child: CupertinoTextField(
                placeholder: 'Search',
                style: const TextStyle(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(left: 55),
                decoration: BoxDecoration(
                  border: Border.all(width: 0),
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 48 / 4,
            left: 20,
            child: Opacity(
              opacity: 0.5,
              child: Icon(Icons.search),
            ),
          ),
          const Positioned(
            top: 48 / 4,
            right: 20,
            child: Opacity(
              opacity: 0.5,
              child: Icon(Icons.filter_list),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView listingProducts(UsersCtrl usersCtrl) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            searchForm(),
            const SizedBox(height: 10),
            Obx(() {
              if (usersCtrl.loading.value) {
                return const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(child: AppLoading()),
                );
              }
              return GetBuilder<UsersCtrl>(
                id: 'users',
                builder: (ctrl) {
                  return ctrl.users.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                            child: Text('No data'),
                          ),
                        )
                      : Wrap(
                          spacing: 20,
                          children: ctrl.users
                              .map((user) => CardProduct(
                                    name: user.name,
                                    image: user.avatar!,
                                    price: (user.id * 11).toString(),
                                  ))
                              .toList(),
                        );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class CardProduct extends StatelessWidget {
  const CardProduct({
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
    return GestureDetector(
      onTap: () => Get.to(
        () => DetailView(
          name: name,
          image: image,
          price: price,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 15),
        width: Get.width < 480 ? Get.width / 2 - 30 : 200,
        child: Stack(
          children: [
            Positioned.fill(
              top: 20,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white10.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const Positioned(
              top: 30,
              right: 15,
              child: Icon(Icons.favorite_border),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.rotate(
                    angle: 9 * math.pi / 180,
                    child: Image.network(image),
                  ),
                  const SizedBox(height: 15),
                  Text(name),
                  Text(
                    '\$ $price',
                    style: GoogleFonts.dmSerifDisplay(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
