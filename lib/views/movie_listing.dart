import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({super.key, required this.movie});

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
                        Text(
                          '${widget.movie.title} (${widget.movie.ageRating})',
                          style: cinemaHeaderStyle,
                        ),
                        const SizedBox(height: 12),
                        Image.asset(
                          widget.movie.imagePath,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Southsea Cinema Room',
                          style: TextStyle(
                            color: cinemaFontWhite,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.movie.screeningTime,
                          style: const TextStyle(
                            color: cinemaFontWhite,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.movie.synopsis,
                          style: const TextStyle(
                            color: cinemaFontMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tickets (\u00A3${widget.movie.ticketPrice.toStringAsFixed(2)} each):',
                          style: const TextStyle(
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
                          dropdownMenuEntries: const [
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
              return ListView(
                children: [
                  Text(
                    '${widget.movie.title} (${widget.movie.ageRating})',
                    style: cinemaHeaderStyle,
                  ),
                  const SizedBox(height: 12),
                  Image.asset(
                    widget.movie.imagePath,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Southsea Cinema Room',
                    style: TextStyle(
                      color: cinemaFontWhite,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.movie.screeningTime,
                    style: const TextStyle(
                      color: cinemaFontWhite,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.movie.synopsis,
                    style: const TextStyle(
                      color: cinemaFontMuted,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Tickets (\u00A3${widget.movie.ticketPrice.toStringAsFixed(2)} each):',
                    style: const TextStyle(
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
                    dropdownMenuEntries: const [
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
