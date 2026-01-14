import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditStudentInfoPage extends StatefulWidget {
  final Map<String, String> initial;
  const EditStudentInfoPage({super.key, required this.initial});

  @override
  State<EditStudentInfoPage> createState() => _EditStudentInfoPageState();
}

class _EditStudentInfoPageState extends State<EditStudentInfoPage> {
  late Map<String, TextEditingController> c;

  @override
  void initState() {
    super.initState();
    c = widget.initial.map(
      (k, v) => MapEntry(k, TextEditingController(text: v)),
    );
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    for (final e in c.entries) {
      await prefs.setString('stu_${e.key}', e.value.text);
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Student Info')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            for (final e in c.entries)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextField(
                  controller: e.value,
                  decoration: InputDecoration(labelText: e.key),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _save,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
