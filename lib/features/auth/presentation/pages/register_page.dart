import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'package:idealis_mobile/shared/widgets/buttons/primary_button.dart';
import 'package:idealis_mobile/shared/widgets/buttons/rich_text.dart';
import 'package:idealis_mobile/shared/widgets/inputs/custom_text_field.dart';
import 'package:idealis_mobile/shared/widgets/inputs/dual_text_field.dart';
import 'login_page.dart';
import 'package:idealis_mobile/core/constants/app_colors.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(backgroundColor: AppColors.background, elevation: 0, automaticallyImplyLeading: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo_idealis_with_text.png',
                height: 100,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DualTextField(
                      firstController: firstNameController,
                      secondController: lastNameController,
                      firstLabel: 'Nama Depan',
                      secondLabel: 'Nama Belakang',
                      firstHintText: 'Nama Depan',
                      secondHintText: 'Nama Belakang',
                      firstKeyboardType: TextInputType.text,
                      secondKeyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: emailController,
                      label: 'Email',
                      hintText: 'xxx@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      hintText: 'min. 8 karakter',
                      obscureText: !_isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: confirmPasswordController,
                      label: 'Konfirmasi Password',
                      hintText: 'min. 8 karakter',
                      obscureText: !_isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    PrimaryButton(
                      text: 'Selanjutnya',
                      isLoading: authProvider.isLoading,
                      onPressed: () {
                        authProvider.savePendingRegistration(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        Navigator.pushNamed(context, '/complete_profile');
                      },
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: RichTextButton(
                        normalText: 'Sudah punya akun? ',
                        actionText: 'Login',
                        onTap: () => Navigator.pushNamed(context, '/login'),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
