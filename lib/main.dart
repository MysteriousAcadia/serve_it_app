import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serveit/blocs/auth_bloc/auth_bloc.dart';
import 'package:serveit/pages/intro_page.dart';
import 'package:serveit/pages/onboarding_page.dart';
import 'service_locator.dart';

import 'login_page.dart';
import './pages/XDOnboarding1.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AuthBloc()..add(AppStartedEvent()),
        child: App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthInitial) {
        return OnboardingPage();
      } else if (state is AuthenticatedState) {
        return OnboardingPage();
      } else if (state is UnAuthenticated) {
        return IntroPage();
      }
    });
  }
}
