import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posts_feed/bloc/post_bloc.dart';
import 'package:posts_feed/bloc/post_event.dart';
import 'package:posts_feed/models/post_model.dart';
import 'package:posts_feed/widgets/add_posts_view_app_bar.dart';
import 'package:posts_feed/widgets/custom_button.dart';
import 'package:posts_feed/widgets/custom_text.dart';
import 'package:posts_feed/widgets/custom_text_field.dart';
import 'package:posts_feed/widgets/photo_example.dart';
import 'package:uuid/uuid.dart';

class AddPostsView extends StatefulWidget {
  const AddPostsView({super.key});

  @override
  AddPostsViewState createState() => AddPostsViewState();
}

class AddPostsViewState extends State<AddPostsView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AddPostsViewAppBar(),
                  SizedBox(height: 16.h),
                  _selectedImage == null
                      ? PhotoExample(onTap: _pickImage)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(24.r),
                          child: Image.file(
                            _selectedImage!,
                            height: 200.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                  SizedBox(height: 16.h),
                  const CustomText(text: 'Title'),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    controller: titleController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  const CustomText(text: 'Description'),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    controller: descriptionController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40.h),
                  CustomButton(
                    onTap: () {
                      if (formState.currentState!.validate()) {
                        const uuid = Uuid();
                        final String id = uuid.v4();
                        final String? imagePath = _selectedImage?.path;
                        final String title = titleController.text;
                        final String description = descriptionController.text;

                        // Dispatch the event to add the post
                        BlocProvider.of<PostBloc>(context).add(
                          AddPostEvent(PostModel(
                            id: id,
                            imagePath: imagePath,
                            title: title,
                            description: description,
                          )),
                        );

                        // Delay navigation until the post is added
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }
}
