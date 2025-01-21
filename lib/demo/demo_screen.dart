/* import 'package:quran_app/controllers/demo_controller.dart';
import 'package:quran_app/demo/demo_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/utils/global.dart' as global;

class DemoScreen extends StatelessWidget {
  DemoScreen({super.key});

  final DemoController demoController = Get.put(DemoController());
//other

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Structure Demo"),
      ),
      body: GetBuilder<DemoController>(
          init: demoController,
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    "Multi Language : ${global.themeController.appLocaleValues!["youHavePushedTtheButtonThisManyTimes"]}"),
                Obx(() => Text(
                    "Update Only Single Widget : ${demoController.isAppWorking}")),
                TextButton.icon(
                    onPressed: () => global.navigateTo(const DemoScreen2()),
                    icon: const Icon(Icons.arrow_right_alt),
                    label: const Text("Change Your Widgets Theme")),
              ],
            );
          }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "button1",
            onPressed: () async {
              await global.themeController.changelanguage('en');
              demoController.update();
            },
            tooltip: 'English',
            child: const Icon(Icons.translate),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "button2",
            onPressed: () async {
              await global.themeController.changelanguage('hi');
              demoController.update();
            },
            tooltip: 'Hindi',
            child: const Icon(Icons.g_translate),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "button3",
            onPressed: () {
              demoController.demoApi();
            },
            tooltip: 'API',
            child: const Icon(Icons.api),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "button4",
            onPressed: () async {
              demoController.isAppWorking.value =
                  !demoController.isAppWorking.value;
            },
            tooltip: 'OBX',
            child: const Icon(Icons.change_circle),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "button5",
            onPressed: () {
              demoController.themeChanges();
            },
            tooltip: 'Theme',
            child: const Icon(Icons.dark_mode),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}
/* 
class _DemoScreenState extends State<DemoScreen> {
  // Sample data for QuranModel instances
  final List<QuranModel> quran = [
    QuranModel(
      id: 1,
      juz: 1,
      surah: [
        "Al-Fatihah",
        "Al-Baqarah",
      ],
      location: [
        "Makki - 7 Verses",
        "Al-Baqarah",
      ],
      ayah: [
        [1, 2, 3, 4, 5, 6, 7],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
      ],
      page: [
        [4],
        [5, 6, 7, 8, 9, 10]
      ],
    ),
    QuranModel(
      id: 2,
      juz: 2,
      surah: [
        "Al-Baqarah",
      ],
      location: [
        "Makki - 7 Verses",
        "Al-Baqarah",
      ],
      ayah: [
        [13, 14, 15, 16, 17, 18, 19, 20]
      ],
      page: [
        [11, 12, 13, 14, 15]
      ],
    ),
  ];

  // Selected indexes for each picker
  int selectedJuzIndex = 0;
  int selectedSurahIndex = 0;
  int selectedAyahIndex = 0;
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    QuranModel selectedQuran = quran[selectedJuzIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('Separate Pickers'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header row
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Juz', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Surah', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Ayah', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Page', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Juz Picker
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedJuzIndex,
                    ),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedJuzIndex = index;
                        selectedSurahIndex = 0;
                        selectedAyahIndex = 0;
                        selectedPageIndex = 0;
                      });
                    },
                    children: quran
                        .map(
                          (item) => Center(
                            child: Text(item.juz.toString()),
                          ),
                        )
                        .toList(),
                  ),
                ),
                // Surah Picker
                Expanded(
                  flex: 2,
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedSurahIndex,
                    ),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedSurahIndex = index;
                        selectedAyahIndex = 0;
                        selectedPageIndex = 0;
                      });
                    },
                    children: selectedQuran.surah!
                        .map(
                          (surah) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(surah,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(selectedQuran.location![selectedSurahIndex],
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey[600])),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
                // Ayah Picker
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedAyahIndex,
                    ),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedAyahIndex = index;
                      });
                    },
                    children: selectedQuran.ayah![selectedSurahIndex]
                        .map((ayah) => Center(child: Text(ayah.toString())))
                        .toList(),
                  ),
                ),
                // Page Picker
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedPageIndex,
                    ),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedPageIndex = index;
                      });
                    },
                    children: selectedQuran.page![selectedSurahIndex]
                        .map((page) => Center(child: Text(page.toString())))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          // Selected details container
          Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  'Selected:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text('Juz: ${selectedQuran.juz}',
                    style: TextStyle(fontSize: 16)),
                Text('Surah: ${selectedQuran.surah![selectedSurahIndex]}',
                    style: TextStyle(fontSize: 16)),
                Text('Location: ${selectedQuran.location![selectedSurahIndex]}',
                    style: TextStyle(fontSize: 16)),
                Text(
                    'Ayah: ${selectedQuran.ayah![selectedSurahIndex][selectedAyahIndex]}',
                    style: TextStyle(fontSize: 16)),
                Text(
                    'Page: ${selectedQuran.page![selectedSurahIndex][selectedPageIndex]}',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 */

