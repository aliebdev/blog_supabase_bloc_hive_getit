import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';
import '../widgets/blog_editor.dart';

class AddNewBlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (_) => const AddNewBlogPage());
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  List<String> selectedTopics = [];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            DottedBorder(
              color: AppPallete.borderColor,
              dashPattern: const [10, 4],
              radius: const Radius.circular(10),
              borderType: BorderType.RRect,
              strokeCap: StrokeCap.round,
              child: const SizedBox(
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.folder_open,
                      size: 40,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Select your image",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    ["Technology", "Business", "Programming", "Entertainment"]
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                if (selectedTopics.contains(e)) {
                                  selectedTopics.remove(e);
                                } else {
                                  selectedTopics.add(e);
                                }
                                setState(() {});
                              },
                              child: Chip(
                                label: Text(
                                  e,
                                  // style: TextStyle(
                                  //   color: selectedTopics.contains(e)
                                  //       ? AppPallete.backgroundColor
                                  //       : Colors.white,
                                  // ),
                                ),
                                color: selectedTopics.contains(e)
                                    ? const WidgetStatePropertyAll(
                                        AppPallete.gradient2)
                                    : const WidgetStatePropertyAll(
                                        AppPallete.backgroundColor),
                                side: BorderSide(
                                  color: selectedTopics.contains(e)
                                      ? AppPallete.gradient2
                                      : AppPallete.borderColor,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
            const SizedBox(height: 10),
            BlogEditor(
              controller: _titleController,
              hintText: "Blog Title",
            ),
            const SizedBox(height: 10),
            BlogEditor(
              controller: _contentController,
              hintText: "Blog Content",
            ),
          ],
        ),
      ),
    );
  }
}
