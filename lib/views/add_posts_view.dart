import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posts_feed/widgets/add_posts_view_app_bar.dart';
import 'package:posts_feed/widgets/custom_button.dart';
import 'package:posts_feed/widgets/custom_text.dart';
import 'package:posts_feed/widgets/custom_text_field.dart';
import 'package:posts_feed/widgets/photo_example.dart';

class AddPostsView extends StatefulWidget {
  const AddPostsView({super.key});

  @override
  AddPostsViewState createState() => AddPostsViewState();
}

class AddPostsViewState extends State<AddPostsView> {
  File? _selectedImage; // This will hold the selected image
  final ImagePicker _picker = ImagePicker();

  // Function to select an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AddPostsViewAppBar(),
              SizedBox(height: 16.h),

              // If an image is selected, display it; otherwise, show the placeholder
              _selectedImage == null
                  ? PhotoExample(
                      onTap: _pickImage, // Trigger image selection when tapped
                    )
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
              const CustomTextField(),
              SizedBox(height: 16.h),
              const CustomText(text: 'Description'),
              SizedBox(height: 8.h),
              const CustomTextField(),
              SizedBox(height: 40.h),
              CustomButton(
                onTap: () {
                  // Handle post submission logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
