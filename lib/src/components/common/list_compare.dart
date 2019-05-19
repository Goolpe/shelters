import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shelters/src/blocs/blocs.dart';
import 'package:shelters/src/widgets/widgets.dart';
import 'package:shelters/src/components/common/search_filter.dart';

class ListCompareSh extends StatelessWidget {
  ListCompareSh({
    Key key, 
    @required this.title
  }) : super(key:key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final SearchBloc searchBloc = BlocProvider.of<SearchBloc>(context);
    final SortBloc sortBloc = BlocProvider.of<SortBloc>(context);

    return BlocBuilder<SearchEvent, bool>(
      bloc: searchBloc,
      builder: (BuildContext context, bool stateSearch) {
        return BlocBuilder<SortEvent, bool>(
          bloc: sortBloc,
          builder: (BuildContext context, bool stateSort) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Scaffold(
                appBar: AppBar(
                  title: !stateSearch
                    ? Text(title)
                    : Container(
                      margin: EdgeInsets.only(left: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Найти'
                        ),
                        textInputAction: TextInputAction.search,
                      ),
                    ),
                  leading: !stateSearch
                    ? IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 20),
                      onPressed: () => Navigator.pop(context),
                    )
                    : null,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  titleSpacing: 0,
                  automaticallyImplyLeading: false,
                  actions: <Widget>[
                    !stateSearch
                    ? IconButton(
                      icon: Icon(MdiIcons.filterOutline),
                      onPressed: () => searchBloc.dispatch(SearchEvent.show),
                    )
                    : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(MdiIcons.magnify),
                          onPressed: () => searchBloc.dispatch(SearchEvent.show),
                        ),
                        VerticalDivider(),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => searchBloc.dispatch(SearchEvent.hide),
                        )
                      ]
                    )
                  ],
                ),
                body: ListView(
                  children: <Widget>[
                    AnimatedCrossFade(
                      firstChild: SearchFilterSh(sortBloc: sortBloc, stateSort: stateSort),
                      secondChild: Container(height: 0),
                      duration: Duration(milliseconds: 300),
                      crossFadeState: stateSearch
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond
                    ),
                    stateSort
                    ? CustomGridSh(url: 'https://www.flashnews.bg/wp-content/uploads/2018/11/5654150584307663008b4ed8-750-563.jpg')
                    : CustomListSh(url: 'https://www.flashnews.bg/wp-content/uploads/2018/11/5654150584307663008b4ed8-750-563.jpg')
                  ],
                )
              )
            );
          }
        );
      }
    );
  }
}