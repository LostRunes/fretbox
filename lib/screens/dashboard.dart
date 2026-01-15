import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import '../screens/vacation/vacation.dart';
import '../screens/dayout/dayout.dart';
import '../screens/emergency/emergency.dart';
import './notification/notification.dart';
import '../screens/profile.dart';
import './profile/student_id_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String name = 'User';
  String roll = '--';
  String room = '--';
  int profilePercent = 0;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'User';
      roll = prefs.getString('roll') ?? '--';
      room = prefs.getString('room') ?? '--';
      profilePercent = prefs.getInt('profilePercent') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _topHeader(),
              _searchBar(),
              _quickActions(context),
              _entryExitCard(context),
              const SizedBox(height: 20),
              _emptyState(),
              const SizedBox(height: 30),
              _footer(),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: const Color(0xFF4C8BF5),
          onPressed: () => _showQuickActions(context),
          child: const Icon(Icons.add,size: 32,color: Colors.white,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNav(context),
    );
  }

  /* ---------------- QUICK ACTION SHEET ---------------- */

  void _showQuickActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _QuickActionItem(icon: Icons.apartment, label: 'General\nGrievance'),
                  _QuickActionItem(icon: Icons.chat_bubble_outline, label: 'Add\nGrievance'),
                  _QuickActionItem(icon: Icons.wb_sunny, label: 'Add\nDayout'),
                  _QuickActionItem(icon: Icons.access_time, label: 'Add Late\nEntry'),
                  _QuickActionItem(icon: Icons.badge_outlined, label: 'Add\nVisitor'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  /* ---------------- HEADER ---------------- */

  Widget _topHeader() {
    return Container(
      height: 190,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/headerbg.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
        decoration: BoxDecoration(

          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                _headerIcon(Icons.grid_view_outlined),
                const SizedBox(width: 6),
                Image.asset('assets/fretboxlogo.png', height: 59),
                const Spacer(),
               _headerIcon(
  Icons.badge,
  onTap: () {
    showDialog(
      context: context,
      builder: (_) => const StudentIdCard(),
    );
  },
),

                const SizedBox(width: 14),
                _headerIcon(Icons.refresh),
                const SizedBox(width: 14),
                _headerIcon(Icons.logout),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 30),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '$profilePercent%',
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Roll No - $roll',
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Text(
                      room,
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 85),
                  child: Image.asset('assets/kiitlogo.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

Widget _headerIcon(IconData icon, {VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Icon(
      icon,
      color: Colors.white,
      size: 28,
    ),
  );
}


  /* ---------------- SEARCH ---------------- */

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for Leave, Complaints, etc...',
          suffixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  /* ---------------- QUICK ACTIONS ---------------- */

  Widget _quickActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ActionIcon(
            image: Image.asset('assets/Group 1.png',height: 36,),
            label: 'Vacation',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MyVacationsPage()),
              );
            },
          ),
          _ActionIcon(
            image: Image.asset('assets/Group 2.png',height: 36,),
            label: 'Dayout',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DayOutPage()),
              );
            },
          ),
           _ActionIcon(
              image: Image.asset('assets/Group 3.png',height :36),
              label: 'Grievance'),
          _ActionIcon(
              image: Image.asset('assets/Group 4.png',height: 36),
              label: 'See more'),
        ],
      ),
    );
  }

  /* ---------------- ENTRY EXIT ---------------- */

  Widget _entryExitCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: MediaQuery.of(context).size.width - 24,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade400, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HEADER
            Row(
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Live',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Entry/Exit Log',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const Spacer(),
                const Text(
                  'Your Status',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // DATE
            const Text(
              'Wed, 14 Jan 2026 | 1:30 AM',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 14),

            // BUTTON ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child :Row(
                    children:
                    [_pillButton('Exit'),
                    SizedBox(width: 20,),
                    Text("--")],

                    ),
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(18)
                  ),
                ),
                Container(
                  child :Row(
                    children:
                    [_pillButton('Exit'),
                      SizedBox(width: 20,),
                      Text("--")],

                  ),
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(18)
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }


  /* ---------------- EMPTY ---------------- */

  Widget _emptyState() {
    return Column(
      children: [
        Image.asset('assets/calendar.png', height: 190),
        const SizedBox(height: 10),
        const Text(
          "You've no activities yet",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ],
    );
  }

  /* ---------------- FOOTER ---------------- */

  Widget _footer() {
    return Column(
      children: [
        Image.asset('assets/fretboxlogo.png', height: 24),
        const SizedBox(height: 4),
        const Text(
          'Powered by: FretBox',
          style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 4),
        const Text(
          'v3.10.4+204',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  /* ---------------- BOTTOM NAV ---------------- */

  Widget _bottomNav(BuildContext context) {
    return BottomAppBar(
      notchMargin: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const
              _NavItem(
                  icon: FluentIcons.home_48_regular,
                  label: 'Home',
                  active: true),
              _NavItem(
                icon: Icons.warning,
                label: 'Emergency',
                color: Colors.red,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EmergencyPage()),
                  );
                },
              ),
              const SizedBox(width: 40),
              _NavItem(
                icon: FontAwesomeIcons.bell,
                label: 'Notification',

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NotificationPage()),
                  );
                },
              ),
              _NavItem(
                icon: MdiIcons.accountOutline,
                size: 32,
                label: 'Profile',
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfilePage()),
                  );
                  _loadUser(); // 🔁 refresh after profile edit
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _pillButton(String text) {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }


}

/* ---------------- SMALL WIDGETS ---------------- */

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickActionItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F6F8),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, size: 26, color: const Color(0xFF4C8BF5)),
        ),
        const SizedBox(height: 6),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData? icon;
  final Image? image;
  final String label;
  final VoidCallback? onTap;

  const _ActionIcon({
    this.icon,
    this.image,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          _buildIcon(),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    if (image != null) {
      return image!;
    }

    return Icon(
      icon,
      size: 26,
      color: const Color(0xFF4C8BF5),
    );
  }

}

class _LiveBadge extends StatelessWidget {
  const _LiveBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
      child: const Text('Live', style: TextStyle(color: Colors.white, fontSize: 10)),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final Color? color;
  final double size;
  final VoidCallback? onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    this.active = false,
    this.color,
    this.onTap,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 28,
            child: Icon(
              icon,
              size: size,
              color: active
                  ? const Color(0xFF4C8BF5)
                  : (color ?? Colors.grey),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: active
                  ? const Color(0xFF4C8BF5)
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
