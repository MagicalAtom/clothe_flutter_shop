import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/constants/Data.dart';
import 'package:flutter_learn/constants/main_constant.dart';
import 'package:flutter_learn/constants/screen_size_config.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApplication());

class MyApplication extends StatefulWidget {
  const MyApplication({super.key});

  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  int indexClick = 0;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 64.0,
          child: CustomNavigationBar(
            currentIndex: page,
            onTap: (index) {
              setState(() {
                page = index;
              });
            },
            isFloating: true,
            borderRadius: Radius.circular(40),
            selectedColor: MainConstant.White,
            unSelectedColor: MainConstant.NormalGray,
            backgroundColor: MainConstant.MainColor,
            strokeColor: Colors.transparent,
            scaleFactor: 0.1,
            iconSize: 40,
            items: [
              CustomNavigationBarItem(
                  icon: Center(
                      child: Icon(
                CupertinoIcons.house_alt,
                size: 35,
              ))),
              CustomNavigationBarItem(
                  icon: Center(
                      child: Icon(CupertinoIcons.shopping_cart, size: 35))),
              CustomNavigationBarItem(
                  icon: Center(child: Icon(CupertinoIcons.heart, size: 35))),
              CustomNavigationBarItem(
                  icon: Center(
                      child: Icon(CupertinoIcons.profile_circled, size: 35))),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Welcome 👋",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: 'pop'),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Mehran Piltan",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: MainConstant.DarkBrown,
                            fontSize: 23,
                            fontFamily: 'pop'),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/2.jpg',
                    ),
                    radius: 25,
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextField(
                    style:
                        TextStyle(color: MainConstant.NormalGray, fontSize: 17),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        // فاصله محتوا داخل تکست فیلد از داخل تکست فیلد
                        prefixIcon: Icon(
                          Icons.search,
                          size: 32,
                          color: MainConstant.NormalGray,
                        ),
                        // همون آیکون ذره بین کنار
                        hintText: 'Search Clothes . . . ',
                        // متن راهنما
                        border: MainConstant().InputBorder,
                        // استایل بوردر تکست فیلد در حالت عادی
                        errorBorder: MainConstant().InputBorder,
                        disabledBorder: MainConstant().InputBorder,
                        focusedBorder: MainConstant().InputBorder,
                        // استایل بوردر زمانی که قرار است فوکوش روی آن انجام شود
                        focusedErrorBorder: MainConstant().InputBorder,
                        enabledBorder: MainConstant().InputBorder,
                        // استایل وقتی که تکست فیلد ما فعال است
                        hintStyle: TextStyle(
                            color: MainConstant.NormalGray, fontSize: 16)),
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 52,
                    height: 52,
                    child: Icon(
                      Icons.filter_alt_outlined,
                      color: MainConstant.NormalGray,
                      size: 30,
                    ),
                    decoration: BoxDecoration(
                        color: MainConstant.MainColor,
                        borderRadius: BorderRadius.circular(15)),
                  )
                ],
              ),
              // برای بخش دسته بندی ها برای اینکه قراره داخل Column باشه از SizedBox استفاده میکنیم
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: double.infinity,
                  // چون قرار لیست ویو باشه و افقی پس قراره اسکرول هم بخوره پس موردی نداره اگه از این حالت استفاده کنیم
                  height: 38,
                  // اندازه آیتم ها نهایت همینقدر هست . ایتم های داخل لیست ویو
                  child: ListView.builder(
                      itemCount: categories.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              indexClick = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            height: 36,
                            width: 85,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Row(
                                children: [
                                  generateIcon(
                                      index: index,
                                      color: index == indexClick
                                          ? Colors.white
                                          : MainConstant.MainColor),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    categories[index],
                                    style: TextStyle(
                                        color: index == indexClick
                                            ? Colors.white
                                            : MainConstant.MainColor,
                                        fontFamily: 'pop'),
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index == indexClick
                                    ? MainConstant.MainColor
                                    : Colors.white,
                                border: Border.all(
                                    color: MainConstant.MainColor, width: .8)),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              MasonryGridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 28,
                mainAxisSpacing: 13,
                crossAxisCount: 2,
                itemCount: images.length,
                padding: EdgeInsets.symmetric(
                    horizontal: MainConstant.paddingHorizon),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                MainConstant.borderRadius),
                            child: Image.asset(
                              'assets/images/5.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
                          Positioned(
                              right: 12,
                              top: 12,
                              child: GestureDetector(
                                child: Container(
                                  child: Center(
                                      child: Icon(
                                    CupertinoIcons.heart,
                                    color: Colors.white,
                                  )),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: MainConstant.MainColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Modern light clothes',
                        style: TextStyle(
                            fontFamily: 'pop',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                            color: MainConstant.MainColor),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'all Clothes',
                        style: TextStyle(
                            fontFamily: 'pop',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: MainConstant.NormalGray),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '\$212.09',
                            style: TextStyle(
                                fontFamily: 'pop',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                                color: MainConstant.DarkBrown),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: MainConstant.Yellow,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '5.0',
                                style: TextStyle(
                                    fontFamily: 'pop',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    overflow: TextOverflow.ellipsis,
                                    color: MainConstant.DarkBrown),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
