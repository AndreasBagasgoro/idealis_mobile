import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'package:idealis_mobile/shared/widgets/buttons/primary_button.dart';
import 'package:idealis_mobile/shared/widgets/inputs/custom_text_field.dart';
import 'package:idealis_mobile/shared/widgets/inputs/custom_dropdown_field.dart';
import 'package:idealis_mobile/core/constants/app_colors.dart';
import 'dart:developer' as logger;

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  _CompleteProfilePageState createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String? _selectedGender;
  final FocusNode _birthDateFocusNode = FocusNode();

  @override
  void dispose() {
    birthDateController.dispose();
    genderController.dispose();
    heightController.dispose();
    weightController.dispose();
    _birthDateFocusNode.dispose();
    super.dispose();
  }

  // ✅ tambah fungsi untuk membuka date picker
  Future<void> _selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary, // warna header & tombol
              onPrimary: Colors.white, // warna teks di header
              onSurface: AppColors.black, // warna teks tanggal
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        // ✅ format tanggal menjadi DD/MM/YYYY
        birthDateController.text =
            '${picked.day.toString().padLeft(2, '0')}/'
            '${picked.month.toString().padLeft(2, '0')}/'
            '${picked.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final pending = authProvider.pendingRegistration;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.primary),
        title: Text(
          'Lengkapi Profil',
          style: TextStyle(color: AppColors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 48),
          child: Column(
            children: [
              Text(
                'Ayo Lengkapi Datamu!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap:
                          () => _selectBirthDate(
                            context,
                          ),
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: birthDateController,
                          label: 'Tanggal Lahir',
                          hintText: 'DD/MM/YYYY',
                          readOnly: true,
                          prefixIcon: IconButton(
                            icon: Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                            ),
                            onPressed: () => _selectBirthDate(context),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomDropdownField(
                      label: 'Jenis Kelamin',
                      hintText: '-- Pilih Jenis Kelamin --',
                      value: _selectedGender,
                      items: [
                        DropdownItem(label: 'Laki-laki', value: 'male'),
                        DropdownItem(label: 'Perempuan', value: 'female'),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: heightController,
                      label: 'Tinggi Badan (cm)',
                      hintText: '000,00.',
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: weightController,
                      label: 'Berat Badan (kg)',
                      hintText: '000,00.',
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                    SizedBox(height: 30),
                    PrimaryButton(
                      text: 'Daftar',
                      isLoading: authProvider.isLoading,
                      onPressed: () async {
                        if (pending == null) return;

                        await authProvider.register(
                          pending['firstName']!,
                          pending['lastName']!,
                          pending['email']!,
                          pending['password']!,
                        );

                        if (authProvider.user != null) {
                          authProvider.clearPendingRegistration();
                          Navigator.pushReplacementNamed(context, '/dashboard');
                        }
                      },
                    ),
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
