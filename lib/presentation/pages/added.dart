import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serag_app/core/constants/app_colors.dart';
import 'package:serag_app/core/constants/app_texts.dart';

class AddedPAge extends StatefulWidget {
   final String thekrType;
  final DateTime startDate;
  final DateTime endDate;
  final int targetCount;
  const AddedPAge({super.key, required this.thekrType,
    required this.startDate,
    required this.endDate,
    required this.targetCount,});

  @override
  State<AddedPAge> createState() => _AddedPAgeState();
}

class _AddedPAgeState extends State<AddedPAge> {
  TextEditingController personCountController = TextEditingController();
  TextEditingController personNamesController = TextEditingController();
  bool isChecked = false;
  int selectedCount = 0;

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
        child: SingleChildScrollView(
          child: Container(
                height: MediaQuery.of(context).size.height,

            child: Column(
              children: [
                SafeArea(
  child: Container(
    height: 80.h, 
    child: Stack(
      children: [
        
        Positioned(
          left: 0,
          top: 25,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.textButton),
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
                  style: TextStyle(color: Colors.black, fontSize: 30),
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
                  padding: const EdgeInsets.only(top: 74, left: 18, right: 19),
                  child: Container(
                    width: 323.w,
                    height: 608.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 33,right: 25),
                            child: Text(
                              "عدد الأشخاص",
                              style: TextStyle(color: AppColors.textTherdly, fontSize: 15.sp),
                            ),
                          
                        ),
                        SizedBox(height: 20.h,),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Container(
                            width: 258.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff9d9d9d),
                            ),
                            child: TextField(
                              readOnly: false,
                              controller: personCountController,
                              decoration: InputDecoration(
                          
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25.h,),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Text(
                            " أسماء المشتركين",
                            style: TextStyle(color: AppColors.textTherdly, fontSize: 15.sp),
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Container(
                            width: 258.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff9d9d9d),
                            ),
                            child: TextField(
                              readOnly: false,
                              controller: personNamesController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 29.h,),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Text(
                            " عدد الأجزاء لكل شخص",
                            style: TextStyle(color: AppColors.textTherdly, fontSize: 15.sp),
                          ),
                        ),
            
            Padding(
              padding: const EdgeInsets.only(right: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   Text(
                    "1",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  
                  Checkbox(
                    value: selectedCount == 1,
                    onChanged: (val) {
                      setState(() {
                        selectedCount = 1;
                      });
                    },
                    checkColor: AppColors.box,
                    fillColor: MaterialStateProperty.all(Color(0xff9d9d9d)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   Text(
                    "2",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  
                  Checkbox(
                    value: selectedCount == 2,
                    onChanged: (val) {
                      setState(() {
                        selectedCount = 2;
                      });
                    },
                    checkColor: AppColors.box,
                    fillColor: MaterialStateProperty.all(Color(0xff9d9d9d)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  
                  Checkbox(
                    value: selectedCount == 3,
                    onChanged: (val) {
                      setState(() {
                        selectedCount = 3;
                      });
                    },
                    checkColor: AppColors.box,
                    fillColor: MaterialStateProperty.all(Color(0xff9d9d9d)),
                  ),
                ],
              ),
            ),

            
                
                SizedBox(height: 20),
               
                        Padding(
                          padding: const EdgeInsets.only(right: 33),
                          child: Container(
                            width: 257.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.box,
                            ),
                            child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.share,color: AppColors.textButton,),
                      Text("إنشاء و مشاركة",style: TextStyle(color: AppColors.textButton,fontSize: 25.sp),),
                    ],
                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}