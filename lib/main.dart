import 'package:exercise/screens/login_with_bloc/bloc_provider.dart';
import 'package:exercise/screens/news/bloc/news_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:exercise/experiments.dart';

void main() => runApp(NewsBlocProvider(child: BlocProvider(child: MaterialApp(home: Experiments()))));