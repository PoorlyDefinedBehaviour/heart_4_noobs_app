import 'package:get_it/get_it.dart';
import 'package:heart_4_noobs/domain/infra/cache.dart';
import 'package:heart_4_noobs/domain/usecases/get_starting_route.dart';
import 'package:heart_4_noobs/domain/usecases/mark_route_as_visited.dart';
import 'package:heart_4_noobs/infra/cache/shared_preferences/shared_preferences_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  await sharedPreferences.clear();

  locator.registerSingleton<SharedPreferences>(sharedPreferences);

  locator.registerSingleton<Cache>(SharedPreferencesCache());
  locator.registerSingleton<GetStartingRoute>(GetStartingRoute());
  locator.registerSingleton<MarkRouteAsVisited>(MarkRouteAsVisited());
}
