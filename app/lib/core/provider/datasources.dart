import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/datasources/db.dart';

final dbProvider = Provider(
  (_) => AppDatabase(),
);

final dioProvider = Provider(
  (_) => Dio(),
);