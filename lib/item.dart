import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Item {
  String id;
  String name;
  String description;
  int price;
  bool inStock;
  String imageUrl;

  Item(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.inStock,
      this.imageUrl});

  String get formattedAvailability => inStock ? "Available" : "Out of stock";
  String get formattedPrice => Item.formatter.format(this.price);
  Color get availabilityColor => inStock ? Colors.grey : Colors.red;
  static final formatter =
      NumberFormat.currency(locale: 'id_ID', symbol: "CHF");
  static List<Item> get dummyItems => [
        Item(
            id: "1",
            name: "Zereshk-Polo Morgh",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: "images/zereshkpolo.jpg"),
        Item(
            id: "2",
            name: "Ghormeh Sabzi",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: "images/ghorme.jpg"),
        Item(
            id: "3",
            name: "Loobia-Polo",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: "images/loobiapolo.jpg"),
        Item(
            id: "4",
            name: "Baghali-Polo",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: "images/baghalipolo.jpg"),
        Item(
            id: "5",
            name: "Gheimeh",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: "images/gheime.jpg"),
        Item(
            id: "6",
            name: "Kabab Tabei",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: "images/kabab.jpg"),
        Item(
            id: "7",
            name: "Adas-Polo",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: "images/adaspolo.jpg"),
        Item(
            id: "8",
            name: "Khoresh Karafs",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: "images/karafs.jpg"),
        Item(
            id: "9",
            name: "Chicken Curry",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: "images/curry.jpg"),
        Item(
            id: "10",
            name: "Khoresh Bademjan",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: "images/gheimebademjoon.jpg"),
        Item(
            id: "11",
            name: "Khoresh Fesenjan",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: "images/fesenjoon.jpg"),
        Item(
            id: "12",
            name: "Kookoo-Sabzi",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: "images/kookoosabzi.jpg"),
        Item(
            id: "13",
            name: "Mirza-Ghasemi",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: "images/mirzaghasemi.jpg"),
        Item(
            id: "14",
            name: "Kashk-Bademjan",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: "images/kashkbademjoon.jpg"),
        Item(
            id: "15",
            name: "Ash Reshteh",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: "images/ashreshte.jpg"),
        Item(
            id: "16",
            name: "Tah-Chin",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: "images/tahchin.jpg"),
        Item(
            id: "17",
            name: "Soup Jo",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: "images/soupjo.jpg"),
        Item(
            id: "18",
            name: "Khoresh-Aloo Esfenaj",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: "images/alooesfenaj.jpg"),
      ];
}
