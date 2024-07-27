import 'package:animated_background/particles.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hv_dapp/constants/app_column.dart';
import 'package:hv_dapp/constants/appstyle.dart';
import 'package:hv_dapp/constants/constants.dart';
import 'package:hv_dapp/constants/reusable_text.dart';
import 'package:animated_background/animated_background.dart';
import 'package:hv_dapp/shimmers/foodlist_shimmer.dart';
import 'package:hv_dapp/shimmers/nearby_shimmer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
    PageController pageController = PageController(viewportFraction: 0.85);
  var currpageValue = 0.0;
  final _scalefactor = 0.8;
  double _height = 200.h;

  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currpageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final uidata = [
      {
        'name': 'Hackverse',
        'description': 'Hackathon',
        'date': '12th October 2021',
        'location': 'Online',
        'image': 'assets/anime/download.jpg',
      },
      {
        'name': 'Hackverse',
        'description': 'Hackathon',
        'date': '12th October 2021',
        'location': 'Online',
        'image': 'assets/anime/download.jpg',
      },
      {
        'name': 'Hackverse',
        'description': 'Hackathon',
        'date': '12th October 2021',
        'location': 'Online',
        'image': 'assets/anime/download.jpg',
      },
      {
        'name': 'Hackverse',
        'description': 'Hackathon',
        'date': '12th October 2021',
        'location': 'Online',
        'image': 'assets/anime/download-1.jpg',
      },
      {
        'name': 'Hackverse',
        'description': 'Hackathon',
        'date': '12th October 2021',
        'location': 'Online',
        'image': 'assets/anime/download-2.jpg',
      },
      {
        'name': 'Hackverse',
        'description': 'Hackathon',
        'date': '12th October 2021',
        'location': 'Online',
        'image': 'assets/anime/download.jpg',
      },
    ];
    const LatestHackathons = 
    [
      {
        'name': 'Hackverse',
        'description': 'Hackathon',
        'date': '12th October 2021',
        'location': 'Online',
        'image': 'assets/anime/download-1.jpg',
      },
      {
        'name': 'Hackverse',
        'description': 'Hackathon',
        'date': '12th October 2021',
        'location': 'Online',
        'image': 'assets/anime/download-2.jpg',
      },
      {
        'name': 'Hackverse',
        'description': 'Hackathon',
        'date': '12th October 2021',
        'location': 'Online',
        'image': 'assets/anime/download.jpg',
      },
      {
        'name': 'Hackverse',
        'description': 'Hackathon',
        'date': '12th October 2021',
        'location': 'Online',
        'image': 'assets/anime/download.jpg',
      },
      {
        'name': 'Hackverse',
        'description': 'Hackathon',
        'date': '12th October 2021',
        'location': 'Online',
        'image': 'assets/anime/download.jpg',
      },
      {
        'name': 'Hackverse',
        'description': 'Hackathon',
        'date': '12th October 2021',
        'location': 'Online',
        'image': 'assets/anime/download.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: ReusableText(
            text: 'HackVerse',
            style: appStyle(20, kLightWhite, FontWeight.bold),
          ),
        ),
        backgroundColor: kBackground,
        elevation: 0,
      ),
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options:const ParticleOptions(
            baseColor: Color.fromRGBO(255, 255, 255, 1),
            particleCount: 200,
            spawnMaxSpeed: 500,
            spawnMinSpeed: 500,
            spawnMaxRadius: 7,
            spawnMinRadius: 4,
            // particleSize: 10,
            maxOpacity: 0.5,
            minOpacity: 0.1,
            // spawnMaxOpacity: 0.5,
            // spawnMinOpacity: 0.1,
            // particleSpeed: 1,
          ),
        ),
        child: (uidata.isEmpty)?
        const FoodsListShimmer():
        Column(
          children: [
             // slider section.................
        // GetBuilder<LatestHackathons>(builder:(popularproducts){
        //   return popularproducts.isLoading?Container(
        //     height: 200.h,
        //     child: PageView.builder(
        //         controller: pageController,
        //         itemCount: popularproducts.popularProductList.length,
        //         itemBuilder: (context, position) {
        //           return _buildPageItem(position,popularproducts.popularProductList[position]);
        //         })):CircularProgressIndicator(
        //           color: kBackground,
        //         );
        // }),
        (LatestHackathons.isEmpty)?NearbyShimmer():
        Container(
          height: 200.h,
          margin: EdgeInsets.only(top: 10.h),
          child: PageView.builder(
              controller: pageController,
              itemCount: LatestHackathons.length,
              itemBuilder: (context, position) {
                return _buildPageItem(position,LatestHackathons);
              }),
        ),

        // dots indicator section.................
        DotsIndicator(
                    dotsCount: uidata.length <= 0 ? 1 : uidata.length,
                    position: currpageValue,
                    decorator: DotsDecorator(
                      activeColor: kBackground,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                  ),
       
            Expanded(
              child: ListView.builder(
                itemCount: uidata.length,
                
                itemBuilder: (context, index) {
                  final item = uidata[index];
                  return 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(top: 8.h),
                      decoration: BoxDecoration(
                        color: kSelection.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              height: 60.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: kSelection.withOpacity(0.7),
                              ),
                              child: Image(
                                image: AssetImage(item['image']!),
                                fit: BoxFit.cover,
                                
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(
                                  text: item['name']!,
                                  style: appStyle(16, kOffWhite, FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    ReusableText(
                                      text: item['description']!,
                                      style: appStyle(12, kOffWhite, FontWeight.normal),
                                    ),
                                    const SizedBox(width: 10),
                                    ReusableText(
                                  text: "𐂐${item['location']}",
                                  style: appStyle(12, kOffWhite, FontWeight.normal),
                                ),
                                  ],
                                ),
                                ReusableText(
                                  text: item['date']!,
                                  style: appStyle(12, kOffWhite, FontWeight.normal),
                                ),
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildPageItem(int index,List<dynamic> LatestHackathons) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == currpageValue.floor()) {
      var curr_scale = 1 - (currpageValue - index) * (1 - _scalefactor);
      var currTrans = (1 - curr_scale) * _height / 2;
      matrix = Matrix4.diagonal3Values(1, curr_scale, 1)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == currpageValue.floor() + 1) {
      var curr_scale =
          _scalefactor + (currpageValue - index + 1) * (1 - _scalefactor);
      var currTrans = (1 - curr_scale) * _height / 2;
      matrix = Matrix4.diagonal3Values(1, curr_scale, 1);
      matrix = Matrix4.diagonal3Values(1, curr_scale, 1)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else if (index == currpageValue.floor() - 1) {
      var curr_scale = 1 - (currpageValue - index) * (1 - _scalefactor);
      var currTrans = (1 - curr_scale) * _height / 2;
      matrix = Matrix4.diagonal3Values(1, curr_scale, 1);
      matrix = Matrix4.diagonal3Values(1, curr_scale, 1)
        ..setTranslationRaw(0.0, currTrans, 0.0);
    } else {
      var curr_scale = 0.8;
      matrix = Matrix4.diagonal3Values(1, curr_scale, 1)
        ..setTranslationRaw(0, _height * (1 - _scalefactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
             
            },
              child: Container(
                height: _height,
                margin: EdgeInsets.only(
                    left: 10.w, right: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: index.isEven ? Color.fromARGB(255, 42, 43, 43) : Color.fromARGB(255, 41, 37, 37),
                  image: DecorationImage(
                  image: AssetImage(LatestHackathons[index]['image']),
                  fit: BoxFit.cover,
                ),
                ),
              ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100.h,
              margin: EdgeInsets.only(
                  left: 30.w,
                  right: 30.w,
                  bottom: 30.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: kBackground,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: kBackground,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: kBackground,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: 15.h,
                    left: 15.w,
                    right: 15.w),
                child: AppColumn(
                  text: LatestHackathons[index]['name'],
                  location: LatestHackathons[index]['location'],
                  date: LatestHackathons[index]['date'],
                  type: LatestHackathons[index]['description'],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
