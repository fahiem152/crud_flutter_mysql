import 'package:crud_flutter_database_mysql/models/product_model.dart';
import 'package:crud_flutter_database_mysql/services/product_service.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _brandId = TextEditingController();
  TextEditingController _categoryId = TextEditingController();
  TextEditingController _urlImage = TextEditingController();

  void functionAddProduct() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final ProductService productService = ProductService();
      final ProductModel productModel = ProductModel(
        name: _nameController.text,
        description: _descriptionController.text,
        price: int.parse(_price.text),
        brand_id: int.parse(_brandId.text),
        category_id: int.parse(_categoryId.text),
        urlImage: _urlImage.text,
      );
      productService.addProduct(productModel).then((response) {
        if (response.statusCode < 200 || response.statusCode > 400) {
          print("Error ${response.statusCode}: ${response.reasonPhrase}");
        } else {
          print('Data Berhasil dikiirm');
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(
                  8,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'name',
                  ),
                  controller: _nameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(
                  8,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'description',
                  ),
                  controller: _descriptionController,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(
                  8,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'brand_id',
                  ),
                  controller: _brandId,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(
                  8,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'category_id',
                  ),
                  controller: _categoryId,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(
                  8,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'price',
                  ),
                  controller: _price,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(
                  8,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'url image',
                  ),
                  controller: _urlImage,
                ),
              ),
              ElevatedButton(
                onPressed: functionAddProduct,
                // Validate returns true if the form is valid, or false otherwise.
                // if (_formKey.currentState!.validate()) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       content: Text('Processing Data'),
                //     ),
                //   );
                // }

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Create",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
