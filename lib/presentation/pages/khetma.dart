import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serag_app/core/constants/app_colors.dart';
import 'package:serag_app/core/constants/app_texts.dart';
import 'package:serag_app/presentation/pages/privateKhetma.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/material.dart' show MaterialStateProperty;


class KhetmaPAge extends StatefulWidget {
  const KhetmaPAge({super.key});

  @override
  State<KhetmaPAge> createState() => _KhetmaPAgeState();
}

class _KhetmaPAgeState extends State<KhetmaPAge> {
  String selectedThekrValue = "";
 DateTime? startDate;
 DateTime? endDate;
//  double currentValue = 0;
//  final TextEditingController targetCountController = TextEditingController();
  String selectedType="";


   final TextEditingController thekrController = TextEditingController();
  final TextEditingController dateRangeController = TextEditingController();

  @override
  void dispose() {
    thekrController.dispose();
    dateRangeController.dispose();
    super.dispose();
  }

  @override
void initState() {
  super.initState();
  // targetCountController.text = currentValue.round().toString();
}


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
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text(
                      " الختمات",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
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
                      decoration: BoxDecoration(color: AppColors.box,
                      borderRadius: BorderRadius.circular(10)),
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
                                      "  ختمة بنية الشفاء",
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
    borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
  ),
  isScrollControlled: true,
  builder: (context) {
    // double localCurrentValue = currentValue;   

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setModalState) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: 500.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text("النية", style: TextStyle(color: Colors.white, fontSize: 18)),
                SizedBox(height: 10),
                Container(
                  width: 266,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedThekrValue.isEmpty ? null : selectedThekrValue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.arrow_drop_down),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                    items: AppTexts.khetmaList.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item, textAlign: TextAlign.right),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setModalState(() {
                        selectedThekrValue = value!;
                        thekrController.text = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text("مدة الختمة", style: TextStyle(color: Colors.white, fontSize: 18)),
                SizedBox(height: 10),
                Container(
                  width: 266,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: dateRangeController,
                    readOnly: true,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: InkWell(
                        onTap: () async {
                          final pickedRange = await showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2030),
                          );
                          if (pickedRange != null) {
                            setModalState(() {
                              startDate = pickedRange.start;
                              endDate = pickedRange.end;
                              dateRangeController.text =
                                  '${startDate!.day}/${startDate!.month}/${startDate!.year} إلى ${endDate!.day}/${endDate!.month}/${endDate!.year}';
                            });
                          }
                        },
                        child: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                 
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      children: [
        Text("فجرية", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
        Checkbox(
          value: selectedType == "فجرية",
          onChanged: (value) {
            setModalState(() {
              selectedType = value! ? "فجرية" : "عادية";
            });
          },
          checkColor: AppColors.box,
          fillColor: MaterialStateProperty.all(Colors.white),
        ),
      ],
    ),
    Row(
      children: [
        Text("ذات أولوية", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
        Checkbox(
          value: selectedType == "ذات أولوية",
          onChanged: (value) {
            setModalState(() {
              selectedType = value! ? "ذات أولوية" : "عادية";
            });
          },
          checkColor: AppColors.primary,
          fillColor: MaterialStateProperty.all(Colors.white),
        ),
      ],
    ),
  ],
),
                SizedBox(height: 26.h,),

                 Container(
                  width: 123.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff7D6358),
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.share,color: Colors.white,),
                      Text("مشاركة",style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                    ],
                  ),
                ),
                SizedBox(height: 26.h,),

                GestureDetector(
                  onTap: (){
                    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => PrivateKhetma(
      purpose: selectedThekrValue,
      startDate: startDate!,
      endDate: endDate!,
      type: selectedType, 
    ),
  ),
);

                  },
                  child: Container(
                    width: 296.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.box,
                    ),
                    child: Center(child: Text("إضافة",style: TextStyle(color: AppColors.textButton,fontSize: 25.sp),),),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
