import 'package:flutter/material.dart';
import '../domain/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({Key key, this.meal}) : super(key: key);

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Find out yourself...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 0,
                child: Container(
                  width: 200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.black.withOpacity(0.60),
                  child: Text(
                    meal.title,
                    style: TextStyle(fontSize: 26, color: Colors.orangeAccent),
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.schedule),
                    const SizedBox(width: 10),
                    Text("${meal.duration} min"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.work),
                    const SizedBox(width: 10),
                    Text(complexityText),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    const SizedBox(width: 10),
                    Text(affordabilityText),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
