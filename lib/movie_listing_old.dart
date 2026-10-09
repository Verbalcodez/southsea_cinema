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
        title: const Text(
          appTitle,
          style: cinemaHeaderStyle,
        ),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(
          color: cinemaBrand,
        ),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        color: cinemaBackground,
        padding: const EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Fast & Furious',
                          style: cinemaHeaderStyle,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'A group of street racers become involved in '
                          'dangerous races and criminal activities.',
                          style: TextStyle(
                            color: cinemaFontMuted,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Icon(
                              Icons.schedule,
                              color: cinemaBrand,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Runtime: 1 hour 47 minutes',
                              style: TextStyle(
                                color: cinemaFontWhite,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(
                              Icons.movie,
                              color: cinemaBrand,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Age rating: 12A',
                              style: TextStyle(
                                color: cinemaFontWhite,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Select ticket quantity:',
                          style: TextStyle(
                            color: cinemaFontWhite,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
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
                            DropdownMenuEntry(
                              value: 1,
                              label: '1',
                            ),
                            DropdownMenuEntry(
                              value: 2,
                              label: '2',
                            ),
                            DropdownMenuEntry(
                              value: 3,
                              label: '3',
                            ),
                            DropdownMenuEntry(
                              value: 4,
                              label: '4',
                            ),
                            DropdownMenuEntry(
                              value: 5,
                              label: '5',
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _bookingMessage = '$_ticketQuantity ticket(s) '
                                  'added to your order.';
                            });
                          },
                          child: const Text('Add to order'),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _bookingMessage,
                          style: const TextStyle(
                            color: cinemaBrandLight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fast & Furious',
                    style: cinemaHeaderStyle,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'A group of street racers become involved in '
                    'dangerous races and criminal activities.',
                    style: TextStyle(
                      color: cinemaFontMuted,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: cinemaBrand,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Runtime: 1 hour 47 minutes',
                        style: TextStyle(
                          color: cinemaFontWhite,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(
                        Icons.movie,
                        color: cinemaBrand,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Age rating: 12A',
                        style: TextStyle(
                          color: cinemaFontWhite,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Select ticket quantity:',
                    style: TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
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
                      DropdownMenuEntry(
                        value: 1,
                        label: '1',
                      ),
                      DropdownMenuEntry(
                        value: 2,
                        label: '2',
                      ),
                      DropdownMenuEntry(
                        value: 3,
                        label: '3',
                      ),
                      DropdownMenuEntry(
                        value: 4,
                        label: '4',
                      ),
                      DropdownMenuEntry(
                        value: 5,
                        label: '5',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _bookingMessage = '$_ticketQuantity ticket(s) '
                            'added to your order.';
                      });
                    },
                    child: const Text('Add to order'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _bookingMessage,
                    style: const TextStyle(
                      color: cinemaBrandLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
