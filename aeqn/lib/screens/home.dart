import 'dart:async';

import 'package:aeqn/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _categoryList = [
    'الكل',
    'ترفيه',
    'رياضة',
    'تعليم',
    'سياسة',
    'صحة',
    'إعلام',
  ];

  int _currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);
  late Timer _timer;
  int _currentPage = 0;
  int _numPages = 3;
  Duration _duration = const Duration(seconds: 2);

  void _startTimer() {
    _timer = Timer.periodic(_duration, (Timer timer) {
      _currentPage = (_currentPage + 1) % _numPages;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: const BoxDecoration(color: AppColors.blueColor),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'من نحن',
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'تواصل معنا',
                        style: TextStyle(color: Colors.white),
                      )),
                  const Spacer(),
                  const Icon(
                    Icons.local_activity,
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            ///---Header---///

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  //
                  Expanded(
                      child: Image.asset(
                    'assets/images/logo.png',
                        width: 100,
                        height: 100,
                  )),
                  //
                  Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.5),
                                  blurRadius: 4,
                                  offset: Offset(0, 4))
                            ]),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: AppColors.orangeColor,
                                ),
                              ),
                              hintText: 'الرجاء البحث هنا',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide.none,
                              )),
                        ),
                      )),
                  //
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.5),
                              blurRadius: 4,
                              offset: Offset(0, 4))
                        ]),
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          color: AppColors.orangeColor,
                        ),
                        label:Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ) ),
                  )),
                ],
              ),
            ),

            ///---Slider---///

            Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  height: size.height * 0.2,
                  color: AppColors.blueColor,
                  child: PageView.builder(
                      reverse: true,
                      controller: _pageController,
                      itemCount: _numPages,
                      itemBuilder: (_, index) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('https://th.bing.com/th/id/R.235a8bd2cfce6f841b055a85f770b9df?rik=DKIlnr7b%2fDge%2bQ&pid=ImgRaw&r=0')
                            )
                          ),
                        );
                      }),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: size.width * 0.03,
                  child: CircleAvatar(
                    backgroundColor: AppColors.orangeColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: size.width * 0.03,
                  child: CircleAvatar(
                    backgroundColor: AppColors.orangeColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///---Category---///
            SizedBox(
              height: size.height * 0.08,
              child: StatefulBuilder(builder: (context, setStateCategory) {
                return ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    scrollDirection: Axis.horizontal,
                    itemCount: _categoryList.length,
                    separatorBuilder: (_, __) => const SizedBox(
                          width: 10.0,
                        ),
                    itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            _currentIndex = index;
                            setStateCategory(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.height * 0.03, vertical: 0.0),
                            decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? AppColors.blueColor
                                  : AppColors.blueColor.withOpacity(.2),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(
                              _categoryList[index],
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ));
              }),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            ///---News---///

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(size.width * 0.02),
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0),
                itemBuilder: (_, index) => Container(
                  decoration: BoxDecoration(
                      color: AppColors.lightBlueColor,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            offset: Offset(0, 4))
                      ]),
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Image.asset('assets/images/logo.png'),
                      )),
                      Expanded(
                          child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'المملكة العربية السعودية $index ',
                          textAlign: TextAlign.center,
                        ),
                      )),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.blueColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0))),
                          onPressed: () {},
                          child: Text(
                            'اقرا المزيد...',
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(
                        height: 10.0,
                      )
                    ],
                  ),
                ),
              ),
            ),

            ///---Footer---///
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(
                    color: AppColors.blueColor,
                  ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('جميع الحقوق محفوظة | منصة ايقن 2023'),
                  Row(
                    children: [
                      Icon(Icons.cabin_rounded),
                      Icon(Icons.wallet_giftcard_outlined),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
