import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File ? _storedImage;

  Future<void> _takePictures() async{
    final picker=ImagePicker();
    final imageFile=await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
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
    );
  }
}