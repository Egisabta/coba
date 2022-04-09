import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: (Icons.account_circle_outlined),
              text: 'Profil',
              onTap: () {
                DefaultTabController.of(context)?.animateTo(0);
                Navigator.pop(context);
              }),
          _drawerItem(
              icon: (Icons.account_box_outlined),
              text: 'Portofolio',
              onTap: () {
                DefaultTabController.of(context)?.animateTo(1);
                Navigator.pop(context);
              }),
          _drawerItem(
              icon: (Icons.mail),
              text: 'Contact',
              onTap: () {
                DefaultTabController.of(context)?.animateTo(2);
                Navigator.pop(context);
              }),
          Divider(height: 20.0, thickness: 3),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
          ),
          _drawerItem(icon: Icons.app_settings_alt_outlined, text: "settings", onTap: () => print("dalam tahapan pengembangan")),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(image: AssetImage('assets/foto/user.png'), fit: BoxFit.cover),
    ),
    accountName: Text('Egi Sabta Hiro'),
    accountEmail: Text('egisabta76@gmail.com'),
  );
}

Widget _drawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
