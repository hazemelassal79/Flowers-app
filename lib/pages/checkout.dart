import 'package:flower_app/pages/details_screen.dart';
import 'package:flower_app/provider/cart.dart';
import 'package:flower_app/shared/colors.dart';
import 'package:flower_app/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});
  static const routeName = 'checkout';
  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CustomAppbar(),
        ],
        title: const Text(
          "Checkout",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: abbBarGreen,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: classInstancee.selectedProducts.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailsScreen.routeName,
                      arguments: classInstancee.selectedProducts[index],
                    );
                  },
                  title: Text(
                    classInstancee.selectedProducts[index].name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "\$ ${classInstancee.selectedProducts[index].price} ",
                    style: const TextStyle(
                      color: abbBarGreen,
                      fontSize: 14,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      classInstancee.selectedProducts[index].imgPath,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      classInstancee.delete(
                        classInstancee.selectedProducts[index],
                      );
                    },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
