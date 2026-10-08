import 'package:flutter/material.dart';

import 'package:southsea_cinema/constants.dart';

import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        child: Column(
          children: [
            const Text('Fast & Furious', style: cinemaHeaderStyle),
            const Text(
                'A group of street racers become involved in dangerous races and criminal activities.',
                style: TextStyle(color: cinemaFontMuted)),
            const Row(
              children: [
                Icon(Icons.schedule),
                Text('Runtime: 1 hour 47 minutes'),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.movie),
                Text('Age rating: 12A'),
              ],
            ),
            DropdownMenu<int>(
              initialSelection: 1,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketQuantity = value;
                  });
                }
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
                DropdownMenuEntry(value: 5, label: '5'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bookingMessage =
                      '$_ticketQuantity ticket(s) added to your order.';
                });
              },
              child: const Text('Add to order'),
            ),
            Text(_bookingMessage),
          ],
        ),
      ),
    );
  }
}
