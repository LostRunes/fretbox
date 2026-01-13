import 'package:flutter/material.dart';

class DayOutPage extends StatefulWidget {
  const DayOutPage({super.key});

  @override
  State<DayOutPage> createState() => _DayOutPageState();
}

class _DayOutPageState extends State<DayOutPage> {
  int selectedTab = 0;

  final tabs = ["Pending", "Approved", "Rej/Can"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 150, 253),
        
        elevation: 0,
         toolbarHeight: 120,
      leading: IconButton(
  icon: const Icon(Icons.arrow_back, color: Colors.white),
  onPressed: () => Navigator.pop(context),
),

       actions: [
  IconButton(
    icon: const Icon(Icons.refresh, color: Colors.white),
    onPressed: () {},
  )
],

        centerTitle: true,
        title: const Column(
          children: [
            Text("Profile Image not set", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255)), ),
            SizedBox(height: 4),
            Text(
              "My Day Outs",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(tabs.length, (index) {
                return GestureDetector(
                  onTap: () => setState(() => selectedTab = index),
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      color: selectedTab == index
                          ? Colors.white
                          : Colors.white70,
                      fontWeight: selectedTab == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),

      /* ================= BODY ================= */

     body: const Center(
  child: Text(
    "You haven't raised any Day Out!",
    style: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),
  ),
),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           FloatingActionButton(
  backgroundColor: const Color(0xFF2196F3),
  onPressed: () {},
  child: const Icon(Icons.refresh, color: Colors.white),
),

            FloatingActionButton.extended(
  backgroundColor: const Color(0xFF2196F3),
  icon: const Icon(Icons.sort, color: Colors.white),
  label: const Text(
    "Sort",
    style: TextStyle(color: Colors.white),
  ),
  onPressed: () {},
),

          ],
        ),
      ),
    );
  }
}

/* ================= VACATION CARD ================= */

class VacationCard extends StatelessWidget {
  const VacationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Aneesha Goswami",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Icon(Icons.location_city, size: 16, color: Colors.grey),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text("QC 19, BLOCK F - 4F-189"),
                    ),
                  ],
                ),

                label("Reason"),
                value("Other"),

                label("Description"),
                value("ATTENDING TECH FEST (HACKATHON)"),

                label("Duration"),
                value("3 days, From Jan 16 To Jan 18"),

                const SizedBox(height: 8),
                Row(
                  children: const [
                    Icon(Icons.notifications_active,
                        size: 16, color: Colors.red),
                    SizedBox(width: 6),
                    Text("Urgent? : No"),
                  ],
                ),

                const SizedBox(height: 8),
                const Row(
                  children: [
                    Text("Mentor Approval: "),
                    Text("APPROVED",
                        style: TextStyle(color: Colors.green)),
                  ],
                ),

                const SizedBox(height: 4),
                Wrap(
                  spacing: 4,
                  children: const [
                    Text("Parent's Permission"),
                    Text("Approved",
                        style: TextStyle(color: Colors.green)),
                    Text("(At 13 Jan 07:06 PM)"),
                  ],
                ),

                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2196F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.show_chart),
                        label: const Text(
                          "Track Whatsapp Notification", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                          
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    )
                  ],
                ),

                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Created At: 13/01/2026",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                )
              ],
            ),

            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF6A1B9A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "ID: 40288",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget label(String text) => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(text, style: const TextStyle(color: Colors.grey)),
      );

  static Widget value(String text) => Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.w500)),
      );
}
