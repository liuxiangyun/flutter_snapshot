import 'package:flutter/material.dart';
import 'package:flutter_snapshot/style/text_style.dart';
import 'package:flutter_snapshot/common/search.dart';
import 'package:flutter_snapshot/router/router.dart';
import 'package:flutter_snapshot/style/color.dart';
import 'package:flutter_snapshot/data/video.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_snapshot/test/test.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "快拍Flutter版",
      theme: ThemeData(
        primaryColor: primaryColor,
        primaryColorDark: primaryColorDark,
        accentColor: accentColor,
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
      EdgeInsetsDirectional.only(top: 15.0, bottom: 15.0);

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
              onPressed: () {
                showSearch(context: context, delegate: Search());
              }),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {},
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
      backgroundColor: accentColor,
      tooltip: "拍摄",
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("确定打开相机?"),
          action: SnackBarAction(
            label: "确定",
            onPressed: () {},
            textColor: accentColor,
          ),
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
                radius: 50.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 25.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "提莫队长",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
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
              margin: const EdgeInsets.only(top: 15.0))
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
        width: 30.0,
        height: 30.0,
      ),
      title: Text(
        title,
        style: greyTextStylePrimary,
      ),
      onTap: () {},
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage>
    with AutomaticKeepAliveClientMixin<_HomePage> {
  GlobalKey<EasyRefreshState> _easyRefreshKey = GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();
  List<Video> _data;

  @override
  void initState() {
    super.initState();
    _data = List();
    _refresh();
  }

  ///下拉刷新
  void _refresh() {
    //加异步是为了等渲染完成后（build执行完）再进行操作，即使延迟时间为0秒
    Future.delayed(Duration(seconds: 0), () {
      _easyRefreshKey.currentState.callRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      key: _easyRefreshKey,
      child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            return buildItem(_data[index]);
          }),
      autoLoad: true,
      behavior: ScrollOverBehavior(),
      refreshHeader: MaterialHeader(
        key: _headerKey,
      ),
      refreshFooter: BallPulseFooter(
        color: accentColor,
        key: _footerKey,
      ),
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 1500), () {
          setState(() {
            _data.clear();
            _data.addAll(Test.builderData());
          });
        });
      },
      loadMore: () async {
        await Future.delayed(const Duration(milliseconds: 1500), () {
          setState(() {
            _data.addAll(Test.builderData());
          });
        });
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Color _getColor(int videoType) {
  if (videoType == 1) {
    return Colors.red;
  } else {
    return Colors.transparent;
  }
}

Widget buildItem(Video video) {
  return Card(
    child: Column(
      children: <Widget>[
        Stack(
          alignment: FractionalOffset(0.975, 0.025),
          children: [
            ClipRRect(
              child: FadeInImage.assetNetwork(
                placeholder: 'images/placeholder.jpg',
                image: video.cover,
                fit: BoxFit.cover,
                width: 352.0,
                height: 220.0,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(4.0),
                  topRight: const Radius.circular(4.0)),
            ),
            Icon(
              Icons.live_tv,
              color: _getColor(video.type),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 10.0, 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'images/placeholder.jpg',
                    image: video.avatar,
                    fit: BoxFit.cover,
                    width: 30.0,
                    height: 30.0,
                  ),
                  borderRadius: BorderRadius.all(const Radius.circular(25.0))),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    video.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: greyTextStylePrimary,
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.person,
                  size: 20.0,
                  color: greyTextColorLight,
                ),
              ),
              Container(
                width: 50.0,
                child: Text(
                  video.heat.toString(),
                  style: greyTextStyleLight,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0),
                width: 20.0,
                alignment: Alignment.center,
                child: Icon(
                  Icons.comment,
                  size: 18.0,
                  color: greyTextColorLight,
                ),
              ),
              Container(
                child: Text(
                  video.comment.toString(),
                  style: greyTextStyleLight,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
