import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:strike_apparel/models/product_entry.dart';
import 'package:strike_apparel/widgets/product_entry_card.dart';
import 'product_detail.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  Future<List<ProductEntry>> fetchMyProducts(CookieRequest request) async {
    // gunakan 127.0.0.1 jika run di web dev server; untuk android emulator gunakan 10.0.2.2
    final url = "http://localhost:8000/json/my-products/";
    final response = await request.get(url);

    List<ProductEntry> list = [];
    try {
      if (response != null) {
        // response di pbp_django_auth biasanya sudah di-decode menjadi objek JSON jika valid
        for (var item in response) {
          list.add(ProductEntry.fromJson(item));
        }
      }
    } catch (e) {
      // jika ada error parsing, kembalikan list kosong (atau throw jika mau)
      // print("Error parsing my products JSON: $e");
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Products"),
      ),
      body: FutureBuilder<List<ProductEntry>>(
        future: fetchMyProducts(request),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final products = snapshot.data ?? [];

          if (products.isEmpty) {
            return const Center(child: Text("You haven't created any products yet."));
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) {
              return ProductEntryCard(
                product: products[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: products[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}