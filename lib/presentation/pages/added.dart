import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serag_app/core/constants/app_colors.dart';
import 'package:serag_app/core/constants/app_texts.dart';

class AddedPAge extends StatefulWidget {
  const AddedPAge({super.key});

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
                  Text(
                    AppTexts.appName,
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 114, top: 23),
                    child: Image(image: AssetImage("images/floral2.png")),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 74, left: 18, right: 19,bottom: 18),
              child: Container(
                width: 323.w,
                height: 608.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "عدد الأشخاص",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                    Container(
                      width: 258.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.box,
                      ),
                      child: TextField(
                        readOnly: false,
                        controller: personCountController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Text(
                      " أسماء المشتركين",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                    Container(
                      width: 258.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.box,
                      ),
                      child: TextField(
                        readOnly: false,
                        controller: personNamesController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Text(
                      " عدد الأجزاء لكل شخص",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),

CheckboxListTile(
  title: Text("1"),
  value: selectedCount == 1,
  onChanged: (val) {
    setState(() {
      selectedCount = 1;
    });
  },
  controlAffinity: ListTileControlAffinity.trailing,   
  checkColor: AppColors.box,
  fillColor:MaterialStateProperty.all(Color(0xff9d9d9d)),  
),

            CheckboxListTile(
  title: Text("2"),
  value: selectedCount == 2,
  onChanged: (val) {
    setState(() {
      selectedCount = 2;
    });
  },
  controlAffinity: ListTileControlAffinity.trailing,
  checkColor: AppColors.box,
  fillColor:MaterialStateProperty.all(Color(0xff9d9d9d)),
),

CheckboxListTile(
  title: Text("3"),
  value: selectedCount == 3,
  onChanged: (val) {
    setState(() {
      selectedCount = 3;
    });
  },
  controlAffinity: ListTileControlAffinity.trailing, 
 checkColor: AppColors.box,
  fillColor:MaterialStateProperty.all(Color(0xff9d9d9d)),
),
            SizedBox(height: 20),
           
                    Container(
                      width: 296.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.box,
                      ),
                      child: Center(
                        child: Text(
                          "إضافة",
                          style: TextStyle(
                              color: AppColors.textButton, fontSize: 25.sp),
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
    );
  }
}
