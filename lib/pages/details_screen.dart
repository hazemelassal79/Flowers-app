import 'package:flower_app/models/item.dart';
import 'package:flower_app/shared/colors.dart';
import 'package:flower_app/shared/custom_appbar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = 'details';
  bool isShowMore = true;
  Item product;
  DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CustomAppbar(),
        ],
        title: const Text(
          "Details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: abbBarGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.product.imgPath),
            const SizedBox(height: 10),
            Text(
              "\$ ${widget.product.price}",
              style: const TextStyle(fontSize: 20),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
              ],
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  "Description :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.product.detail,
                style: const TextStyle(
                  fontSize: 16,
                ),
                maxLines: widget.isShowMore ? 3 : null,
                overflow: TextOverflow.fade,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.isShowMore = !widget.isShowMore;
                });
              },
              child: Text(
                widget.isShowMore ? "Show More" : "Show Less",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
