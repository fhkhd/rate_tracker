import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rate_tracker/features/rate/domain/usecases/get_rate_codes.dart';

import 'core/network/connection_checker.dart';
import 'features/rate/data/datasources/rate_remote_data_source.dart';
import 'features/rate/data/repositories/rate_repository_impl.dart';
import 'features/rate/domain/repositories/rate_repository.dart';
import 'features/rate/presentation/bloc/rate_bloc.dart';

part 'init_dependencies.main.dart';
