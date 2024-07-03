import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:dotted_border/dotted_border.dart';

class Docsverification extends StatefulWidget {
  const Docsverification({super.key});

  @override
  State<Docsverification> createState() => _DocsverificationState();
}

class _DocsverificationState extends State<Docsverification>
    with SingleTickerProviderStateMixin {
  FilePickerResult? _file;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          _file = result;
        });
      }
    } catch (e) {
      print("pick file  error $e ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(30),
              color: Colors.blueGrey.shade100),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        ),
        centerTitle: true,
        title: Text(
          "Upload Document",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload Verification Document",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w400),
                // style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 10),
              Text(
                // textAlign: TextAlign.center,
                "Please select a file you wish to upload and fill out the required information below.\n  Ensure that the file is in an appropriate format and provides a clear and concise title and description. This will help in categorizing and retrieving the file more efficiently in the future.",
                // style: Theme.of(context).textTheme.bodyText1,
              ),
              // SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: _pickFile,
              //   child: Text("Pick a file"),
              // ),
              SizedBox(height: 10),

              _file != null
                  ? Text(
                      "Selected File: ${_file!.files.single.name}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  : Text(
                      "No file Chosen",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),

              SizedBox(height: 10),
              DottedBorder(
                color: Colors.black54,
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                padding: EdgeInsets.all(6),
                child: Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_copy,
                          size: 40,
                          color: Colors.black54,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Select Document to uplaod",
                          style: GoogleFonts.poppins(color: Colors.black54),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async {
                            _pickFile;
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(10),
                                color: Colors.grey.shade300),
                            child: Text(
                              textAlign: TextAlign.center,
                              "Choose File",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                          ),
                        )
                      ],
                    )),
              ),

              SizedBox(height: 20),

              SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_file != null) {
                      // Implement the file upload logic here
                      print("Title: ${_titleController.text}");
                      print("Description: ${_descriptionController.text}");
                      print("File Name: ${_file!.files.single.name}");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text("Please select a file to upload")),
                      );
                    }
                  },
                  child: Text("Upload"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
