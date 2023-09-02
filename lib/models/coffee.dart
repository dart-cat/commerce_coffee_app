// ignore_for_file: public_member_api_docs, sort_constructors_first
class Coffee {
  final String name;
  final num price;
  final String currency;
  final String imagePath;
  final int id;
  final String description;

  Coffee({
    required this.id,
    required this.currency,
    required this.description,
    required this.name,
    required this.price,
    required this.imagePath,
  });
}
