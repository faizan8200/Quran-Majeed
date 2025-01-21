import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/constants/image_constant.dart';
import 'package:quran_app/constants/space_constant.dart';
import 'package:quran_app/widgets/main_body_padding.dart';
import 'package:quran_app/utils/global.dart' as global;

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text("About Us"),
      ),
      body: MainBodyPadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  ImageConstant.logoRoundedImage,
                  // scale: 3,
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
              height15,
              Center(
                child: Text(
                  "Quran Majeed",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              height40,
              const Text(
                "Noorani Makatib is a community-driven organization that focuses on various charitable activities and religious education. It was founded with the aim of making a positive impact on the lives of people, particularly orphans and widows.Here are some of the key areas where Noorani Makatib operates",
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
              height15,
              const Text(
                '''Charity:\n
 * Beva Yateem Charity: Provides support to orphans and widows.\n
 * Marriage Charity: Assists with marriage expenses for needy individuals.\n
 * Food Charity: Distributes food to the hungry and needy.\n
 * Ramadan Charity: Organizes special charity drives during the holy month of Ramadan.\n
 * Ibadatkhana Scheme: Supports the construction and maintenance of places of worship.\n
 * Maiyat Gusal Van: Provides funeral services and facilities.\n
 * Aafayat Clinic: Offers medical services to the community.\n
 * Social Work: Engages in various social welfare activities.\n
 * Boring Activities: Provides clean drinking water through borewell installations.\n
 * Medical Charity: Supports medical treatments for the needy.\n
 * Bayanats: Offers religious lectures and discourses on various Islamic topics.\n
 * Tafseer: Provides Quranic commentary and explanation.\n
 * Dars: Conducts religious classes and lessons.\n
 * Book Publication: Publishes books on Islamic topics in various languages (Urdu, Gujarati, Hindi, English).\n
 * Madrasas: Runs educational institutions for religious learning.\n
Other Activities:
 * Training Programs: Organizes training programs for religious scholars and teachers.\n
 * Community Outreach: Engages in community outreach programs to spread awareness about Islam and social issues.\n
''',
              ),
              height15,
              const Text(
                "Noorani Makatib aims to create a positive impact on society by promoting religious education, social welfare, and community development. They strive to empower individuals and uplift the community through their various initiatives.",
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MainBodyPadding(
        child: ListTile(
          leading: Image.asset(ImageConstant.logoRoundedImage),
          title: RichText(
            text: TextSpan(
                text: "For more information visit our website ",
                style: Theme.of(context).textTheme.bodyMedium,
                children: const [
                  TextSpan(
                      text: "www.nooranimakatib.com",
                      style: TextStyle(color: Colors.blue))
                ]),
          ),
          onTap: () => global.website(global.websiteUrl),
        ),
      ),
    );
  }
}
