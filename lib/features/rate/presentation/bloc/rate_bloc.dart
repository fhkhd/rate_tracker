import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/rate.dart';
import '../../domain/usecases/get_rate_codes.dart';

part 'rate_event.dart';

part 'rate_state.dart';

class RateBloc extends Bloc<RateEvent, RateState> {
  final GetRateCodes _getRateCodes;

  RateBloc({
    required GetRateCodes getRateCodes,
  })  : _getRateCodes = getRateCodes,
        super(RateInitial()) {
    on<RateEvent>((event, emit) => emit(RateLoading()));
    on<RateFetchAllRateCodes>(_onFetchAllRateCodes);
  }

  void _onFetchAllRateCodes(
    RateFetchAllRateCodes event,
    Emitter<RateState> emit,
  ) async {
    final res = await _getRateCodes(NoParams());

    res.fold(
      (l) => emit(RateFailure(l.message)),
      (r) => emit(RateDisplaySuccess(r)),
    );
  }
}
