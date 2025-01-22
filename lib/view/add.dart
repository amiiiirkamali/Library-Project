import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:libraryproject/apis/book_Api/bookApis.dart';
import 'package:libraryproject/models/book/bookModel.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final api = BookService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _serialNumberController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _publisherController = TextEditingController();
  final TextEditingController _publicationYear = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String? _profileImagePath; // Store the selected profile image path

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImagePath =
            pickedFile.path; // Store the selected image file path
      });
      log("path: ${pickedFile.path}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.shade300),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 60),
                // Title
                Text(
                  "Create a Book",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                GestureDetector(
                  onTap: _pickImage, // Open gallery when tapped
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImagePath != null
                        ? FileImage(
                            File(_profileImagePath!)) // Use the picked image
                        : AssetImage('assets/images/default_profile.png')
                            as ImageProvider,
                    child: _profileImagePath == null
                        ? Icon(Icons.camera_alt, color: Colors.white)
                        : null,
                  ),
                ),
                SizedBox(height: 20),

                // Username Field
                TextFormField(
                  controller: _serialNumberController,
                  decoration: InputDecoration(
                    labelText: "SerialNumber",
                    labelStyle: TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'SerialNumber is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Username Field
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Password Field
                TextFormField(
                  controller: _authorController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Author",
                    labelStyle: TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Author is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Full Name Field
                TextFormField(
                  controller: _genreController,
                  decoration: InputDecoration(
                    labelText: "Genre",
                    labelStyle: TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Genre is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Phone Number Field
                TextFormField(
                  controller: _publisherController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Publisher",
                    labelStyle: TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Publisher is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Birth Date Field
                TextFormField(
                  controller: _publicationYear,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "PublicationYear",
                    labelStyle: TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Publication Year is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Address Field
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: "Price",
                    labelStyle: TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Price is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),

                // Register Button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final book = Book(
                          serialNumber:
                              _serialNumberController.value.text.trim(),
                          title: _titleController.value.text.trim(),
                          author: _authorController.value.text.trim(),
                          genre: _genreController.value.text.trim(),
                          publisher: _publisherController.value.text.trim(),
                          publicationYear:
                              int.parse(_publicationYear.value.text.trim()),
                          price:
                              double.parse(_priceController.value.text.trim()),
                          cover: File(_profileImagePath ?? ""));
                      final res = await api.createBook(book: book);
                      _showDialog(
                          context: context,
                          message: res,
                          res: res == "Success" ? true : false);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to LoginPage
                  },
                  child: Text(
                    "Already have an account? Login",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(
      {required BuildContext context,
      required String message,
      required bool res}) {
    showDialog(
      context: context,
      barrierDismissible: true, // Prevents closing on tap outside
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: res ? Colors.green : Colors.red),
                  child: Center(
                    child: Icon(
                      res ? Icons.verified : Icons.error,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(message,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
        );
      },
    );
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
    });
  }
}
