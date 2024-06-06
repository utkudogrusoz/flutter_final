import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_us_for_all/feature/auth/viewmodel/auth_view_model.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authViewModel.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
             // authNotifier.logout();
              context.go('/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Home Page!'),
      ),
    );
  }
}
