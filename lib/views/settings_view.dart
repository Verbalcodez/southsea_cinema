import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/user_settings.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

const String prefAddress = 'user_address';
const String prefEmail = 'user_email';
const String prefPatronNumber = 'user_patron_number';
const String prefNewsletter = 'user_newsletter';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() {
    return _SettingsViewState();
  }
}

class _SettingsViewState extends State<SettingsView> {
  late TextEditingController _addressController;
  late TextEditingController _emailController;
  late TextEditingController _patronNumberController;
  bool _receiveNewsByEmail = false;
  String _confirmationMessage = '';

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController();
    _emailController = TextEditingController();
    _patronNumberController = TextEditingController();
    _loadSettings();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _emailController.dispose();
    _patronNumberController.dispose();
    super.dispose();
  }

  Future<void> _loadSettings() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    final String? savedAddress = await prefs.getString(prefAddress);
    final String? savedEmail = await prefs.getString(prefEmail);
    final String? savedPatronNumber = await prefs.getString(prefPatronNumber);
    final bool? savedNewsletter = await prefs.getBool(prefNewsletter);

    String address = '';
    if (savedAddress != null) {
      address = savedAddress;
    }
    String email = '';
    if (savedEmail != null) {
      email = savedEmail;
    }
    String patronNumber = '';
    if (savedPatronNumber != null) {
      patronNumber = savedPatronNumber;
    }
    bool newsletter = false;
    if (savedNewsletter != null) {
      newsletter = savedNewsletter;
    }

    if (!mounted) {
      return;
    }
    setState(() {
      _addressController.text = address;
      _emailController.text = email;
      _patronNumberController.text = patronNumber;
      _receiveNewsByEmail = newsletter;
    });
  }

  Future<void> _saveSettings() async {
    final String address = _addressController.text.trim();
    final String email = _emailController.text.trim();
    final String patronNumber = _patronNumberController.text.trim();

    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setString(prefAddress, address);
    await prefs.setString(prefEmail, email);
    await prefs.setString(prefPatronNumber, patronNumber);
    await prefs.setBool(prefNewsletter, _receiveNewsByEmail);

    final UserSettings settings = UserSettings(
      address: address,
      email: email,
      patronNumber: patronNumber,
      receiveNewsByEmail: _receiveNewsByEmail,
    );

    if (!mounted) {
      return;
    }
    setState(() {
      _confirmationMessage = 'Settings saved for ${settings.email}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appTitle,
          style: cinemaHeaderStyle,
        ),
      ),
      drawer: const NavDrawer(),
      body: Container(
        color: cinemaBackground,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Settings',
                style: cinemaHeaderStyle,
              ),
              const SizedBox(height: 16),
              const Text(
                'Address',
                style: TextStyle(color: cinemaFontMuted),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _addressController,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your address',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Email Address',
                style: TextStyle(color: cinemaFontMuted),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Patron Number',
                style: TextStyle(color: cinemaFontMuted),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _patronNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your patron number',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Preferences',
                style: TextStyle(color: cinemaFontMuted),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Expanded(
                    child: Text('Receive news by email'),
                  ),
                  Switch(
                    value: _receiveNewsByEmail,
                    onChanged: (bool value) {
                      setState(() {
                        _receiveNewsByEmail = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cinemaSurface,
                      foregroundColor: cinemaFontWhite,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 12),
                  PrimaryButton(
                    label: 'Save Settings',
                    onPressed: _saveSettings,
                  ),
                ],
              ),
              if (_confirmationMessage.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  _confirmationMessage,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: cinemaFontWhite,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
