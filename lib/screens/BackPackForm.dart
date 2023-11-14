import 'package:flutter/material.dart';
import 'package:bayu_inventory/widgets/left_drawer.dart';

class Item {
  static List<Item> itemList = [];
  String name;
  int amount;
  String description;

  Item(this.name, this.amount, this.description);
}

class BackPackForm extends StatefulWidget{
  const BackPackForm({super.key});
  
  @override
  State<BackPackForm> createState() => _BackPackFormState();
}

class _BackPackFormState extends State<BackPackForm> {
  final _formkey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Nama Item",
                  labelText: "Nama Item",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
                onChanged: (String? value){
                  setState(() {
                    _name = value!;
                  });
                },
                validator: (String? value){
                  if (value == null || value.isEmpty){
                    return "Nama Item tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Jumlah",
                  labelText: "Jumlah",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value){
                  setState(() {
                    _amount = int.parse(value!);
                  });
                },
                validator: (String? value){
                  if (value == null || value.isEmpty){
                    return "Jumlah Item tidak boleh kosong";
                  }

                  if(int.tryParse(value) == null){
                    return "Harus berupa angka!";
                  }
        
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
                onChanged: (String? value){
                  setState(() {
                    _description = value!;
                  });
                },
                validator: (String? value){
                  if (value == null || value.isEmpty){
                    return "Description tidak boleh kosong!";
                  }
                  return null;
                },
              ), 
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: (){
                      if (_formkey.currentState!.validate()){
                        showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title:  const Text('Item berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama Item: $_name'),
                                    Text('Amount: $_amount'),
                                    Text('Description: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: (){
                                    Navigator.pop(context);
                                    Item.itemList.add(Item(_name, _amount, _description));
                                  },
                                ),
                              ],
                            );
                          }
                        );
                      }
                      _formkey.currentState!.reset();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
          ],),
        ),
      ),
    );
  }
}