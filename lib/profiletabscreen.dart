import 'package:car_buddy/editprofilescreen.dart';
import 'package:car_buddy/loginscreen.dart';
import 'package:car_buddy/models/user.dart';
import 'package:car_buddy/myconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

class ProfileTabScreen extends StatefulWidget {
  final User user;
  const ProfileTabScreen({super.key, required this.user});

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {
  File? _image;
  late List<Widget> tabchildren;
  String maintitle = "Profile";
  late double screenHeight,screenWidth, cardwidth;
  bool isDisable = false;
  var pathAsset = "assets/images/profile.jpeg";
  var pathAsset2 = "assets/images/upload.png";

  @override
  void initState(){
    super.initState();
    print("Profile");
  }

  @override
  void dispose(){
    super.dispose();
    print("dispose");
    if(widget.user.id == 'na'){
      isDisable = true;
    } else {
      isDisable = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(54, 48, 98, 1),
        title: Text(maintitle,
        style: GoogleFonts.comfortaa(
          fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: _onlogout, 
            icon: const Icon(Icons.logout))
        ],
      ),
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Center(
          child: Column(
            children: [
                Container(
                    margin: const EdgeInsets.all(4),
                    height: screenHeight*0.4,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80)
                      ),
                      color: Color.fromRGBO(77, 76, 125, 1),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(pathAsset),
                            radius: 70,
                          ),
                        ),
                        Text(widget.user.name.toString(),
                         style: GoogleFonts.comfortaa(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ))
                      ],
                    ),
                    ),
              //purple up one
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
                    children: [
                      Text("Driver's license",
                      style: GoogleFonts.comfortaa(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              )),
                      GestureDetector(
                        onTap: _showSelectionDialog,
                        child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Card(
                  child: Container(
                    height: screenHeight*0.5,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: _image == null
                              ? AssetImage(pathAsset2)
                              : FileImage(_image!) as ImageProvider,
                          fit: BoxFit.contain,
                        ),
                      )),
                ),
              ),
                      ),
              
                    ],
                  ),
        ) // down one
            ],
          ),
        ),
      ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.push(context,
              MaterialPageRoute(builder: (content)=> EditProfileScreen(user: widget.user,)));
    },
    mouseCursor: MaterialStateMouseCursor.clickable,
    tooltip: 'Edit Profile',
    hoverElevation: 10,
    backgroundColor: const Color.fromRGBO(249, 148, 23, 1),
    child: const Icon(Icons.edit),
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _onlogout() {
    Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (content)=> const LoginScreen()));
  }

  Future<void>_showSelectionDialog() async{
    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20))),
          title: const Text("From where do you want to take the photo?"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                IconButton(
                  onPressed: _selectFromCamera, 
                  icon: const Icon(Icons.add_a_photo)),
                  const Text("Camera"),
                
                const SizedBox(
                  height: 10,
                ),
                IconButton(
                  onPressed: _selectFromGallery, 
                  icon: const Icon(Icons.add_photo_alternate)),
                  const Text("Gallery"),
              ],
            ),
          ),
        );
      }
      );
  }

   Future<void> _selectFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1200,
      maxWidth: 800,
    );

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      cropImage();
    } else {
      print('No image selected.');
    }
  }

  Future<void> _selectFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1200,
      maxWidth: 800,
    );

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      cropImage();
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: _image!.path,
      aspectRatioPresets: [
        // CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        // CropAspectRatioPreset.original,
        //CropAspectRatioPreset.ratio4x3,
        // CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.ratio3x2,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      File imageFile = File(croppedFile.path);
      _image = imageFile;

      setState(() {});
    }
  }

}