import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class AppStatePersistence {
  static const String _currentApiQueryKey = 'current_api_query';
  static const String _selectedServiceKey = 'selected_service';
  static const String _selectedMethodKey = 'selected_method';
  static const String _currentStepKey = 'current_step';
  static const String _lastVisitedPageKey = 'last_visited_page';
  static const String _apiParametersKey = 'api_parameters';
  static const String _rawBodyKey = 'raw_body';
  static const String _currentApiUrlKey = 'current_api_url';

  static Future<void> saveCurrentApiQuery({
    required String query,
    required String service,
    required String method,
    required Map<String, String> parameters,
    String? rawBody,
    String? currentApiUrl,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(_currentApiQueryKey, query);
      await prefs.setString(_selectedServiceKey, service);
      await prefs.setString(_selectedMethodKey, method);
      await prefs.setString(_currentApiUrlKey, currentApiUrl ?? '');

      // Save parameters as JSON string
      final paramsJson =
          parameters.entries.map((e) => '${e.key}:${e.value}').join('|');
      await prefs.setString(_apiParametersKey, paramsJson);

      if (rawBody != null) {
        await prefs.setString(_rawBodyKey, rawBody);
      }

      debugPrint('✅ App state saved successfully');
    } catch (e) {
      debugPrint('❌ Error saving app state: $e');
    }
  }

  static Future<Map<String, dynamic>?> loadCurrentApiQuery() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final query = prefs.getString(_currentApiQueryKey);
      final service = prefs.getString(_selectedServiceKey);
      final method = prefs.getString(_selectedMethodKey);
      final currentApiUrl = prefs.getString(_currentApiUrlKey);
      final paramsJson = prefs.getString(_apiParametersKey);
      final rawBody = prefs.getString(_rawBodyKey);

      if (query == null || service == null || method == null) {
        return null;
      }

      // Parse parameters from JSON string
      Map<String, String> parameters = {};
      if (paramsJson != null && paramsJson.isNotEmpty) {
        final params = paramsJson.split('|');
        for (final param in params) {
          final parts = param.split(':');
          if (parts.length == 2) {
            parameters[parts[0]] = parts[1];
          }
        }
      }

      return {
        'query': query,
        'service': service,
        'method': method,
        'parameters': parameters,
        'rawBody': rawBody,
        'currentApiUrl': currentApiUrl,
      };
    } catch (e) {
      debugPrint('❌ Error loading app state: $e');
      return null;
    }
  }

  static Future<void> saveCurrentStep(int step) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_currentStepKey, step);
      debugPrint('✅ Current step saved: $step');
    } catch (e) {
      debugPrint('❌ Error saving current step: $e');
    }
  }

  static Future<int?> loadCurrentStep() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(_currentStepKey);
    } catch (e) {
      debugPrint('❌ Error loading current step: $e');
      return null;
    }
  }

  static Future<void> saveLastVisitedPage(String pageName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_lastVisitedPageKey, pageName);
      debugPrint('✅ Last visited page saved: $pageName');
    } catch (e) {
      debugPrint('❌ Error saving last visited page: $e');
    }
  }

  static Future<String?> loadLastVisitedPage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_lastVisitedPageKey);
    } catch (e) {
      debugPrint('❌ Error loading last visited page: $e');
      return null;
    }
  }

  static Future<void> clearAppState() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.remove(_currentApiQueryKey);
      await prefs.remove(_selectedServiceKey);
      await prefs.remove(_selectedMethodKey);
      await prefs.remove(_currentStepKey);
      await prefs.remove(_lastVisitedPageKey);
      await prefs.remove(_apiParametersKey);
      await prefs.remove(_rawBodyKey);
      await prefs.remove(_currentApiUrlKey);

      debugPrint('✅ App state cleared successfully');
    } catch (e) {
      debugPrint('❌ Error clearing app state: $e');
    }
  }

  static Future<Map<String, dynamic>> getAppStateSummary() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      return {
        'hasApiQuery': prefs.getString(_currentApiQueryKey) != null,
        'hasSelectedService': prefs.getString(_selectedServiceKey) != null,
        'hasCurrentStep': prefs.getInt(_currentStepKey) != null,
        'hasLastVisitedPage': prefs.getString(_lastVisitedPageKey) != null,
        'totalKeys': prefs.getKeys().length,
      };
    } catch (e) {
      debugPrint('❌ Error getting app state summary: $e');
      return {};
    }
  }
}
