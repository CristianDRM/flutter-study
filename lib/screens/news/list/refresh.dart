import 'package:exercise/screens/news/bloc/news_bloc_provider.dart';
import 'package:flutter/material.dart';

class Refresh extends StatelessWidget {
  Refresh({Key key, this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final bloc = NewsBlocProvider.of(context);
    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        await bloc.clearCache();
        await bloc.fetchTopIds();
      },
    );
  }
}