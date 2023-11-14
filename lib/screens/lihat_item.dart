import 'package:flutter/material.dart';
import 'package:bayu_inventory/widgets/left_drawer.dart';
import 'package:bayu_inventory/screens/BackPackForm.dart';

class LihatItem extends StatelessWidget {
  final List<Item> itemList;

  const LihatItem({Key? key, required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child : Text(
              'Daftar Item',
              style: TextStyle(
                  color: Colors.white
              )
          ),
        ),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(itemList[index].name),
                subtitle: Text('Jumlah: ${itemList[index].amount}'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Detail Item'),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nama: ${itemList[index].name}'),
                              Text('Jumlah: ${itemList[index].amount}'),
                              Text('Deskripsi: ${itemList[index].description}'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              Divider(), // Add this line to insert a divider between items
            ],
          );
        },
      ),
    );
  }
}