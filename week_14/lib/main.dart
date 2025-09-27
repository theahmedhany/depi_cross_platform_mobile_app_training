import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/theme_cubit.dart';
import 'features/cubits/auth/auth_cubit.dart';
import 'features/cubits/profile/profile_cubit.dart';
import 'features/cubits/users/users_cubit.dart';
import 'features/ui/auth/login_page.dart';
import 'features/ui/auth/signup_page.dart';
import 'features/ui/profile/complete_profile_page.dart';
import 'features/ui/profile/profile_page.dart';
import 'features/ui/users/users_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const NexaApp());
}

class NexaApp extends StatelessWidget {
  const NexaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
        BlocProvider<ProfileCubit>(create: (_) => ProfileCubit()),
        BlocProvider<UsersCubit>(create: (_) => UsersCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            builder: (context, child) {
              return MaterialApp(
                title: 'Nexa',
                theme: theme,
                debugShowCheckedModeBanner: false,
                initialRoute: '/login',
                routes: {
                  '/login': (context) => const LoginPage(),
                  '/signup': (context) => const SignupPage(),
                  '/complete-profile': (context) => const CompleteProfilePage(),
                  '/profile': (context) => const ProfilePage(),
                  '/users': (context) => const UsersPage(),
                },
              );
            },
          );
        },
      ),
    );
  }
}
