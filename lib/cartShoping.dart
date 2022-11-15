// ignore_for_file: implementation_imports, camel_case_types

import 'package:ecommerce_product/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CartShping_Page extends StatefulWidget {
  const CartShping_Page({super.key});

  @override
  State<CartShping_Page> createState() => _CartShping_PageState();
}

class _CartShping_PageState extends State<CartShping_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Shopping"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Row(
              children: [
                const Icon(
                  Icons.favorite,
                  size: 21,
                ),
                Text(
                  "${cartList.length}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed("CartShping_Page");
              });
            },
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        itemCount: cartList.length,
        separatorBuilder: (context, i) => const SizedBox(height: 13),
        itemBuilder: (context, i) => Container(
          height: 195,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(cartList[i].image),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Stock : ${cartList[i].stock}",
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 210,
                    child: Text(
                      cartList[i].title,
                      maxLines: 2,
                      style: GoogleFonts.openSans(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (1 < cartList[i].count) {
                              "${cartList[i].count--}";
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 5),
                      FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("${cartList[i].count}"),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 5),
                      FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (cartList[i].count < cartList[i].stock) {
                              cartList[i].count++;

                              cartList[i].total =
                                  cartList[i].count * cartList[i].price;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    "\u{20B9} : ${cartList[i].price * cartList[i].count} ",
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.favorite),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: 60,
                        child: FloatingActionButton(
                          heroTag: null,
                          mini: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "ADD",
                            style: GoogleFonts.openSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (cartList[i].addorNot) {
                                cartList[i].addorNot = false;
                                cartList.add(cartList[i]);
                              }
                              cartList[i].total =
                                  cartList[i].count * cartList[i].price;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
