import 'package:flutter/material.dart';

import '../../data/cart_provider.dart';
import '../../domain/entities/product_item.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.cartProvider,
    required this.product,
  });

  final CartProvider cartProvider;
  final ProductItem product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 202,
              height: 202,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  product.image,
                  width: 202,
                  height: 202,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0, top: 5.0),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                product.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Arial",
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          if (cartProvider.cartItems.containsKey(product.id))
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "${product.cost} руб.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Arial",
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          const SizedBox(height: 5),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (cartProvider.cartItems.containsKey(product.id)) ...[
                  IconButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.black12,
                      ),
                      fixedSize: MaterialStateProperty.all(Size(25, 25)),
                    ),
                    onPressed: ()=>cartProvider.removeQuantity(product.id),
                    icon: Icon(Icons.remove),
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      cartProvider.cartItems[product.id]!.quantity.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "Arial",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.black12,
                      ),
                      fixedSize: MaterialStateProperty.all(Size(25, 25)),
                    ),
                    onPressed: (){
                      cartProvider.addQuantity(product);
                      debugPrint('34234');
                    },
                    icon: Icon(Icons.add),
                    color: Colors.black,
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 40.0),
                    child: Text(
                      "${product.cost} руб.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Arial",
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 30.0),
                    child: IconButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.orange,
                        ),
                        fixedSize: MaterialStateProperty.all(Size(25, 25)),
                      ),
                      onPressed: (){
                        cartProvider.addQuantity(product);
                        debugPrint('34234');
                      },
                      icon: Icon(Icons.add, color: Colors.white, size: 25),
                    ),
                  ),

                ],
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}