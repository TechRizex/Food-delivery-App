import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting
import 'package:pikaaya/create_account.dart';
import 'package:pikaaya/vehicle_details.dart'; // Add this line for file picker

class SubmitDocument extends StatefulWidget {
  const SubmitDocument({Key? key}) : super(key: key);

  @override
  State<SubmitDocument> createState() => _SubmitDocumentState();
}

class _SubmitDocumentState extends State<SubmitDocument> {
  File? _panCardImage;
  File? _aadharFrontImage;
  File? _aadharBackImage;
  File? _drivingLicenseImage;
  DateTime? _issueDate;
  DateTime? _validityDate;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source, String field) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        switch (field) {
          case 'pan':
            _panCardImage = File(pickedFile.path);
            break;
          case 'aadharFront':
            _aadharFrontImage = File(pickedFile.path);
            break;
          case 'aadharBack':
            _aadharBackImage = File(pickedFile.path);
            break;
          case 'driving':
            _drivingLicenseImage = File(pickedFile.path);
            break;
        }
      });
    }
  }

  Future<void> _pickDocument(String field) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null && result.files.single.path != null) {
      setState(() {
        File file = File(result.files.single.path!);
        switch (field) {
          case 'pan':
            _panCardImage = file;
            break;
          case 'aadharFront':
            _aadharFrontImage = file;
            break;
          case 'aadharBack':
            _aadharBackImage = file;
            break;
          case 'driving':
            _drivingLicenseImage = file;
            break;
        }
      });
    }
  }

  void _showImageSourceActionSheet(BuildContext context, String field) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.insert_drive_file),
                title: Text('Document'),
                onTap: () {
                  Navigator.pop(context);
                  _pickDocument(field);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery, field);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera, field);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, String field) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        if (field == 'issueDate') {
          _issueDate = pickedDate;
        } else if (field == 'validityDate') {
          _validityDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Document'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateAccount(),
                ));
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('PAN Card Number', 'Enter your pan number'),
              _buildTextField('Name on PAN Card', 'Enter name on PAN card'),
              _buildImageUploadSection('PAN Card Photo', _panCardImage, 'pan'),
              _buildTextField('Aadhar Card Number', 'Enter your aadhar number'),
              _buildTextField('Name on Aadhar Card', 'Enter name on Aadhar card'),
              _buildImageUploadSection('Aadhar Card Photo (Frontside)', _aadharFrontImage, 'aadharFront'),
              _buildImageUploadSection('Aadhar Card Photo (Backside)', _aadharBackImage, 'aadharBack'),
              _buildTextField('Driving Licence Number', 'Enter your driving licence number'),
              _buildDatePickerField('Issue Date', 'issueDate'),
              _buildDatePickerField('Validity Date', 'validityDate'),
              _buildTextField('Issued by', 'Enter issuing authority'),
              _buildImageUploadSection('Driving Licence Photo', _drivingLicenseImage, 'driving'),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>VehicleDetailsScreen(),));
                  },
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildImageUploadSection(String label, File? imageFile, String field) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              _showImageSourceActionSheet(context, field);
            },
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: imageFile != null
                  ? Image.file(imageFile, fit: BoxFit.cover)
                  : Center(
                child: Icon(
                  Icons.add_a_photo,
                  size: 50,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePickerField(String label, String field) {
    final DateTime? date = field == 'issueDate' ? _issueDate : _validityDate;
    final String dateText = date != null ? DateFormat('yyyy-MM-dd').format(date) : 'Select date';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          hintText: dateText,
          suffixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(),
        ),
        onTap: () {
          _selectDate(context, field);
        },
      ),
    );
  }
}
