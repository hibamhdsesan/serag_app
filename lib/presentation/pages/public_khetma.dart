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
                                        child: Image.asset("images/star.png"),
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
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("تاريخ الانتهاء"),
                                            Text(khetma.endDate?.toString().split(" ")[0] ?? "-"),
                                            
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
                                            Text("تاريخ البدء"),
                                            Text(khetma.startDate?.toString().split(" ")[0] ?? "-"),
                                            
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
                        DropdownButtonFormField<String>(
                          value: selectedKhetmaValue.isEmpty ? null : selectedKhetmaValue,
                          decoration: InputDecoration(filled: true, fillColor: Colors.white),
                          items: AppTexts.khetmaList.map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, textAlign: TextAlign.right),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setModalState(() {
                              selectedKhetmaValue = value!;
                              thekrController.text = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        Text("مدة الختمة", style: TextStyle(color: Colors.white, fontSize: 18)),
                        TextField(
                          controller: dateRangeController,
                          readOnly: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          onTap: () async {
                            final range = await showDateRangePicker(
                              context: context,
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2030),
                            );
                            if (range != null) {
                              setModalState(() {
                                startDate = range.start;
                                endDate = range.end;
                                dateRangeController.text =
                                    '${startDate!.day}/${startDate!.month}/${startDate!.year} إلى ${endDate!.day}/${endDate!.month}/${endDate!.year}';
                              });
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                                ),
                              ],
                            ),
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
                          child: Text("إضافة"),
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
