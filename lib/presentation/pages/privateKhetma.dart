import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serag_app/core/constants/app_colors.dart';
import 'package:serag_app/core/constants/app_texts.dart';

class PrivateKhetma extends StatefulWidget {
  const PrivateKhetma({super.key});

  @override
  State<PrivateKhetma> createState() => _PrivateKhetmaState();
}

class _PrivateKhetmaState extends State<PrivateKhetma> {
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 80.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 10,
                      child: IconButton(
                        icon:
                            Icon(Icons.arrow_back, color: AppColors.textButton),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Image.asset("images/floral.png"),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Text(
                              AppTexts.appName,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            ),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Image.asset("images/floral2.png"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 41),
              child:Stack(
  clipBehavior: Clip.none,
  children: [
    Container(
      width: 311.w,
      height: 63.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.box,
      ),
      child: Center(
        child: Text(
          "ختمة بنية الشفاء",
          style: TextStyle(
            color: AppColors.textButton,
            fontSize: 25.sp,
          ),
        ),
      ),
    ),
    Positioned(
      top: -13,    
      right: -16,
      child: Container(
        height: 90.h, 
        width: 90.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/star.png"),
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,),
              child: SizedBox(
                  height: 490.h,
                  child: GridView.builder(
                    itemCount: 30,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return
                        GestureDetector(
                          child: Container(
                            height:65.h ,
                            width:55.w ,
                            decoration: BoxDecoration(
                              color:Color(0xfffffdc3) ,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text("${index+1}",style: TextStyle(
                                fontSize: 25.sp,color: AppColors.textPrimary
                              ),),
                            ),
                          ),
                        );
                      }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
