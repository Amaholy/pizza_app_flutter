import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/utils/pizza_sort.dart';
import 'package:pizza_app/utils/pizza_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List pizzaSort = [
    [
      'Popular',
      true,
    ],
    [
      'With chicken',
      false,
    ],
    [
      'Vegetarian',
      false,
    ],
    [
      'Extra cheese',
      false,
    ],
  ];

  void pizzaSortSelected(int index) {
    setState(() {
      for (int i = 0; i < pizzaSort.length; i++) {
        pizzaSort[i][1] = false;
      }
      pizzaSort[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('What sort of pizza do you want?',
                style: GoogleFonts.exo2(fontSize: 40)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.amber,
                ),
                hintText: 'find your sort of pizza...',
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: pizzaSort.length,
              itemBuilder: (context, index) {
                return PizzaSort(
                  pizzaSort: pizzaSort[index][0],
                  isSelected: pizzaSort[index][1],
                  onTap: () {
                    pizzaSortSelected(index);
                  },
                );
              },
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                PizzaTile(
                  pizzaImgPath: 'assets/images/pepperoni.png',
                  pizzaName: 'Pepperoni',
                  pizzaDesc: 'Tomato sauce, pepperoni, mozzarella',
                  pizzaPrice: '20.99',
                ),
                PizzaTile(
                  pizzaImgPath: 'assets/images/little_italy.png',
                  pizzaName: 'Little Italy',
                  pizzaDesc:
                      'pepporoni, fragrant beef, champignons, black olives, oregano, mozzarella',
                  pizzaPrice: '23.99',
                ),
                PizzaTile(
                  pizzaImgPath: 'assets/images/pizza_chicken_ranch.png',
                  pizzaName: 'Chicken Ranch',
                  pizzaDesc:
                      'garlic ranch, chicken breast, tomatoes, chopped garlic, mozzarella',
                  pizzaPrice: '26.99',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
    );
  }
}
