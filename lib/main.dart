import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serveit/blocs/auth_bloc/auth_bloc.dart';
import 'package:serveit/first_page.dart';
import 'package:serveit/pages/basic_profile_page.dart';
import 'package:serveit/pages/intro_page.dart';
import 'package:serveit/pages/onboarding_page.dart';
import 'package:serveit/pages/signin_page.dart';
import 'service_locator.dart';

void main() {
      WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(AuthInitial())..add(AppStartedEvent()),
        ),
      ],
      child: MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  App(),
    ));
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthInitial) {
        return OnboardingPage();
      } else if (state is AuthenticatedState) {
        return FirstScreen();
      } else if (state is UnAuthenticated) {
        return IntroPage();
      }
    });
  }
}