class _DemoScreenState extends State<DemoScreen> {
  // Sample data for each picker
  final List<int> juzOptions = List.generate(30, (index) => index + 1);
  final List<Map<String, dynamic>> surahOptions = [
    {'name': 'Al-Qari\'ah', 'location': 'Makki - 11 Verses'},
    {'name': 'At-Takathur', 'location': 'Makki - 8 Verses'},
    {'name': 'Al-Asr', 'location': 'Makki - 3 Verses'},
    {'name': 'Al-Humazah', 'location': 'Makki - 9 Verses'},
    {'name': 'Al-Fil', 'location': 'Makki - 5 Verses'},
    {'name': 'Al-Kauthar', 'location': 'Makki - 3 Verses'},
  ];
  final List<int> ayahOptions =
      List.generate(286, (index) => index + 1); // For example, up to 286 ayahs
  final List<int> pageOptions =
      List.generate(604, (index) => index + 1); // For example, up to 604 pages

  // Selected values
  int selectedJuz = 1;
  int selectedSurahIndex = 0;
  int selectedAyah = 1;
  int selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Separate Pickers'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header row
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Juz', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Surah', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Ayah', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Page', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Juz Picker
                Expanded(
                  child: Stack(
                    children: [
                      CupertinoPicker(
                        itemExtent: 40,
                        scrollController: FixedExtentScrollController(
                          initialItem: selectedJuz - 1,
                        ),
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            selectedJuz = juzOptions[index];
                          });
                        },
                        children: juzOptions
                            .map(
                              (juz) => Container(
                                width: 52,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  juz.toString(),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      // Overlay widget to hide the default highlight background
                      Center(
                        child: IgnorePointer(
                          child: Container(
                            height: 40,
                            width: 54,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              selectedJuz.toString(),
                              style: const TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Surah Picker
                Expanded(
                  flex: 2,
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                        initialItem: selectedSurahIndex),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedSurahIndex = index;
                      });
                    },
                    children: surahOptions
                        .map((surah) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(surah['name'],
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold)),
                                Text(surah['location'],
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[600])),
                              ],
                            ))
                        .toList(),
                  ),
                ),
                // Ayah Picker
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                        initialItem: selectedAyah - 1),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedAyah = ayahOptions[index];
                      });
                    },
                    children: ayahOptions
                        .map((ayah) => Center(child: Text(ayah.toString())))
                        .toList(),
                  ),
                ),
                // Page Picker
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 40,
                    backgroundColor: Colors
                        .transparent, // Change this to customize the background
                    scrollController: FixedExtentScrollController(
                        initialItem: selectedPage - 1),
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedPage = pageOptions[index];
                      });
                    },
                    children: pageOptions
                        .map((page) => Center(child: Text(page.toString())))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          // Selected details container
          Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const Text(
                  'Selected:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text('Juz: $selectedJuz', style: const TextStyle(fontSize: 16)),
                Text('Surah: ${surahOptions[selectedSurahIndex]['name']}',
                    style: const TextStyle(fontSize: 16)),
                Text('Ayah: $selectedAyah', style: const TextStyle(fontSize: 16)),
                Text('Page: $selectedPage', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
