import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GriveanceMain extends StatelessWidget {
  const GriveanceMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.only(right: 20),
        leading: const Icon(Icons.arrow_back_ios_rounded),
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Grievances',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 2),
            Text(
              'Count: 11',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black38,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        elevation: 0,
        actions: const [
          Icon(Icons.filter_alt_outlined,
              size: 28, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.refresh,
              size: 28, color: Colors.black),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ),
              _Box1(
                icon: Icons.report_problem,
                label: "Wifi Issue",
                label2: "(#790)",
                label3: 'Wifi not working properly,speed dropping throughout the day',
                label31: 'IT',
                label4: "August 25,2025-12:48",
                label5: "PM",
              ),
              const _Box1(
                icon: Icons.electrical_services,
                label: "AC Switch",
                label2: "(#788)",
                label3: 'AC is not turning on',
                label31: 'Electricity',
                label4: "August 25,2025-9:12",
                label5: "AM",
              ),

              const _Box1(
                icon: Icons.plumbing,
                label: "Health Faucet/Jet Spray Broken",
                label2: "(#787)",
                label3: 'Hand faucet broken',
                label31: 'Plumbing',
                label4: "August 25,2025-9:06",
                label5: "AM",
              ),

              const _Box1(
                icon: Icons.handyman,
                label: "Curtain Rod",
                label2: "(#786)",
                label3: 'Curtain holder broken',
                label31: 'Carpenter',
                label4: "August 24,2025-10:19",
                label5: "PM",
              ),

              const _Box1(
                icon: Icons.bed,
                label: "Bed",
                label2: "(#781)",
                label3: 'Bed making noise while moving',
                label31: 'Carpenter',
                label4: "August 24,2025-8:30",
                label5: "AM",
              ),

            ],
          ),
        ),
      ),
    );
  }
}

/* ---------------- CUSTOM BOX ---------------- */

class _Box1 extends StatelessWidget {
  final IconData icon;
  final String label;
  final String label2;
  final String label3;
  final String label31;
  final String label4;
  final String label5;
  final VoidCallback? onTap;

  const _Box1({
    required this.icon,
    required this.label,
    required this.label2,
    required this.label3,
    required this.label31,
    required this.label4,
    required this.label5,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                      child: (label.contains('Faucet'))
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            label2,
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black26),
                          ),
                        ],
                      )
                          : Row(
                        children: [
                          Flexible(
                            child: Text(
                              label,

                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            label2,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black26),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(35, 166, 35, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Resolved',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 10),
                Row(
                  children: [
                    _tag("Resident",
                        const Color(0xFFE8F0FE),
                        const Color(0xFF3B6EF6)),

                    const SizedBox(width: 7),

                    _tag("Medium",
                        const Color(0xFFFFF3CD),
                        const Color(0xFF856404)),

                    const SizedBox(width: 7),

                    _tag(label31,
                        const Color(0xFFE8F0FE),
                        const Color(0xFF3B6EF6)),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  label3,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 15.5),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(FontAwesomeIcons.solidCircleUser,
                        color: Colors.grey, size: 16),

                    const SizedBox(width: 7),

                    const Text("Not Assigned",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500)),

                    const Spacer(), // 🔥 FIXED ALIGNMENT

                    const Icon(FontAwesomeIcons.clock,
                        color: Colors.grey, size: 16),

                    const SizedBox(width: 7),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label4,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500)),

                        Text(label5,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tag(String text, Color bg, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
