import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/constants/color_constant.dart';
import 'package:quran_app/constants/space_constant.dart';
import 'package:quran_app/controllers/book_controller.dart';
import 'package:quran_app/utils/list_page.dart';

class BookMarkScreen extends StatelessWidget {
  BookMarkScreen({super.key});

  final BookController bookController = Get.find<BookController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookController>(
        init: bookController,
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: ListTile(
                  // leading: Icon(Icons.bookmark_add_outlined),
                  hoverColor: Colors.red,
                  title: Text(
                    quranIndex.pages[bookController.currentPage].isBookmark
                        ? "Remove this bookmark page"
                        : "Bookmark this page",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.bookmark_add_outlined),
                  onTap: () => bookController
                      .bookmarkImageTap(bookController.currentPage),
                ),
              ),
              height15,
              Text(
                "Saved Bookmark",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              height8,
              bookController.bookMarkModel.bookmarkPageList != null &&
                      bookController.bookMarkModel.bookmarkPageList!.isNotEmpty
                  ? Card(
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: bookController
                            .bookMarkModel.bookmarkPageList!.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          // Sorted list reference
                          final sortedList = bookController
                              .bookMarkModel.bookmarkPageList!
                              .where((item) => item.pageNumber != null)
                              .toList()
                            ..sort((a, b) =>
                                a.pageNumber!.compareTo(b.pageNumber!));

                          return ListTile(
                            leading: const Icon(Icons.bookmark),
                            title: Text(
                                "${sortedList[index].surahNumber ?? ""}. ${sortedList[index].surahName ?? ""}"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${sortedList[index].pageNumber ?? ""}",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                width15,
                                InkWell(
                                  onTap: () => bookController.removeBookmarPage(
                                      index, sortedList[index]),
                                  child: const Icon(
                                    Icons.delete_outlined,
                                    color: AppColor.redColor,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                            onTap: () => bookController.tapOnSavedbookmark(
                                quranIndex.pages.indexWhere((test) =>
                                    test.pageNumber ==
                                    sortedList[index].pageNumber)),
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: Text(
                        "You did not bookmark any page",
                        style: TextStyle(color: AppColor.greyColor),
                      ),
                    ),
              //we have to give this height beacuse modalBottomsheet take height from above of 60 so beacuse of that it s cut the UI
              const SizedBox(height: 70)
            ],
          );
        });
  }
}
