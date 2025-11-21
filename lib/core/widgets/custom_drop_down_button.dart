import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/resources/colors_manager.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    required this.selecetedItem,
    required this.itemsList,
    required this.onChanged,
  });

  final String selecetedItem;
  final List<String> itemsList;
  final Function(String? value) onChanged;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Theme.of(context).secondaryHeaderColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Theme.of(context).primaryColor,
          isExpanded: true,
          value: widget.selecetedItem,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          items: widget.itemsList
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
