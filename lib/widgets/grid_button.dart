import 'package:eltracmo_staff/common/app_theme.dart';
import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;

  const GridButton({
    Key? key,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120.0,
        width: (MediaQuery.of(context).size.width / 100) * 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
          color: AppTheme.tileBackgroundColor,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 96.0,
                width: 96.0,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ]),
      ),
    );
  }
}
