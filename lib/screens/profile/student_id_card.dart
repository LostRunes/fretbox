import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './edit_student_info.dart';

class StudentIdCard extends StatefulWidget {
  const StudentIdCard({super.key});

  @override
  State<StudentIdCard> createState() => _StudentIdCardState();
}

class _StudentIdCardState extends State<StudentIdCard> {
  late Map<String, String> data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      data = {
        'fretbox': prefs.getString('stu_fretbox_id') ?? '18092',
        'admission': prefs.getString('stu_admission') ?? 'N/A',
        'roll': prefs.getString('stu_roll') ?? '2430256',
        'name': prefs.getString('stu_name') ?? 'User',
        'hostel': prefs.getString('stu_hostel') ?? 'QC 01',
        'room': prefs.getString('stu_room') ?? '1D-13 (2S NAC)',
        'course': prefs.getString('stu_course') ?? 'BTECH',
        'branch': prefs.getString('stu_branch') ?? 'ECSE',
        'year': prefs.getString('stu_year') ?? '2',
        'cgpa': prefs.getString('stu_cgpa') ?? 'N/A',
        'percent': prefs.getString('stu_profile_percent') ?? '26',
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/studentinfobg.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 6),
                Text(
                  'KIIT University',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white,
                  child: Text(
                    '${data['percent']}%',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                _row('Fretbox ID', data['fretbox']!),
                _row('Admission number', data['admission']!),
                _row('Roll no', data['roll']!),
                _row('Student Name', data['name']!),
                _row('Hostel', data['hostel']!),
                _row('Room & Bed type', data['room']!),
                _row('Course List', data['course']!),
                _row('Branch', data['branch']!),
                _row('Year', data['year']!),
                _row('CGPA', data['cgpa']!),

                const SizedBox(height: 12),

                /* 🔒 INVISIBLE EDIT ZONE */
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    final updated = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditStudentInfoPage(initial: data),
                      ),
                    );
                    if (updated == true) _load();
                  },
                  child: const SizedBox(
                    height: 18, // invisible tap strip
                    width: double.infinity,
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF4C8BF5), // or any bg you want
    foregroundColor: Colors.white, // 👈 THIS makes icon + text white
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  onPressed: () {},
  icon: const Icon(Icons.download),
  label: const Text('Download as PDF'),
),

                ),
              ],
            ),
          ),

          // Close button
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                child: Icon(Icons.close, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)))),
          const Text(':  ', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
