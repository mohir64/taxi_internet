import 'package:flutter/material.dart';

import 'config/routes.dart';
import 'screens/screen.dart';
import 'config/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> addUser(String name, int age) async {
  final response = await Supabase.instance.client
      .from('users')
      .insert({'name': name, 'age': age});

  if (response.error != null) {
    print('Error: ${response.error!.message}');
  } else {
    print('User added successfully');
  }
}

Future<void> fetchUsers() async {
  final response = await Supabase.instance.client
      .from('users')
      .select()
      .execute();

  if (response.error != null) {
    print('Error: ${response.error!.message}');
  } else {
    print('Users: ${response.data}');
  }
}

Future<void> updateUser(int id, String name, int age) async {
  final response = await Supabase.instance.client
      .from('users')
      .update({'name': name, 'age': age})
      .eq('id', id)
      .execute();

  if (response.error != null) {
    print('Error: ${response.error!.message}');
  } else {
    print('User updated successfully');
  }
}

Future<void> deleteUser(int id) async {
  final response = await Supabase.instance.client
      .from('users')
      .delete()
      .eq('id', id)
      .execute();

  if (response.error != null) {
    print('Error: ${response.error!.message}');
  } else {
    print('User deleted successfully');
  }
}

void listenToUsers() {
  Supabase.instance.client
      .from('users')
      .stream(['id'])
      .listen((data) {
    print('Realtime data: $data');
  });
}

Future<void> signUp(String email, String password) async {
  final response = await Supabase.instance.client.auth
      .signUp(email, password);

  if (response.error != null) {
    print('Error: ${response.error!.message}');
  } else {
    print('User signed up successfully');
  }
}

Future<void> signIn(String email, String password) async {
  final response = await Supabase.instance.client.auth
      .signIn(email: email, password: password);

  if (response.error != null) {
    print('Error: ${response.error!.message}');
  } else {
    print('User signed in successfully');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://zzkdimqzwlhdxeihjzic.supabase.co',
    anonKey:
     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp6a2RpbXF6d2xoZHhlaWhqemljIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcxMTE4MTcsImV4cCI6MjA1MjY4NzgxN30.3OMxm9cYLszmOrhwdoPIf0IMF1AIl8TMcL-zh64k5OI',
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
 
class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const HomePage(),
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
