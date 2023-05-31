import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather',
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
          iconTheme: const IconThemeData(color: Colors.black54),
          actions: [
            IconButton(icon: const Icon(Icons.settings), onPressed: () {})
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _weatherDescription(),
                const Divider(),
                _temperature(),
                const Divider(),
                _temperatureForecast(),
                const Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _headerImage() {
  // ignore: prefer_const_constructors
  return Container(
    decoration: const BoxDecoration(borderRadius: BorderRadius.only()),
    child: const Center(
      child: Image(
        image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl6yPJ6rcGMsKgccSXgNmr1c_fJE7niz5ZdcLG8RPotIf3N3xAFGYCens2dik7A8ndbtI&usqp=CAU'),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Column _weatherDescription() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Tuesdey _ may 27',
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.normal),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aquam pulvinar purus nec nulla condimentum egestas eu sed nulla Fusce ut suscipit sem',
        style: TextStyle(color: Colors.black54),
      )
    ],
  );
}

Row _temperature() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      SizedBox(
        width: 16.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '15° Clear',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Bishkek, Bishkek',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(
      8,
      (int index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: Chip(
              label: Container(
                child: Text(
                  '${index + 20}°C',
                  style: const TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
              avatar: Icon(
                Icons.wb_cloudy,
                color: Colors.blue.shade300,
              ),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side:
                    const BorderSide(color: Color.fromARGB(255, 210, 208, 208)),
              ),
              backgroundColor: Colors.grey.shade100),
        );
      },
    ),
  );
}

Row _footerRatings() {
  var stars = const Row(
    children: [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey,
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.grey,
      ),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const Text(
        'Info with openweathermap.org',
        style: TextStyle(fontSize: 15.0),
      ),
      stars,
    ],
  );
}
