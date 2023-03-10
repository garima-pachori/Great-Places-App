import 'package:flutter/material.dart';
import '../Widgets/image_input.dart';

class AddPlacesScreen extends StatefulWidget {
  const AddPlacesScreen({super.key});

  static const routeName='/add-place';

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titleController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
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
                    SizedBox(height: 10,),
                    ImageInput()
                  ],
                ),
              ),
            ),
          ),

          //Expanded takes all the space i.e screen-left widgets
          ElevatedButton.icon(
            onPressed: (){}, 
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
              elevation: 20,
              backgroundColor: Theme.of(context).accentColor,
            ),
          )
        ],
      ),
    );
  }
}