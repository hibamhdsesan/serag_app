import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serag_app/core/constants/app_colors.dart';
import 'package:serag_app/core/constants/app_texts.dart';
import 'package:serag_app/model/khetma.dart';
import 'package:serag_app/model/privateKhetma.dart';
import 'package:serag_app/presentation/pages/privateKhetma.dart';
import 'package:serag_app/service/privateKhetma.dart';

final khetmaListProvider = FutureProvider<List<KhetmaModel>>((ref) async {
  final service = KhetmaService();
  return await service.fetchKhetmas();
});

class KhetmaPAge extends ConsumerStatefulWidget {
  const KhetmaPAge({super.key});

  @override
  ConsumerState<KhetmaPAge> createState() => _KhetmaPAgeState();
}

class _KhetmaPAgeState extends ConsumerState<KhetmaPAge> {
  String selectedKhetmaValue = "";
  DateTime? startDate;
  DateTime? endDate;
  String selectedType = "";

  final TextEditingController thekrController = TextEditingController();
  final TextEditingController dateRangeController = TextEditingController();

  @override
  void dispose() {
    thekrController.dispose();
    dateRangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final khetmaAsyncValue = ref.watch(khetmaListProvider);

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
                    child: Text(" الختمات", style: TextStyle(color: Colors.black, fontSize: 30)),
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
                child: khetmaAsyncValue.when(
                  data: (khetmas) => ListView.builder(
                    itemCount: khetmas.length,
                    itemBuilder: ((context, index) {
                      final khetma = khetmas[index];
                      return GestureDetector(
                        onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrivateKhetma(
          purpose: khetma.purpose,
          khetmaId: khetma.id, 
        ),
      ),
    );
  },
                        child: Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("تاريخ الانتهاء"),
                                          Text(khetma.endDate?.toString().split(" ")[0] ?? "-"),
                                          Text("النوع"),
                                          Text(khetma.type),
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
                                          Text(khetma.startDate?.toString().split(" ")[0] ?? "-"),
                                          Text("تاريخ الإنشاء"),
                                          Text(khetma.createdAt.toString().split(" ")[0]),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (err, _) => Center(child: Text("حدث خطأ أثناء تحميل الختمات")),
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
                          onPressed: () async {
                            if (selectedKhetmaValue.isEmpty || startDate == null || endDate == null || selectedType.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("الرجاء تعبئة كل الحقول")),
                              );
                              return;
                            }

                            final khetma = KhetmaModel(
                              id: DateTime.now().microsecondsSinceEpoch,
                              purpose: selectedKhetmaValue,
                              type: selectedType,
                              createdAt: DateTime.now(),
                              startDate: startDate,
                              endDate: endDate,
                            );
                            final service = KhetmaService();
                            await service.addKhetma(khetma);
                            final parts = List.generate(30, (index) {
  return PrivateKhetmaModel(
    id: DateTime.now().microsecondsSinceEpoch + index,
    khetmaId: khetma.id,
    partNumber: index + 1,
    isRead: false,
    createdAt: DateTime.now(),
  );
});
await service.addPrivateParts(parts);

                            Navigator.pop(context);
                            ref.invalidate(khetmaListProvider);
                          },
                          child: Text("إضافة"),
                          style: ElevatedButton.styleFrom(minimumSize: Size(296, 44),backgroundColor: AppColors.box),
                        ),
                      ],
                    ),
                  ),
              ),);
              },
          );
        },
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
