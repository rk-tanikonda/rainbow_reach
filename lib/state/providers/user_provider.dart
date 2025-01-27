import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rainbow_reach/models/user_model.dart';
import 'package:rainbow_reach/services/api_service.dart';

// Define the API service provider
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

// Define the user state provider
final userProvider = FutureProvider.family<User, String>((ref, userId) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.fetchUser(userId);
});
