import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serag_app/bloc/bloc/public_khetma_bloc.dart';
import 'package:serag_app/core/constants/app_colors.dart';
import 'package:serag_app/core/constants/app_texts.dart';
import 'package:serag_app/model/publicKhtma.dart';
import 'package:serag_app/presentation/pages/publicKhetmaAdded.dart';
import 'package:serag_app/service/privateKhetma.dart';
import 'package:serag_app/model/privateKhetma.dart';

class PublicKhetmaPage extends StatefulWidget {
  const PublicKhetmaPage({super.key});

  @override
  State<PublicKhetmaPage> createState() => _PublicKhetmaPageState();
}

class _PublicKhetmaPageState extends State<PublicKhetmaPage> {
  String selectedKhetmaValue = "";
  DateTime? startDate;
  DateTime? endDate;
  String selectedType = "";

  final TextEditingController thekrController = TextEditingController();
  final TextEditingController dateRangeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<PublicKhetmaBloc>().add(FetchKhetmaEvent());
  }

  @override
  void dispose() {
    thekrController.dispose();
    dateRangeController.dispose();
    super.dispose();
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Image.asset("images/floral.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text(" الختمات", style: TextStyle(color: Colors.black, fontSize: 30)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Image.asset("images/floral2.png"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: BlocBuilder<PublicKhetmaBloc, PublicKhetmaState>(
                  builder: (context, state) {
                    if (state is PublicKhetmaLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is PublicKhetmaLoaded) {
                      return ListView.builder(
                        itemCount: state.khetmaList.length,
                        itemBuilder: (context, index) {
                          final khetma = state.khetmaList[index];
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
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "  ${khetma.purpose}",
                                            style: TextStyle(fontSize: 25.sp),
                                          ),
                                        ),
                                      ),
                                     
                                   Padding(
  padding: EdgeInsets.only(top: 9, right: 5),
  child: Stack(
    alignment: Alignment.center,
    children: [
      Image.asset(
        "images/star.png",
        width: 90, 
        height: 90,
        fit: BoxFit.cover,
      ),
      Column(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'ختمة',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 2,
                  color: Colors.black,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
          Text(
            khetma.id.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              shadows: [
                Shadow(
                  blurRadius: 2,
                  color: Colors.black,
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
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Divider(height: 1.h, color: AppColors.textPrimary),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("تاريخ الانتهاء",style: TextStyle(fontWeight: FontWeight.bold),),
Text(
  khetma.endDate != null
      ? '${khetma.startDate!.day}\\${khetma.startDate!.month}\\${khetma.startDate!.year}'
      : '-',
style: TextStyle(color: Color(0xfff1ae63)),),                                            
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
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("تاريخ البدء",style: TextStyle(fontWeight: FontWeight.bold),),
Text(
  khetma.startDate != null
      ? '${khetma.startDate!.day}\\${khetma.startDate!.month}\\${khetma.startDate!.year}'
      : '-',
style: TextStyle(color: Color(0xfff1ae63)),),
                                            
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else if (state is PublicKhetmaError) {
                      return Center(child: Text(state.message));
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setModalState) => Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    height: 500.h,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    child: Column(
                      children: [
                        Text("النية", style: TextStyle(color: Colors.white, fontSize: 18)),
                        SizedBox(height: 10),

                       Container(
                        width: 266,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: AppColors.box,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                         child: Directionality(
                           textDirection: TextDirection.rtl,
                           child: DropdownButtonFormField<String>(
                             value: selectedKhetmaValue.isEmpty ? null : selectedKhetmaValue,
                             icon: SizedBox.shrink(), 
                             decoration: InputDecoration(
                               filled: true,
                               fillColor: Colors.white,
                               suffixIcon: Icon(Icons.arrow_drop_down), 
                             ),
                             items: AppTexts.khetmaList.map((item) {
                               return DropdownMenuItem<String>(
                                 value: item,
                                 child: Text(
                                   item,
                                   textAlign: TextAlign.right,
                                 ),
                               );
                             }).toList(),
                             onChanged: (value) {
                               setModalState(() {
                                 selectedKhetmaValue = value!;
                                 thekrController.text = value;
                               });
                             },
                           ),
                         ),
                       ),

                        SizedBox(height: 20),
                        Text("مدة الختمة", style: TextStyle(color: Colors.white, fontSize: 18)),
                      Container(
                        width: 266,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: AppColors.box,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                        child: TextField(
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
                                    '${endDate!.day}-${endDate!.month}-${endDate!.year}'; // ✅ الشكل المطلوب
                              });
                            }
                          },
                        ),
                      ),

                        SizedBox(height: 20),

                        
                        Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Row(
      children: [
        Text("ذات أولوية", style: TextStyle(color: Colors.white)),
        Checkbox(
          value: selectedType == "ذات أولوية",
          onChanged: (value) {
            setModalState(() {
              selectedType = value! ? "ذات أولوية" : "عادية";
            });
          },
          fillColor: MaterialStateProperty.all(Colors.white),
          checkColor: Colors.green, 
        ),
      ],
    ),
    Row(
      children: [
        Text("فجرية", style: TextStyle(color: Colors.white)),
        Checkbox(
          value: selectedType == "فجرية",
          onChanged: (value) {
            setModalState(() {
              selectedType = value! ? "فجرية" : "عادية";
            });
          },
          fillColor: MaterialStateProperty.all(Colors.white),
          checkColor: Colors.green,  
        ),
      ],
    ),
  ],
),

                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddedPublicKhetmaPage(
                                                      type:selectedType ,
                                                      startDate: startDate!,
                                                      endDate: endDate!,
                                                      purpose: selectedKhetmaValue,



                                                    )),
                                                    ).then((_) {context.read<PublicKhetmaBloc>().add(FetchKhetmaEvent());});              

                                      },
                          child: Text("إضافة",style: TextStyle(color: AppColors.textButton,fontSize: 25.sp),),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(296, 44),
                            backgroundColor: AppColors.box,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
