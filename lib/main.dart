import 'package:flutter/material.dart';
import 'package:flutter_iste/data/cache_helper.dart';
import '../screens/tabs_screen.dart';
import '../services/app_router.dart';
import '../services/app_theme.dart';
// import '../data/repository.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
    // storageDirectory: await getTemporaryDirectory(),
  );
  await CacheHelper.init();
  HydratedBlocOverrides.runZoned(
    () => runApp(RepositoryProvider(
      create: (context) => CacheHelper(),
      child: MyApp(
        appRouter: AppRouter(),
      ),
    )),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        // TasksBloc(RepositoryProvider.of<CacheHelper>(context))),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            title: 'Flutter Tasks App',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: TabsScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
