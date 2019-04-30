import 'package:flutter/material.dart';
import 'package:flutter_snapshot/style/text_style.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "快拍Flutter版",
      theme: ThemeData(
        primaryColor: Color(0xFF4CAF50),
        primaryColorDark: Color(0xFF388E3C),
        accentColor: Color(0xFFFF4081),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin<Home> {
  TabController _tabController;
  List<Widget> _pages;
  List<Widget> _tabs;
  static const EdgeInsetsGeometry _tabPadding =
      EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0);

  @override
  void initState() {
    super.initState();
    _pages = [
      _HomePage(),
      _HomePage(),
      _HomePage(),
    ];
    _tabs = [
      Container(
        child: Text("关注"),
        padding: _tabPadding,
      ),
      Container(
        child: Text("全部"),
        padding: _tabPadding,
      ),
      Container(
        child: Text("热门"),
        padding: _tabPadding,
      ),
    ];
    _tabController = TabController(length: _pages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _Drawer(),
      appBar: AppBar(
        title: Text("快拍"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
        bottom: TabBar(
          tabs: _tabs,
          indicatorColor: Color(0xFFFFEB3B),
          unselectedLabelColor: Color(0x8FFFFFFF),
          labelColor: Color(0xFFFFFFFF),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: _pages,
        controller: _tabController,
      ),
      floatingActionButton: _CameraFab(),
    );
  }
}

class _CameraFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("确定打开相机?"),
          action: SnackBarAction(label: "确定", onPressed: () {}),
        ));
      },
      child: Icon(Icons.camera_alt),
    );
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _DrawerHeader(),
        Expanded(
          child: _DrawerFooter(),
        ),
      ],
    ));
  }
}

class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
      width: 305.0,
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 45.0, 16.0, 16.0),
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("images/ic_user_avatar.jpg"),
                radius: 50,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "提莫队长",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: Text(
                        "天蝎座",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            child: Text(
              "我是你们尊敬的提莫队长，噩梦人机再次来袭，享受被我支配的恐惧吧。。。哈哈哈。。。哈哈哈。。。哈哈哈。。。",
              style: TextStyle(color: Colors.white),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          )
        ],
      ),
    );
  }
}

class _DrawerFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _DrawerListTile("images/ic_wallet.png", "我的钱包"),
        _DrawerListTile("images/ic_reward.png", "赞赏"),
        _DrawerListTile("images/ic_collect.png", "关注"),
        _DrawerListTile("images/ic_task.png", "任务"),
        _DrawerListTile("images/ic_browsing_history.png", "浏览记录"),
        _DrawerListTile("images/ic_setting.png", "设置"),
      ],
    );
  }
}

class _DrawerListTile extends StatelessWidget {
  final String assetName;
  final String title;

  _DrawerListTile(this.assetName, this.title, {Key key})
      : assert(assetName != null),
        assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        assetName,
        color: greyTextColorPrimary,
        width: 33.0,
        height: 33.0,
      ),
      title: Text(
        title,
        style: greyTextStylePrimary,
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  @override
  Widget build(BuildContext context) {
    return Text("sss");
  }
}
