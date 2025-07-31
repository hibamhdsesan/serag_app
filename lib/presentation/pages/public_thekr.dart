import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serag_app/bloc/bloc/public_thekr_bloc.dart';
import 'package:serag_app/core/constants/app_colors.dart';
import 'package:serag_app/core/constants/app_texts.dart';
import 'package:serag_app/presentation/pages/added.dart';
class ThekrPAge extends StatefulWidget {
  const ThekrPAge({super.key});

  @override
  State<ThekrPAge> createState() => _ThekrPAgeState();
}

class _ThekrPAgeState extends State<ThekrPAge> {
  String selectedThekrValue = "";
  DateTime? startDate;
  DateTime? endDate;
  double currentValue = 0;
  final TextEditingController targetCountController = TextEditingController();

  final TextEditingController thekrController = TextEditingController();
  final TextEditingController dateRangeController = TextEditingController();

  @override
  void dispose() {
    thekrController.dispose();
    dateRangeController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  void initState() {
    super.initState();
    targetCountController.text = currentValue.round().toString();
    context.read<PublicThekrBloc>().add(FetchthekrEvent());
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
                      "جلسات الذكر",
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
                    child: BlocBuilder<PublicThekrBloc, PublicThekrState>(
                      builder: (context, state) {
                        if (state is PublicThekrLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is publicThekrLoaded) {
                          final thekrList = state.thekrList;

                          return ListView.builder(
                            itemCount: thekrList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 24.h),
                                width: 309.w,
                                height: 214.h,
                                decoration: BoxDecoration(
                                  color: AppColors.box,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 102.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                thekrList[index].thekrType!,
                                                style:
                                                    TextStyle(fontSize: 25.sp),
                                              ),
                                            ),
                                          ),
                                         Padding(
  padding: EdgeInsets.only(top: 15, right: 5),
  child: Stack(
    alignment: Alignment.center,
    children: [
      Image.asset("images/star.png",width: 90, 
        height: 90,
        fit: BoxFit.cover,),
      Column(
        mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'جلسة',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,  
              shadows: [
                Shadow(
                  blurRadius: 3,
                  color: Colors.black54,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
          Text(
            thekrList[index].id.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              shadows: [
                Shadow(
                  blurRadius: 3,
                  color: Colors.black54,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Divider(
                                        height: 1.h,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 16),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("تاريخ الانتهاء",style: TextStyle(fontWeight: FontWeight.bold),),
                                                Text(_formatDate(
                                                    thekrList[index].endDate),style: TextStyle(color: Color(0xfff1ae63)),),
                                                Text("المفروض",style: TextStyle(fontWeight: FontWeight.bold),),
                                                Text(thekrList[index]
                                                    .targetCount
                                                    .toString(),style: TextStyle(color: Color(0xfff1ae63)),),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 9),
                                            child: Image.asset(
                                                "images/floral8.png"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("تاريخ البدء",style: TextStyle(fontWeight: FontWeight.bold),),
                                                Text(_formatDate(
                                                    thekrList[index].endDate),style: TextStyle(color: Color(0xfff1ae63)),),
                                                Text("المنجز",style: TextStyle(fontWeight: FontWeight.bold),),
                                                Text(thekrList[index]
                                                    .completedCount
                                                    .toString(),style: TextStyle(color: Color(0xfff1ae63)),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else if (state is publicThekrError) {
                          return Center(child: Text(state.message));
                        } else {
                          return Center(child: Text("لا توجد بيانات"));
                        }
                      },
                    ))),
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
                        double localCurrentValue = currentValue;

                        return StatefulBuilder(
                          builder: (BuildContext context,
                              StateSetter setModalState) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
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
                                    Text("الذكر",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 266,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: DropdownButtonFormField<String>(
                                        value: selectedThekrValue.isEmpty
                                            ? null
                                            : selectedThekrValue,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          prefixIcon:
                                              Icon(Icons.arrow_drop_down),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12),
                                        ),
                                        items: AppTexts.theckeList.map((item) {
                                          return DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item,
                                                textAlign: TextAlign.right),
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
                                    Text("مدة الختمة",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 266,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child:

 TextField(
  controller: dateRangeController,
  readOnly: true,
   textAlign: TextAlign.center,
  decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white,
    suffixIcon: Icon(Icons.calendar_today), 
  ),
  onTap: () async {
    final range = await showDialog<DateTimeRange>(
      context: context,
      builder: (context) {
        return Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.75,
            child: Material(
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: DateRangePickerDialog(
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2030),
                  initialDateRange: startDate != null && endDate != null
                      ? DateTimeRange(start: startDate!, end: endDate!)
                      : null,
                ),
              ),
            ),
          ),
        );
      },
    );

    if (range != null) {
      setModalState(() {
        startDate = range.start;
        endDate = range.end;
        dateRangeController.text =
            '${startDate!.day}-${startDate!.month}-${startDate!.year} | '
            '${endDate!.day}-${endDate!.month}-${endDate!.year}'; 
      });
    }
  },
),

                        
                                    ),


                                    SizedBox(height: 20),
                                    Text("العدد المفروض",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                   
                                    SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: AppColors.box,
                                        thumbColor: Color(0xff877e7f),
                                         //overlayColor :Colors.black.withOpacity(0.1),
                                        showValueIndicator:
                                            ShowValueIndicator.always,
                                        valueIndicatorShape:
                                            PaddleSliderValueIndicatorShape(),
                                        valueIndicatorTextStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                        thumbShape: RoundSliderThumbShape(
                                            enabledThumbRadius: 10),
                                        overlayShape: RoundSliderOverlayShape(
                                            overlayRadius: 18),
                                      ),
                                      child: Slider(
                                        value: localCurrentValue,
                                        min: 0,
                                        max: 100000,
                                        divisions: 1000,
                                        label: localCurrentValue
                                            .round()
                                            .toString(),
                                        onChanged: (value) {
                                          setModalState(() {
                                            localCurrentValue = value;
                                            currentValue = value;
                                            targetCountController.text =
                                                value.round().toString();
                                          });
                                        },
                                      ),
                                    ),
                                   
                                   
                                    SizedBox(
                                      height: 26.h,
                                    ),
                                    Container(
                                      width: 123.w,
                                      height: 28.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xff7D6358),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.share,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "مشاركة",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 26.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddedPAge(thekrType: selectedThekrValue,
      startDate: startDate!,
      endDate: endDate!,
      targetCount: currentValue.toInt(),)),
                                                    ).then((_) {context.read<PublicThekrBloc>().add(FetchthekrEvent());});              

                                      },
                                      child: Container(
                                        width: 296.w,
                                        height: 42.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.box,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "إضافة",
                                            style: TextStyle(
                                                color: AppColors.textButton,
                                                fontSize: 25.sp),
                                          ),
                                        ),
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







// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:serag_app/core/constants/app_colors.dart';
// import 'package:serag_app/model/thekr.dart';
// import 'package:serag_app/service/publicThekr.dart';

// class ThekrPAge extends StatelessWidget {
//   const ThekrPAge({super.key});

//   String _formatDate(DateTime? date) {
//     if (date == null) return "--/--/----";
//     return "${date.day}/${date.month}/${date.year}";
//   }

//   @override
//   Widget build(BuildContext context) {
//     final thekrService = ThekrService(); // 👈 عملنا instance مباشر

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xfffbcb8f),
//               Color(0xfffbcb8f),
//               Color(0xffe9894d),
//               Color(0xfff1ae63),
//               Color(0xff9d6a63),
//               Color(0xff372527),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             SafeArea(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 23),
//                     child: Image.asset("images/floral.png"),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 18),
//                     child: Text(
//                       "جلسات الذكر",
//                       style: TextStyle(color: Colors.black, fontSize: 30),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 23),
//                     child: Image.asset("images/floral2.png"),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: FutureBuilder<List<ThekrModel>>(
//                   future: thekrService.fetchThekrList(), // 👈 بدون تخزين مسبق
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (snapshot.hasError) {
//                       return const Center(child: Text("حدث خطأ أثناء جلب البيانات"));
//                     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                       return const Center(child: Text("لا توجد أذكار بعد"));
//                     }

//                     final azkar = snapshot.data!;

//                     return ListView.builder(
//                       itemCount: azkar.length,
//                       itemBuilder: (context, index) {
//                         final thekr = azkar[index];
//                         return Container(
//                           margin: EdgeInsets.only(bottom: 24.h),
//                           width: 309.w,
//                           height: 214.h,
//                           decoration: BoxDecoration(
//                             color: AppColors.box,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 102.h,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Expanded(
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           thekr.thekrType ?? "غير معروف",
//                                           style: TextStyle(fontSize: 25.sp),
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 9, right: 5),
//                                       child: Image.asset("images/star.png"),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                                 child: Divider(
//                                   height: 1.h,
//                                   color: AppColors.textPrimary,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 16),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           const Text("تاريخ الانتهاء"),
//                                           Text(_formatDate(thekr.endDate)),
//                                           const Text("المفروض"),
//                                           Text("${thekr.targetCount ?? 0}"),
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 9),
//                                       child: Image.asset("images/floral8.png"),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 25),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           const Text("تاريخ البدء"),
//                                           Text(_formatDate(thekr.startDate)),
//                                           const Text("المنجز"),
//                                           Text("${thekr.completedCount ?? 0}"),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
