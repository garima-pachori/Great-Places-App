import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectedImage;

  const ImageInput(this.onSelectedImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File ? _storedImage;

  Future<void> _takePictures() async{
    final picker=ImagePicker();
    final imageFile=await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if(imageFile==null){
      return;
    }
    setState(() {
      _storedImage=File(imageFile.path);
    });

    final appDir=await syspaths.getApplicationDocumentsDirectory();
    //This line of code gets the directory where the application 
    //can store files that are persistent, 
    //meaning they will not be deleted when the application is closed. 
    //The getApplicationDocumentsDirectory() method is provided 
    //by the path_provider package.
    final fileName=path.basename(imageFile.path);
    //This line of code gets the file name of the image that was picked. 
    //The basename() method is provided by the path package.
    final SavedImage=await await File(imageFile.path).copy('${appDir.path}/$fileName');
    //This line of code copies the image file to the application’s 
    //documents directory. The copy() method is provided by the dart:io library.
    // The copied file is then assigned to the SavedImage variable.
    widget.onSelectedImage(SavedImage);
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey
              )
            ),
            alignment: Alignment.center,
            child: _storedImage !=null
              ? Image.file(
                _storedImage!,
                fit: BoxFit.cover, 
                width: double.infinity,
              ) 
              : const Text(
                'No image Taken!',
                textAlign: TextAlign.center,
               ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.camera),
              label: const Text('Take Pictures'), 
              onPressed: () {
                _takePictures();
               },
            ),
          )
        ],
      ),
    );
  }
}