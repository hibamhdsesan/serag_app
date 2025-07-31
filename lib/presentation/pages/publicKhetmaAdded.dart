import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serag_app/bloc/bloc/public_khetma_bloc.dart';
import 'package:serag_app/core/constants/app_colors.dart';
import 'package:serag_app/core/constants/app_texts.dart';
import 'package:serag_app/model/publicKhtma.dart';
import 'package:share_plus/share_plus.dart';

class AddedPublicKhetmaPage extends StatefulWidget {
  final String type;
  final DateTime startDate;
  final DateTime endDate;
  final String purpose;

  const AddedPublicKhetmaPage({
    super.key,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.purpose,
  });

  @override
  State<AddedPublicKhetmaPage> createState() => _AddedPublicKhetmaPageState();
}

class _AddedPublicKhetmaPageState extends State<AddedPublicKhetmaPage> {
  TextEditingController personCountController = TextEditingController();
  TextEditingController personNamesController = TextEditingController();

  int? selectedCount; 

  @override
  void dispose() {
    personCountController.dispose();
    personNamesController.dispose();
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
                    height: 580.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // عدد الأشخاص
                        Padding(
                          padding: const EdgeInsets.only(top: 33, right: 25),
                          child: Text(
                            "عدد الأشخاص",
                            style: TextStyle(color: AppColors.textTherdly, fontSize: 15.sp),
                          ),
                        ),
                        SizedBox(height: 20.h),
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
                              textAlign: TextAlign.end,
                              keyboardType: TextInputType.number,
                              controller: personCountController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 25.h),

                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Text(
                            "أسماء المشتركين",
                            style: TextStyle(color: AppColors.textTherdly, fontSize: 15.sp),
                          ),
                        ),
                        SizedBox(height: 20.h),
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
                              maxLines: null,
                              textAlign: TextAlign.end,
                              controller: personNamesController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 25.h),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Text(
                            "عدد الأجزاء لكل شخص",
                            style: TextStyle(color: AppColors.textTherdly, fontSize: 15.sp),
                          ),
                        ),
                        SizedBox(height: 10.h),

                        ...List.generate(3, (index) {
                          int count = index + 1;
                          return Padding(
                            padding: const EdgeInsets.only(right: 23, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "$count",
                                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                                ),
                                Checkbox(
                                  value: selectedCount == count,
                                  onChanged: (val) {
                                    setState(() {
                                      selectedCount = count;
                                    });
                                  },
                                  checkColor: AppColors.box,
                                  fillColor: MaterialStateProperty.all(Color(0xff9d9d9d)),
                                ),
                              ],
                            ),
                          );
                        }),

                        SizedBox(height: 29.h),

                        Padding(
                          padding: const EdgeInsets.only(right: 33),
                          child: BlocListener<PublicKhetmaBloc, PublicKhetmaState>(
                            listener: (context, state) async {
                              if (state is PublicKhetmaAdded) {
                                final names = personNamesController.text
                                    .split(',')
                                    .map((e) => e.trim())
                                    .where((e) => e.isNotEmpty)
                                    .toList();

                                final parts = selectedCount ?? 0;

                                final message = names
                                    .map((name) => "$name - $parts جزء")
                                    .join("\n");

                                await Share.share(
                                  message,
                                  subject: 'تفاصيل الختمة',
                                );
                              } else if (state is PublicKhetmaError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("فشل في إضافة الختمة")),
                                );
                              }
                            },
                            child: GestureDetector(
                              onTap: () {
                                final names = personNamesController.text
                                    .split(',')
                                    .map((e) => e.trim())
                                    .where((e) => e.isNotEmpty)
                                    .toList();

                                final count = int.tryParse(personCountController.text) ?? 0;
                                final parts = selectedCount ?? 0;

                                if (count == 0 || parts == 0 || names.length != count) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("تأكد من إدخال عدد صحيح من الأشخاص، اختيار عدد الأجزاء، والأسماء")),
                                  );
                                  return;
                                }

                                for (String name in names) {
                                  final khetma = PublicKhetmaModel(
                                    purpose: widget.purpose,
                                    type: widget.type,
                                    createdAt: DateTime.now(),
                                    startDate: widget.startDate,
                                    endDate: widget.endDate,
                                    personCount: count,
                                    personName: name,
                                    numberOfParts: parts,
                                  );

                                  context.read<PublicKhetmaBloc>().add(AddKhetmaEvent(khetma));
                                }
                              },
                              child: Container(
                                width: 257.w,
                                height: 42.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.box,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.share, color: AppColors.textButton),
                                    Text(
                                      "إنشاء و مشاركة",
                                      style: TextStyle(color: AppColors.textButton, fontSize: 25.sp),
                                    ),
                                  ],
                                ),
                              ),
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
