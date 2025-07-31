import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serag_app/core/constants/app_colors.dart';
import 'package:serag_app/core/constants/app_texts.dart';
import 'package:serag_app/presentation/pages/khetma.dart';
import 'package:serag_app/presentation/pages/public_khetma.dart';
import 'package:serag_app/presentation/pages/public_thekr.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showTasbeehOptions = false;
  bool showKhatmahOptions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfffbcb8f),
              Color(0xfffbcb8f),
              Color(0xffe9894d),
              Color(0xfff1ae63),
              Color(0xff9d6a63),
              Color(0xff372527),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 110, top: 23),
                    child: Image(image: AssetImage("images/floral.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      AppTexts.appName,
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 114, top: 23),
                    child: Image(image: AssetImage("images/floral2.png")),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16, top: 56),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      width: 309.w,
                      height: 151.h,
                      decoration: BoxDecoration(color: AppColors.box),
                      child: Center(
                        child: Text(
                          AppTexts.homePageText,
                          textAlign: TextAlign.center,
                          maxLines: 4,
                          overflow: TextOverflow.visible,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -35,
                    right: -10,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 22),
                      child: Image(image: AssetImage("images/star.png")),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 348.w,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              setState(() {
                                showTasbeehOptions = !showTasbeehOptions;
                                showKhatmahOptions = false;
                              });
                            },
                            child: buildMainCircle("images/beads.png", "تسبيح"),
                          ),
                          if (showTasbeehOptions) ...[
                            SizedBox(height: 8.h),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => ThekrPAge()),
                                );
                              },
                              child: buildMainCircle("images/beads.png", "جلسة ذكر"),
                            ),
                            SizedBox(height: 8.h),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => ThekrPAge()),
                                );
                              },
                              child: buildMainCircle("images/beads.png", "مسابقة ذكر"),
                            ),
                          ],
                        ],
                      ),

                      buildMainCircle("images/quran.png", "سورة"),

                      Column(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              setState(() {
                                showKhatmahOptions = !showKhatmahOptions;
                                showTasbeehOptions = false;
                              });
                            },
                            child: buildMainCircle("images/series.png", "ختمة"),
                          ),
                          if (showKhatmahOptions) ...[
                            SizedBox(height: 8.h),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => KhetmaPAge()),
                                );
                              },
                              child: buildMainCircle("images/series.png", "ختمة خاصة"),
                            ),
                            SizedBox(height: 8.h),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => PublicKhetmaPage()),
                                );
                              },
                              child: buildMainCircle("images/series.png", "ختمة عامة"),
                            ),
                          ],
                        ],
                      ),
                  
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMainCircle(String imagePath, String text) {
    return Container(
      width: 100.w,
      height: 96.h,
      decoration: BoxDecoration(
        color: AppColors.box,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 40.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 4.h),
          Text(
            text,
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
