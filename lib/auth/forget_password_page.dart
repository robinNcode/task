import 'package:flutter/material.dart';
import 'package:test_app_batch21/screens/auth/login_page.dart';
import 'package:test_app_batch21/screens/widgets/buttons/custom_material_button.dart';
import 'package:test_app_batch21/screens/widgets/layout/background_image_widget.dart';
import 'package:test_app_batch21/screens/widgets/layout/header_widget.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late TextEditingController _fullNameController =
      TextEditingController(text: '');
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passwordController =
      TextEditingController(text: '');
  late TextEditingController _designationController =
      TextEditingController(text: '');

  FocusNode _fullNameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _designationFocusNode = FocusNode();

  final _loginFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _designationFocusNode.dispose();

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
          ..addListener(() {
            setState(() {});
          })
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
    final isValid = _loginFormKey.currentState!.validate();
    print('isValid $isValid');
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
                    headerTitle: 'Register',
                    headerSubTitle: 'Already Have an account.',
                    headerButtonTitle: 'Login',
                    pageRoute: LoginPage(),
                  ),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          focusNode: _fullNameFocusNode,
                          keyboardType: TextInputType.name,
                          controller: _fullNameController,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return "Please Enter valid email";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: _size.height * 0.02),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passwordFocusNode),
                          focusNode: _emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return "Please Enter valid email";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: _size.height * 0.02),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_designationFocusNode),
                          focusNode: _passwordFocusNode,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'Passowrd',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: _size.height * 0.02),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () => _submitFormLogin(),
                          focusNode: _designationFocusNode,
                          keyboardType: TextInputType.name,
                          controller: _designationController,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return "Please Enter valid email";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: "Designation",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: _size.height * 0.05),
                        CustomMaterialButton(
                          onPressed: () {},
                          text: 'Registrartion',
                          icon: Icons.login_sharp,
                        ),
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
