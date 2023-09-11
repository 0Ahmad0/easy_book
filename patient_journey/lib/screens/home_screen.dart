import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_journey/constants/app_assets.dart';
import 'package:patient_journey/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(child: SizedBox.shrink()),
          Expanded(child: Image.asset(AppAssets.doctorsIMG)),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    HomeItem(
                      text: 'Appointments',
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: AppColors.white,
                        child: Icon(
                          Icons.date_range,
                          size: 40.0,
                        ),
                      ),
                      onTap: () {},
                    ),
                    HomeItem(
                      text: 'Notifications',
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: AppColors.white,
                        child: Icon(
                          Icons.notifications,
                          size: 40.0,
                        ),
                      ),
                      onTap: () {},
                    ),
                    HomeItem(
                      text: 'Communication',
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: AppColors.white,
                        child: SvgPicture.asset(
                          AppAssets.chatIMG,
                          width: 40.0,
                          height: 40.0,
                          color: AppColors.primary,
                        ),
                      ),
                      onTap: () {},
                    ),
                    HomeItem(
                      text: 'Mediacal file',
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: AppColors.white,
                        child: SvgPicture.asset(
                          AppAssets.MedicalIMG,
                          width: 40.0,
                          height: 40.0,
                          color: AppColors.primary,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.text,
    required this.child,
    required this.onTap,
  });

  final String text;
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: AppColors.primary,
          ),
          child: Row(
            children: [
              Expanded(child: child),
              Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(
                    text,
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.sizeOf(context).width * 0.06),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
