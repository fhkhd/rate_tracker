import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/rate_codes.dart';
import '../../domain/usecases/search_rate_codes.dart';

part 'rate_event.dart';

part 'rate_state.dart';

class RateBloc extends Bloc<RateEvent, RateState> {
  final SearchRateCodes _searchRateCodes;

  RateBloc({
    required SearchRateCodes searchRateCodes,
  })  : _searchRateCodes = searchRateCodes,
        super(RateInitial()) {
    on<RateEvent>((event, emit) => emit(RateLoading()));
    on<RateSearchRateCode>(_onRateSearchRateCode);
  }

  void _onRateSearchRateCode(
    RateSearchRateCode event,
    Emitter<RateState> emit,
  ) async {
    final res = await _searchRateCodes(SearchValue(value: event.value));
    res.fold(
      (l) => emit(RateFailure(l.message)),
      (r) => emit(RateSearchDisplaySuccess(r)),
    );
  }
}
