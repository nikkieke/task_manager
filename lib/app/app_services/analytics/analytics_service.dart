import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/app/app.dart';


final analyticsProvider = Provider<Analytics>((ref) {
  return Analytics();
});

class Analytics{

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> logUserEvents(String action, Map<String, dynamic> parameter)async{
    try{
      await _analytics.logEvent(name: action, parameters: parameter);
    }catch (e){
      basicPrint(e);
    }
  }

  Future<void> logScreen(String screenName)async {
    try{
      await _analytics.setCurrentScreen(screenName: screenName);
    }catch (e){
      basicPrint(e);
    }
  }
}
