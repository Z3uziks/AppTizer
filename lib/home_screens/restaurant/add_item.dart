import 'package:flutter/material.dart';
import 'package:tastybite/home_screens/menus/menuitemspage.dart'; // go get the class MenuItem
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:flutter/services.dart'; 


class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';
  String _ingredients = '';
  double _rating = 0.0;
  String _cookTime = '';
  double _price = 0.0;
  List<String> _selectedAllergens = [];
  double _calories = -1.0;
  double _proteins = -1.0;
  double _carbohydrates = -1.0;
  double _fats = -1.0;

  @override
  Widget build(BuildContext context) {


    final _allergens = [
      'Glúten',
      'Lactose',
      'Nozes',
      'Frutos do Mar',
      'Soja',
      'Ovos',
      'Amendoins',
      'Peixe',
      'Mostarda',
      'Sésamo',
      'Aipo',
      'Sulfitos',
      'Tremoços',
      'Moluscos'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Prato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome', hintText: 'Ex: Bife à Portuguesa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira o nome do prato';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição', hintText: 'Ex: Bife de vaca com batatas fritas e ovo estrelado'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira a descrição do prato';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ingredientes', hintText: 'Ingrediente1, Ingrediente2, ...'),
                
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira os ingredientes do prato';
                  }
                  return null;
                },
                onSaved: (value) {
                  _ingredients = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tempo de Preparação', hintText: 'Ex: 30 (minutos)'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly // Allow only digits
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira o tempo de preparação do prato';
                  }
                  return null;
                },
                onSaved: (value) {
                  _cookTime = value!;
                },
              ),

              TextFormField(
                decoration: InputDecoration(labelText: 'Preço', hintText: 'Ex: 10.50 (€)'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.allow(
                    RegExp(r'^[\d\.]*$'), // Allows digits and a single decimal point
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira o preço do prato';
                  }
                  return null;
                },
                onSaved: (value) {
                  _price = double.parse(value!);
                },
              ),
              // Add a dropdown or multi-select for allergens
              // For simplicity, I'm using a multi-select checkbox
              const SizedBox(height: 10),
              MultiSelectDialogField<String>(
                items: _allergens.map((allergen) => MultiSelectItem<String>(allergen, allergen)).toList(),
                title: Text("Alergénios"),
                searchable: true,
                selectedColor: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                buttonText: Text(
                  "Selecionar Alergénios",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                  setState(() {
                    _selectedAllergens = results;
                  });
                },
                chipDisplay: MultiSelectChipDisplay(
                  onTap: (value) {
                    setState(() {
                      _selectedAllergens.remove(value);
                    });
                  },
                )
              ),
              const SizedBox(height: 10),

            

              
              TextFormField(
                decoration: InputDecoration(labelText: 'Calorias', hintText: 'Ex: 500 (kcal)'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly // Allow only digits
                ],
                onSaved: (value) {
                  _calories = value==''? _calories : double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Proteína', hintText: 'Ex: 20 (g)'),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly // Allow only digits
                ],
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _proteins = value==''? _proteins: double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Carboidratos', hintText: 'Ex: 50 (g)'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly // Allow only digits
                ],
                
                onSaved: (value) {
                  _carbohydrates = value==''? _carbohydrates : double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Gorduras', hintText: 'Ex: 30 (g)'),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly // Allow only digits
                ],
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _fats = value==''? _fats : double.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // You can now use the entered data to create a MenuItem object
                    // and pass it back to the previous page
                    // For example:
                    final newDish = MenuItem(
                      name: _name,
                      description: _description,
                      ingredients: _ingredients,
                      rating: 0,
                      newitem: true,
                      cookTime: '${_cookTime}m',
                      price: "€${_price.toStringAsFixed(2)}",
                      allergens: _selectedAllergens.join(', '),
                      nutrition: buildNutritionString(),
                      image: 'assets/grelhado.jpg',
                    );
                    Navigator.pop(context, newDish);  
                  }
                },
                child: Text('Adicionar Prato'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  String buildNutritionString() {
    List<String> components = [];

    if (_calories >= 0) components.add('Calorias: ${_calories}kcal');
    if (_proteins >= 0) components.add('Proteína: ${_proteins}g');
    if (_carbohydrates >= 0) components.add('Carboidratos: ${_carbohydrates}g');
    if (_fats >= 0) components.add('Gorduras: ${_fats}g');

    return components.join(', ');
  }
}
