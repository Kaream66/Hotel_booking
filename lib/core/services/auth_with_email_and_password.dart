import 'package:supabase_flutter/supabase_flutter.dart';

class AuthWithEmailAndPassword {
  final SupabaseClient _supabaseClient =
      Supabase.instance.client;

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _supabaseClient.auth.signInWithPassword(
      email: email.trim(),
      password: password,
    );
  }
  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    return await _supabaseClient.auth.signUp(
      email: email.trim(),
      password: password,
    );
  }
  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  User? get currentUser => _supabaseClient.auth.currentUser;
}
