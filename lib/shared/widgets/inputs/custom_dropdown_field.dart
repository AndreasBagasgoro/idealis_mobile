import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../core/constants/app_colors.dart';

class DropdownItem<T> {
  final String label;
  final T value;

  const DropdownItem({required this.label, required this.value});
}

class CustomDropdownField<T> extends StatelessWidget {
  final String label;
  final String hintText;
  final T? value;
  final List<DropdownItem<T>> items;
  final ValueChanged<T?> onChanged;
  final Color? fillColor;
  final TextStyle? itemTextStyle; // ✅ style untuk setiap item
  final TextStyle? selectedItemTextStyle; // ✅ style untuk item yang dipilih

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.value,
    this.fillColor,
    this.itemTextStyle,
    this.selectedItemTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        DropdownButtonFormField2<T>(
          value: value,
          isExpanded: true,
          hint: Text(
            hintText,
            style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          ),
          style:
              selectedItemTextStyle ??
              TextStyle(color: AppColors.black, fontSize: 16),
          items:
              items
                  .map(
                    (item) => DropdownMenuItem<T>(
                      value: item.value,
                      child: Text(
                        item.label,
                        
                        style:
                            itemTextStyle ??
                            TextStyle(color: AppColors.black, fontSize: 16),
                      ),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
          dropdownStyleData: DropdownStyleData(
            maxHeight: 300,
            width: null,
            decoration: BoxDecoration(
              color: fillColor ?? Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            overlayColor: WidgetStateProperty.resolveWith<Color?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.pressed)) {
                return AppColors.primary.withOpacity(
                  0.1,
                ); // ✅ warna saat ditekan
              }
              if (states.contains(WidgetState.hovered)) {
                return AppColors.primary.withOpacity(
                  0.05,
                ); // ✅ warna saat hover
              }
              return null;
            }),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor ?? Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            contentPadding: EdgeInsets.only(
              left: 0,
              right: 16,
              top: 14.5,
              bottom: 14.5,
            ),
          ),
        ),
      ],
    );
  }
}
