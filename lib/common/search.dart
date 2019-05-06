import 'package:flutter/material.dart';
import 'package:flutter_snapshot/test/test.dart';
import 'package:flutter_snapshot/style/color.dart';
import 'package:flutter_snapshot/style/text_style.dart';
import 'package:flutter_snapshot/style/font_size.dart';

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

  ///关键词联想
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchData =
        Test.suggestionsData.where((name) => name.contains(query)).toList();

    return Card(
      child: ListView.builder(
        itemBuilder: (context, index) {
          String name = searchData[index];
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
        itemCount: searchData.length,
      ),
    );
  }

  ///搜索结果
  @override
  Widget buildResults(BuildContext context) {
    return null;
  }
}
