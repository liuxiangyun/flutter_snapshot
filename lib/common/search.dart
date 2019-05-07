import 'package:flutter/material.dart';
import 'package:flutter_snapshot/test/test.dart';
import 'package:flutter_snapshot/style/color.dart';
import 'package:flutter_snapshot/style/text_style.dart';
import 'package:flutter_snapshot/data/video.dart';
import 'package:flutter_snapshot/common/main_page.dart';

class Search extends SearchDelegate<String> {
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
    );
  }

  ///搜索框右边的widget
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = "")];
  }

  ///搜索框左边的widget
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back), onPressed: () => close(context, query));
  }

  List<String> _getSuggestions() {
    List<String> suggestionsData = List<String>();
    if (query.isNotEmpty) {
      suggestionsData =
          Test.suggestionsData.where((name) => name.contains(query)).toList();
    }
    return suggestionsData;
  }

  ///关键词联想
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionsData = _getSuggestions();
    return Card(
      child: ListView.builder(
        itemBuilder: (context, index) {
          String name = suggestionsData[index];
          return ListTile(
            title: RichText(
              text: TextSpan(
                  text: name.substring(0, name.indexOf(query)),
                  style: greyTextStyleLight,
                  children: [
                    TextSpan(
                        text: name.substring(name.indexOf(query),
                            query.length + name.indexOf(query)),
                        style: TextStyle(
                            color: greyTextColorPrimary,
                            fontSize: greyFontSize,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: name.substring(
                          query.length + name.indexOf(query),
                        ),
                        style: greyTextStyleLight),
                  ]),
            ),
          );
        },
        itemCount: suggestionsData.length,
      ),
    );
  }

  ///搜索结果
  @override
  Widget buildResults(BuildContext context) {
    List<String> suggestionsData = _getSuggestions();
    List<Video> data = Test.builderData();
    List<Video> result = List<Video>();
    suggestionsData.forEach((name) {
      result.addAll(data.where((video) => name == video.name).toList());
    });

    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return buildItem(result[index]);
        });
  }
}
