import 'package:exercise/screens/login_with_bloc/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:exercise/experiments.dart';

void main() => runApp(BlocProvider(child: MaterialApp(home: Experiments())));