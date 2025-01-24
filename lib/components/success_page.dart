import 'package:flutter/material.dart';
import '../common/app_colors.dart';
import 'background.dart';

class SuccessPage extends StatefulWidget {
  final String name;
  final String phone;
  final String email;
  final String date;
  final String startTime;
  final String endTime;
  final String spaceName;

  const SuccessPage({
    required this.name,
    required this.phone,
    required this.email,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.spaceName,
    Key? key,
  }) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
    child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.name,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kcSecondaryColor),
        ),
        Text(
          widget.phone,
          style: const TextStyle(
            fontSize: 14,
            color: kcWhiteColor,
          ),
        ),
        Text(
          widget.email,
          style: const TextStyle(
            fontSize: 14,
            color: kcWhiteColor,
          ),
        ),
        Text(
          widget.date,
          style: const TextStyle(
            fontSize: 14,
            color: kcWhiteColor,
          ),
        ),
        Text(
          widget.startTime,
          style: const TextStyle(
            fontSize: 14,
            color: kcWhiteColor,
          ),
        ),
        Text(
          widget.endTime,
          style: const TextStyle(
            fontSize: 14,
            color: kcWhiteColor,
          ),
        ),
        Text(
          widget.spaceName,
          style: const TextStyle(
            fontSize: 14,
            color: kcWhiteColor,
          ),
        ),

      ],
    ),
    );
  }
}
