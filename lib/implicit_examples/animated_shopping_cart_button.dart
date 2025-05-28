import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            isExpanded = !isExpanded;
            setState(() {});
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: isExpanded ? 200 : 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isExpanded ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(isExpanded ? 40 : 10.0),
            ),
            child: Center(
              child: !isExpanded
                  ? const Icon(Icons.shopping_cart, color: Colors.white)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check, color: Colors.white),
                        SizedBox(width: 20),
                        AnimatedOpacity(
                          opacity: isExpanded ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: Text("Add to cart"),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
