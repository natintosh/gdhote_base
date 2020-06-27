import 'package:flutter/material.dart';
import 'package:gdhote/pages/user_profile/user_profile_page.dart';
import 'package:gdhote/utils/views/widget_view.dart';

class SearchPage extends StatefulWidget {
  static const SearchPageRouteName = '/search';

  @override
  State<StatefulWidget> createState() => _Controller();
}

class _Controller extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  int searchItemCount = 0;

  List<String> searchResult = [];

  List<String> _search = [
    'Moti Bortov',
    'Michelle Light',
    'Koon Agnis',
    'Samson White',
    'Cierra Vega',
    'Alden Cantrell',
    'Kierra Gentry',
    'Pierre Cox',
    'Thomas Crane',
    'Miranda Shaffer',
    'Bradyn Kramer',
    'Alvaro Mcgee',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _WidgetView(this);
  }

  void closePage() {
    Navigator.pop(context);
  }

  void onSearchFieldEditComplete() {
    setState(() {
      this.searchResult = _search;
    });
  }

  void onSearchItemTap(String heroTag) {
    Navigator.pushNamed(
      context,
      UserProfilePage.UserProfilePageRouteName,
      arguments: UserProfileArgument(heroTag: heroTag),
    );
  }
}

class _WidgetView extends WidgetView<SearchPage, _Controller> {
  final _Controller state;

  _WidgetView(this.state) : super(state: state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: Hero(
          tag: 'hero-tag-search',
          child: AppBar(
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: state.closePage,
            ),
            title: TextField(
              controller: state.controller,
              focusNode: state.focusNode,
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.text,
              onEditingComplete: state.onSearchFieldEditComplete,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: state.searchResult.length,
        itemBuilder: (BuildContext context, int index) {
          final heroTag = 'search-item-$index';
          final String title = state.searchResult[index];
          return ListTile(
            leading: CircleAvatar(),
            title: Text(title),
            onTap: () => state.onSearchItemTap(heroTag),
          );
        },
      ),
    );
  }
}
