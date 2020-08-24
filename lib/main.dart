import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serveit/blocs/auth_bloc/auth_bloc.dart';
import 'package:serveit/blocs/reg_bloc/user_reg_bloc.dart';
import 'package:serveit/blocs/settings_bloc/settings_bloc_bloc.dart';
import 'package:serveit/first_page.dart';
import 'package:serveit/pages/basic_profile_page.dart';
import 'package:serveit/pages/intro_page.dart';
import 'package:serveit/pages/onboarding_in_page.dart';
import 'package:serveit/pages/onboarding_page.dart';
import 'package:serveit/pages/signin_page.dart';
import 'package:serveit/repositories/user_repository.dart';
import 'package:serveit/services/localstorage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  LocalStorageService localStorageService = locator<LocalStorageService>();

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    UserRepository userRepository = UserRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) =>
              AuthBloc(AuthInitial())..add(AppStartedEvent()),
        ),
        BlocProvider<SettingsBloc>(create: (BuildContext context) {
          SettingsBloc settingsBloc = SettingsBloc();
          settingsBloc.init(localStorageService);
          return settingsBloc;
        }),
        BlocProvider<UserRegBloc>(create: (c) {
          UserRegBloc na = UserRegBloc();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnboardingInPage();
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      // if (state is AuthInitial) {
      //   return OnboardingPage();
      // } else if (state is AuthenticatedState) {
      //   return FirstScreen();
      // } else if (state is UnAuthenticated) {
      //   return IntroPage();
      // }
      return OnboardingInPage();
    });
  }
}
