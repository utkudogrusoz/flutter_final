import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:open_us_for_all/feature/auth/viewmodel/auth_view_model.dart';
import 'package:open_us_for_all/feature/home/view/admin/admin_view.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  bool buttonIsHover = false;

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.watch(authViewModel.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 100,
            image: NetworkImage(
                "https://www.khas.edu.tr/wp-content/uploads/2022/02/khas-logo-test.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: mailTextField(authViewModel: authNotifier),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: passwordTextField(authViewModel: authNotifier),
            ),
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                buttonIsHover = !buttonIsHover;
              });
            },
            onTap: () async {
              bool isLogin = await authNotifier.login(
                email: authNotifier.mailController.text.trim(),
                password: authNotifier.passwordController.text,
              );
              if (isLogin) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login success')),
                );
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => AdminView()),
                    (route) => false);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login failed')),
                );
              }
            },
            child: Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                color: buttonIsHover ? Colors.blue : Colors.lightBlue.shade900,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  TextField mailTextField({AuthViewModel? authViewModel}) {
    return TextField(
      controller: authViewModel!.mailController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        hintText: 'Mail',
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: Icon(Icons.email, color: Colors.grey),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      ),
      style: TextStyle(color: Colors.black),
    );
  }

  TextField passwordTextField({AuthViewModel? authViewModel}) {
    return TextField(
      controller: authViewModel!.passwordController,
      showCursor: true,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300,
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.grey[600]),
        prefixIcon: Icon(Icons.lock, color: Colors.grey),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}
