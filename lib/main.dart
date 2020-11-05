import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serveit/blocs/auth_bloc/auth_bloc.dart';
import 'package:serveit/blocs/login_bloc/login_bloc.dart';
import 'package:serveit/blocs/profile_bloc/profile_bloc.dart';
import 'package:serveit/blocs/provide_bloc/provide_page_bloc.dart';
import 'package:serveit/blocs/receive_bloc/receive_page_bloc.dart';
import 'package:serveit/blocs/reg_bloc/user_reg_bloc.dart';
import 'package:serveit/blocs/request_service_bloc/request_service_bloc.dart';
import 'package:serveit/blocs/select_community_bloc/select_community_bloc.dart';
import 'package:serveit/blocs/settings_bloc/settings_bloc_bloc.dart';
import 'package:serveit/blocs/verify_community_bloc/verify_community_bloc.dart';
import 'package:serveit/blocs/verify_service_bloc/verify_service_bloc.dart';
import 'package:serveit/models/adress.dart';
import 'package:serveit/models/community.dart';
import 'package:serveit/models/response/token_response.dart';
import 'package:serveit/pages/dashboard/all_tasks_page.dart';
import 'package:serveit/pages/dashboard/home_page.dart' as HomePage;
import 'package:serveit/pages/dashboard/receive_page.dart';
import 'package:serveit/pages/onboard/basic_profile_page.dart';
import 'package:serveit/pages/intro_page.dart';
import 'package:serveit/pages/onboard/onboarding_in_page.dart';
import 'package:serveit/pages/onboard/onboarding_page.dart';
import 'package:serveit/pages/auth/signin_page.dart';
import 'package:serveit/pages/onboard/select_community_page.dart';
import 'package:serveit/pages/onboard/verify_community_page.dart';
import 'package:serveit/pages/onboard/verify_waiting_page.dart';
import 'package:serveit/pages/payment.dart';
import 'package:serveit/pages/services.dart';
import 'package:serveit/pages/splash.dart';
import 'package:serveit/repositories/user_repository.dart';
import 'package:serveit/services/localstorage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
          create: (BuildContext context) =>
              AuthBloc(AuthInitial(), userRepository, localStorageService),
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
            ProfileBloc profileBloc = ProfileBloc(localStorageService);
            return profileBloc;
          },
        ),
        BlocProvider<ReceivePageBloc>(
          create: (c) {
            ReceivePageBloc receivePageBloc =
                ReceivePageBloc(localStorageService);
            return receivePageBloc;
          },
        ),
        BlocProvider<RequestServiceBloc>(
          create: (c) => RequestServiceBloc(localStorageService),
        ),
        BlocProvider<ProvidePageBloc>(
          create: (c) => ProvidePageBloc(localStorageService),
        ),
        BlocProvider<VerifyServiceBloc>(
          create: (c) => VerifyServiceBloc(localStorageService),
        ),
        BlocProvider<SelectCommunityBloc>(
          create: (c) => SelectCommunityBloc(localStorageService),
        ),
        BlocProvider<VerifyCommunityBloc>(
          create: (c) => VerifyCommunityBloc(localStorageService),
        ),
      ],
      child: MaterialApp(
        title: 'ServeIt',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Color(0xFF9BDCE7),
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
      print("State, came here:" + state.toString());
      if (state is AuthInitial) {
        return Splash();
      } else if (state is AuthenticatedState) {
        return HomePage.HomePage();
      } else if (state is UnAuthenticated) {
        return IntroPage();
      } else if (state is NewUserState) {
        return BasicProfilePage();
      } else if (state is NoCommunityState) {
        return SelectCommunityPage();
      } else if (state is UnverifiedState) {
        return VerifyWaitingPage();
        return VerifyCommunityPage(state.community);
      }
    });
  }
}
