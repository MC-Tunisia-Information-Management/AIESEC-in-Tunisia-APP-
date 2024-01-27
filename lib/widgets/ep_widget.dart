import 'package:aiesec_core/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EPWidget extends StatelessWidget {
  final String name;
  final int id;
  final Map data;
  const EPWidget(
      {super.key, required this.name, required this.id, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        onTap: () => Get.to(() => ProfileScreen(epData: const {}, name: name)),
        leading: Container(
          height: Get.width > 360 ? 42 : 30,
          width: Get.width > 360 ? 42 : 30,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: SvgPicture.network(
            'https://cdn-expa.aiesec.org/gis-img/missing_profile_${name[0].toLowerCase()}.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        title: Center(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Get.theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        trailing: Text(
          id.toString(),
          style: GoogleFonts.poppins(
            fontSize: 11,
            color: const Color(0xFF9fa2b6),
          ),
        ),
      ),
    );
  }
}
