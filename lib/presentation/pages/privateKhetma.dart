import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serag_app/core/constants/app_colors.dart';
import 'package:serag_app/core/constants/app_texts.dart';
import 'package:serag_app/model/privateKhetma.dart';
import 'package:serag_app/service/privateKhetma.dart';

class PrivateKhetma extends StatefulWidget {

  final String purpose;
  final int khetmaId;

  const PrivateKhetma({
    super.key,
    required this.purpose,
    required this.khetmaId,
  });

  @override
  State<PrivateKhetma> createState() => _PrivateKhetmaState();
}

class _PrivateKhetmaState extends State<PrivateKhetma> {
  late Future<List<PrivateKhetmaModel>> _partsFuture;
  final KhetmaService _service = KhetmaService();

  @override
  void initState() {
    super.initState();
    _partsFuture = _service.fetchPrivatePartsByKhetmaId(widget.khetmaId.toString());
  }

  Future<void> _markAsRead(int partId) async {
    await _service.markPartAsRead(partId);
    setState(() {
      _partsFuture = _service.fetchPrivatePartsByKhetmaId(widget.khetmaId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Text(
                              AppTexts.appName,
                              style: const TextStyle(color: Colors.black, fontSize: 30),
                            ),
                          ),
                          const SizedBox(width: 10),
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
              child: Stack(
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
                      child: Padding(
                        padding: const EdgeInsets.only(right: 35),
                        child: Text(
                          "ختمة بنية ${widget.purpose}",
                          style: TextStyle(
                            color: AppColors.textButton,
                            fontSize: 25.sp,
                          ),
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
                      decoration: const BoxDecoration(
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
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 14),
              child: FutureBuilder<List<PrivateKhetmaModel>>(
                future: _partsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("حدث خطأ أثناء تحميل الأجزاء"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("لا توجد أجزاء لهذه الختمة"));
                  }

                  final parts = snapshot.data!;

                  return SizedBox(
                    height: 490.h,
                    child: GridView.builder(
                      itemCount: parts.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final part = parts[index];
                        return GestureDetector(
                          onTap: () => _markAsRead(part.id),
                          child: Container(
                            height: 65.h,
                            width: 55.w,
                            decoration: BoxDecoration(
                              color: part.isRead ? Color(0xffd5d5d5) : const Color(0xfffffdc3),
                              borderRadius: BorderRadius.circular(10),
                            //r  border: part.isRead ? Border.all(color: Colors.green, width: 2) : null,
                            ),
                            child: Center(
                              child: Text(
                                "${part.partNumber}",
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

