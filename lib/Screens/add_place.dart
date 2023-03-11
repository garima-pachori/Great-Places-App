import 'package:flutter/material.dart';
import '../Widgets/image_input.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class AddPlacesScreen extends StatefulWidget {
  const AddPlacesScreen({super.key});

  static const routeName='/add-place';

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titleController=TextEditingController();

  File ? _pickedImage;

  void _selectImage(File pickedImage){
    _pickedImage=pickedImage;
  }

  void _savePlace(){
    if(_titleController.text.isEmpty || _pickedImage==Null){
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
    .addPlace(
      _titleController.text,
      _pickedImage!
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      controller: _titleController,
                    ),
                    const SizedBox(height: 10,),
                    ImageInput(_selectImage)
                  ],
                ),
              ),
            ),
          ),

          //Expanded takes all the space i.e screen-left widgets
          ElevatedButton.icon(
            onPressed: _savePlace, 
            icon: const Icon(
              Icons.add,
              color: Colors.black87,
            ), 
            label: const Text(
              'Add Place',
              style: TextStyle(
                color: Colors.black87
              ),
            ),
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 0,
              backgroundColor: Theme.of(context).accentColor,
              onPrimary: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}