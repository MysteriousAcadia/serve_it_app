import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serveit/blocs/auth_bloc/auth_bloc.dart';
import 'package:serveit/blocs/login_bloc/login_bloc.dart';
import 'package:serveit/blocs/profile_bloc/profile_bloc.dart';
import 'package:serveit/blocs/reg_bloc/user_reg_bloc.dart';
import 'package:serveit/blocs/settings_bloc/settings_bloc_bloc.dart';
import 'package:serveit/first_page.dart';
import 'package:serveit/pages/dashboard/home_page.dart' as HomePage;
import 'package:serveit/pages/onboard/basic_profile_page.dart';
import 'package:serveit/pages/intro_page.dart';
import 'package:serveit/pages/onboard/onboarding_in_page.dart';
import 'package:serveit/pages/onboard/onboarding_page.dart';
import 'package:serveit/pages/auth/signin_page.dart';
import 'package:serveit/pages/services.dart';
import 'package:serveit/pages/splash.dart';
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
  UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    userRepository = UserRepository(localStorageService);
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) {
            AuthBloc authBloc = AuthBloc(AuthInitial());
            authBloc.init(userRepository);
            return authBloc;
          },
        ),
        BlocProvider<SettingsBloc>(create: (BuildContext context) {
          SettingsBloc settingsBloc = SettingsBloc();
          settingsBloc.init(localStorageService);
          return settingsBloc;
        }),
        BlocProvider<UserRegBloc>(create: (c) {
          UserRegBloc userRegBloc = UserRegBloc();
          userRegBloc.init(userRepository);
          return userRegBloc;
        }),
        BlocProvider<LoginBloc>(
          create: (c) {
            LoginBloc loginBloc = LoginBloc();
            loginBloc.init(userRepository);
            return loginBloc;
          },
        ),
         BlocProvider<ProfileBloc>(
          create: (c) {
            ProfileBloc profileBloc = ProfileBloc();
            return profileBloc;
          },
        ),
        
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
  AuthBloc authBloc;
  @override
  Widget build(BuildContext context) {
    authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(AppStartedEvent());
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return BasicProfilePage ();
      print("State, came here:" + state.toString());
      if (state is AuthInitial) {
        return Splash();
      } else if (state is AuthenticatedState) {
        return HomePage.HomePage();
      } else if (state is UnAuthenticated) {
        return IntroPage();
      } else if (state is NewUserState) {
        return BasicProfilePage();
      }
    });
  }
}
