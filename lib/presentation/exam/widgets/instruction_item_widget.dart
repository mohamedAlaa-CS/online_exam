import 'package:flutter/material.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';

class InstructionItem extends StatelessWidget {
  const InstructionItem({
    super.key,
    required this.instructionTitle,
  });
  final String instructionTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: AppColors.grey10,
        radius: 5,
      ),
      title: Text(
        instructionTitle,
        style: TextStyles.font14PlaceHolder400Weight,
      ),
    );
  }
}
