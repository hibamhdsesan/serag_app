import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serag_app/core/constants/app_colors.dart';
import 'package:serag_app/core/constants/app_texts.dart';

class ThekrPAge extends StatefulWidget {
  const ThekrPAge({super.key});

  @override
  State<ThekrPAge> createState() => _ThekrPAgeState();
}

class _ThekrPAgeState extends State<ThekrPAge> {
  String selectedThekrValue = "";
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Image(image: AssetImage("images/floral.png")),
                  ),
                  Text(
                    "جلسات الذكر",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Image(image: AssetImage("images/floral2.png")),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 24.h),
                      width: 309.w,
                      height: 214.h,
                      decoration: BoxDecoration(color: AppColors.box),
                      child: Column(
                        children: [
                          Container(
                            height: 102.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "صلاة على النبي",
                                      style: TextStyle(fontSize: 25.sp),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 9, right: 5),
                                  child: Image.asset("images/star.png"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                              height: 1.h,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("تاريخ الانتهاء"),
                                    Text("dat3\1\2024"),
                                    Text("المفروض"),
                                    Text("10000"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: Image.asset("images/floral8.png"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("تاريخ البدء"),
                                    Text("3\3\2024"),
                                    Text("المنجز"),
                                    Text("200"),
                                  ],
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    );
                  })),
            )),
          ],
        ),
      ),
      floatingActionButton: Container(
          height: 59.h,
          width: 59.w,
          // alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                      isScrollControlled: true,
                      builder: (context) {
                        return FractionallySizedBox(
                          child: Container(
                            height: 434.h,
                             width: 365.w,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("الذكر",style: TextStyle(color: Colors.white),),
                                Container(
                                  width: 266.w,
                                  height:37.h ,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:BorderRadius.circular(10) 
                                  ),
                                  child: TextField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      prefixIcon: PopupMenuButton<String>(
                                        icon: Icon(Icons.arrow_drop_down),
                                        onSelected: (value){
                                          setState(() {
                                            selectedThekrValue=value;
                                          });
                                        },
                                        itemBuilder: (context) => AppTexts.theckeList.map((item) => PopupMenuItem(value: item,child: Text(item),)).toList(),
                                  
                                      )
                                    ),
                                    controller: TextEditingController(text:selectedThekrValue),
                                  ),
                                ),

                                Text("مدة الختمة",style: TextStyle(color: Colors.white),),
                                Container(
                                  width: 266.w,
                                  height:37.h ,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:BorderRadius.circular(10) 
                                  ),
                                  child: TextField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      prefixIcon: PopupMenuButton<String>(
                                        icon: Icon(Icons.arrow_drop_down),
                                        onSelected: (value){
                                          setState(() {
                                            selectedThekrValue=value;
                                          });
                                        },
                                        itemBuilder: (context) => AppTexts.theckeList.map((item) => PopupMenuItem(value: item,child: Text(item),)).toList(),
                                  
                                      )
                                    ),
                                    controller: TextEditingController(text:selectedThekrValue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  )))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
