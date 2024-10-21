import 'package:flower_app/models/item.dart';
import 'package:flower_app/provider/cart.dart';
import 'package:flower_app/shared/colors.dart';
import 'package:flower_app/shared/custom_appbar.dart';
import 'package:flower_app/shared/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<Cart>(context);
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        actions: const [
          CustomAppbar(),
        ],
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: abbBarGreen,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 33,
              ),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'details',
                        arguments: items[index]);
                  },
                  child: GridTile(
                    footer: GridTileBar(
                      trailing: IconButton(
                          color: const Color.fromARGB(255, 62, 94, 70),
                          onPressed: () {
                            classInstancee.add(items[index]);
                          },
                          icon: const Icon(Icons.add)),
                      leading: Text("\$ ${items[index].price}"),
                      title: const Text(""),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          bottom: -9,
                          right: 10,
                          left: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(55),
                            child: Image.asset(
                              items[index].imgPath,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
