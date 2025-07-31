import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serag_app/bloc/bloc/public_khetma_bloc.dart';
import 'package:serag_app/bloc/bloc/public_thekr_bloc.dart';
import 'package:serag_app/presentation/pages/added.dart';
import 'package:serag_app/presentation/pages/home.dart';
import 'package:serag_app/presentation/pages/khetma.dart';
import 'package:serag_app/presentation/pages/privateKhetma.dart';
import 'package:serag_app/presentation/pages/public_khetma.dart';
import 'package:serag_app/presentation/pages/splash.dart';
import 'package:serag_app/presentation/pages/public_thekr.dart';
import 'package:serag_app/presentation/pages/test.dart';
import 'package:serag_app/service/notification_service.dart';
import 'package:serag_app/service/publicKhtma.dart';
import 'package:serag_app/service/publicThekr.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dotenv.load();
//   await Supabase.initialize(
//     url: dotenv.env['PROJECT_URL']!,
//     anonKey: dotenv.env['API_KEY']!,
//   );

//     final thekrService = ThekrService(); 

//   runApp(
//   MultiBlocProvider(
//     providers: [
//       BlocProvider(create: (_) => PublicThekrBloc(thekrService)..add(FetchthekrEvent())),
//     ],
//     child: const MyApp(),
//   ),
// );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.env['PROJECT_URL']!,
    anonKey: dotenv.env['API_KEY']!,
  );
  
await NotificationService().init();
  final thekrService = ThekrService();
  final service = PublicKhetmaService();

  void checkAndCancelAfter30Days(int notificationId, DateTime createdAt) {
  final now = DateTime.now();
  final difference = now.difference(createdAt).inDays;

  if (difference >= 30) {
    NotificationService().cancelNotification(notificationId);
  }
}


  runApp(
    ProviderScope(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => PublicThekrBloc(thekrService)..add(FetchthekrEvent()),
          ),
            BlocProvider(
      create: (_) => PublicKhetmaBloc(service)..add(FetchKhetmaEvent()),
    ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          home: SplashScreen(),
        );
      },
    );
  }
}
