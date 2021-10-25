import 'package:flutter/material.dart';
import 'package:test_app_batch21/screens/auth/forget_password_page.dart';
import 'package:test_app_batch21/screens/auth/register_page.dart';
import 'package:test_app_batch21/screens/widgets/buttons/custom_material_button.dart';
import 'package:test_app_batch21/screens/widgets/buttons/custom_text_button.dart';
import 'package:test_app_batch21/screens/widgets/inputs/email_text_form_field.dart';
import 'package:test_app_batch21/screens/widgets/inputs/password_text_form_field.dart';
import 'package:test_app_batch21/screens/widgets/layout/background_image_widget.dart';
import 'package:test_app_batch21/screens/widgets/layout/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() => setState(() {}))
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });

    _animationController.forward();

    super.initState();
  }

  void _submitFormLogin() {
    // ignore: unused_local_variable
    final isValid = _loginFormKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImageWidget(animation: _animation),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
              child: ListView(
                children: [
                  HeaderWidget(
                    headerTitle: 'Login',
                    headerSubTitle: 'Don\'t have an Account',
                    headerButtonTitle: 'Register',
                    pageRoute: RegisterPage(),
                  ),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        EmailTextFromField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          textInputAction: TextInputAction.next,
                          hintText: "Email",
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                        ),
                        SizedBox(height: _size.height * 0.01),
                        PasswordTextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          hintText: 'Password',
                          textInputAction: TextInputAction.done,
                          onEditingComplete: _submitFormLogin,
                        ),
                        SizedBox(height: _size.height * 0.01),
                        CustomTextButton(
                          pageRoute: ForgetPasswordPage(),
                          text: 'Forget Password',
                        ),
                        SizedBox(height: _size.height * 0.05),
                        CustomMaterialButton(
                          onPressed: _submitFormLogin,
                          text: "login",
                          icon: Icons.login,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
