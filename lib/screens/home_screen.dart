import 'package:crud_flutter_database_mysql/models/product_model.dart';
import 'package:crud_flutter_database_mysql/screens/add_product_screen.dart';
import 'package:crud_flutter_database_mysql/services/product_service.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ProductModel> _product;
  bool loading = true;

  _getDataProduct() async {
    _product = await ProductService.getProducts();
    if (mounted) {
      setState(() {
        loading = false;
      });
    }

    print(_product);
  }

  @override
  void initState() {
    super.initState();
    _getDataProduct();
    _product = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProductScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: _product.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            height: 100,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    child: Text(
                        // _product[index].id.toString(),
                        "1"),
                  ),
                ),
                // const SizedBox(
                //   width: 8,
                // ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _product[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        _product[index].description,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Rp. ${_product[index].price}",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
// Container(
//               margin: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.grey.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               padding: EdgeInsets.all(12),
//               height: 100,
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     child: Text("1"),
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Title"),
//                       Text("Description"),
//                       Text("Price"),
//                     ],
//                   ),
//                   Spacer(),
//                   Row(
//                     children: [
//                       IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
//                       IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
//                     ],
//                   )
//                 ],
//               ),
//             ),