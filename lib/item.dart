import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Item {
  String id;
  String name;
  String description;
  int price;
  bool inStock;
  String imageUrl;
  int number;
  Item(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.inStock,
      this.imageUrl,
      this.number});
  String get formattedAvailability => inStock ? "Available" : "Out of stock";
  String get formattedPrice => Item.formatter.format(this.price);
  String get formattedNumber => Item.quantity.format(this.number);
  Color get availabilityColor => inStock ? Colors.grey : Colors.red;
  static final formatter =
      NumberFormat.currency(locale: 'id_ID', symbol: " CHF ");
  static final quantity = NumberFormat.compact();
  static List<Item> get dummyItems => [
        Item(
            id: "1",
            name: "Zereshk-Polo Morgh",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: 'images/zereshkpolo.jpg',
            number: 1),
        Item(
            id: "2",
            name: "Ghormeh Sabzi",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: 'images/ghorme.jpg',
            number: 1),
        Item(
            id: "3",
            name: "Loobia-Polo",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: 'images/loobiapolo.jpg',
            number: 1),
        Item(
            id: "4",
            name: "Baghali-Polo",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: 'images/baghalipolo.jpg',
            number: 1),
        Item(
            id: "5",
            name: "Gheimeh",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: 'images/gheime.jpg',
            number: 1),
        Item(
            id: "6",
            name: "Kabab Tabei",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: 'images/kabab.jpg',
            number: 1),
        Item(
            id: "7",
            name: "Adas-Polo",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: 'images/adaspolo.jpg',
            number: 1),
        Item(
            id: "8",
            name: "Khoresh Karafs",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: 'images/karafs.jpg',
            number: 1),
        Item(
            id: "9",
            name: "Chicken Curry",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: 'images/curry.jpg',
            number: 1),
        Item(
            id: "10",
            name: "Khoresh Bademjan",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: 'images/gheimebademjoon.jpg',
            number: 1),
        Item(
            id: "11",
            name: "Khoresh Fesenjan",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: 'images/fesenjoon.jpg',
            number: 1),
        Item(
            id: "12",
            name: "Kookoo-Sabzi",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: 'images/kookoosabzi.jpg',
            number: 1),
        Item(
            id: "13",
            name: "Mirza-Ghasemi",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: 'images/mirzaghasemi.jpg',
            number: 1),
        Item(
            id: "14",
            name: "Kashk-Bademjan",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: 'images/kashkbademjoon.jpg',
            number: 1),
        Item(
            id: "15",
            name: "Ash Reshteh",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: 'images/ashreshte.jpg',
            number: 1),
        Item(
            id: "16",
            name: "Tah-Chin",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: 'images/tahchin.jpg',
            number: 1),
        Item(
            id: "17",
            name: "Soup Jo",
            description: 'More magical than ever.',
            price: 15,
            inStock: true,
            imageUrl: 'images/soupjo.jpg',
            number: 1),
        Item(
            id: "18",
            name: "Khoresh-Aloo Esfenaj",
            description: 'More magical than ever.',
            price: 20,
            inStock: true,
            imageUrl: 'images/alooesfenaj.jpg',
            number: 1),
      ];
}
