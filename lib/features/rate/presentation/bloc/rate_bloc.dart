import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/rate_codes.dart';
import '../../domain/usecases/search_rate_codes.dart';

part 'rate_event.dart';

part 'rate_state.dart';

class RateBloc extends Bloc<RateEvent, RateState> {
  final SearchRateCodes _searchRateCodes;
  RateCode _firstRateCode = RateCode(code: '', fullName: '');

  RateBloc({
    required SearchRateCodes searchRateCodes,
  })  : _searchRateCodes = searchRateCodes,
        super(RateInitial()) {
    on<RateEvent>((event, emit) => emit(RateLoading()));
    on<RateSearchRateCode>(_onRateSearchRateCode);
    on<RateSelectFirstRateCode>(_onRateSelectFirstRateCode);
    on<RateSelectSecondRateCode>(_onRateSelectSecondRateCode);
  }

  void _onRateSearchRateCode(
    RateSearchRateCode event,
    Emitter<RateState> emit,
  ) async {
    final res = await _searchRateCodes(SearchValue(value: event.value));
    res.fold(
      (l) => emit(RateFailure(l.message)),
      (r) {
        if (_firstRateCode != null) {
          emit(RateSearchDisplaySuccess(r, _firstRateCode));
          if (event.value == '') {
            emit(FirstRateSearch(_firstRateCode));
          }
        } else {
          emit(RateSearchDisplaySuccess(r, null));
        }
      },
    );
  }

  void _onRateSelectFirstRateCode(
    RateSelectFirstRateCode event,
    Emitter<RateState> emit,
  ) {
    _firstRateCode = event.firstRateCode;
    emit(FirstRateSearch(event.firstRateCode));
  }

  void _onRateSelectSecondRateCode(
    RateSelectSecondRateCode event,
    Emitter<RateState> emit,
  ) async {
    emit(FirstRateSearch(_firstRateCode));
    emit(SecondRateSearch(_firstRateCode, event.secondRateCode));
  }
}
