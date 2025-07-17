import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'package:another_flushbar/flushbar.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  bool isPalindrome(String text) {
    String cleaned = text.replaceAll(' ', '').toLowerCase();
    String reversed = cleaned.split('').reversed.join('');
    return cleaned == reversed;
  }

  void showTopNotification(String message, {Color color = Colors.red}) {
    Flushbar(
      message: message,
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(12),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 500),
      icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
    ).show(context);
  }

  void _checkPalindrome() {
    final input = _palindromeController.text.trim();

    if (input.isEmpty) {
      showTopNotification('Please enter a palindrome word');
      return;
    }

    final result = isPalindrome(input);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 20,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              result ? Icons.check_circle_outline : Icons.cancel_outlined,
              size: 35,
              color: result ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              result ? 'isPalindrome' : 'not palindrome',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _goToNext() {
    final name = _nameController.text.trim();

    if (name.isEmpty) {
      showTopNotification('Please enter your name');
      return;
    }

    Provider.of<UserProvider>(context, listen: false).setName(name);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SecondScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover, // biar gambar penuh
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Color.fromARGB(
                    255,
                    124,
                    193,
                    198,
                  ), // Warna lingkaran
                  child: Icon(
                    Icons.person_add_alt_1,
                    size: 50,
                    color: Colors.white, // Warna ikon
                  ),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: _nameController,
                  decoration: _inputDecoration("Name"),
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: _palindromeController,
                  decoration: _inputDecoration("Palindrome"),
                ),
                const SizedBox(height: 32),

                ElevatedButton(
                  onPressed: _checkPalindrome,
                  style: _buttonStyle(),
                  child: const Text('CHECK'),
                ),
                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: _goToNext,
                  style: _buttonStyle(),
                  child: const Text('NEXT'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      hintText: label,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF2B637B),
      foregroundColor: Colors.white,
      minimumSize: const Size.fromHeight(48),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
