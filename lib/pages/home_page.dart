import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _selectedImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  requestPermissions();
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Rice Disease\nDetection App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
                Container(
                    width: double.infinity,
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: _selectedImage != null
                          ? Image.file(_selectedImage!)
                          : Align(
                              alignment: Alignment.center,
                              child: Text("Please selected an image",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ))),
                    )),
                // Image.network('https://th.bing.com/th/id/OIP.CbdzSV3wjBjHBk13IXcECAHaEK?rs=1&pid=ImgDetMain'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                      Column(
                        children: [
                          Text("Label:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white70),),
                          Text("Early Blight:",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Confidence",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white70),),
                          Text("76.68%",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)
                        ],
                      )
                  ],
                ),
        


                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0, // Set width
                      height: 70.0, // Set height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white60,
                      ),
                      child: IconButton(
                        onPressed: () {
                          _pickImageFromCamera();
                        },
                        icon: Icon(Icons.camera_alt_outlined,color: Colors.black45,),
                        iconSize: 30.0,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    Container(
                      width: 70.0, // Set width
                      height: 70.0, // Set height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white60,
                      ),
                      child: IconButton(
                        onPressed: () {
                          _pickImageFromGallery();
                        },
                        icon: Icon(Icons.image,color: Colors.black45,),
                        iconSize: 30.0,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
