import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rate_tracker/features/rate/domain/entities/pair_codes.dart';

import '../../domain/entities/rate_codes.dart';
import '../../domain/usecases/pair_rate_codes.dart';
import '../../domain/usecases/search_rate_codes.dart';

part 'rate_event.dart';

part 'rate_state.dart';

class RateBloc extends Bloc<RateEvent, RateState> {
  final SearchRateCodes _searchRateCodes;
  final PairRateCodes _pairRateCodes;
  RateCode? _firstRateCode;

  RateBloc({
    required SearchRateCodes searchRateCodes,
    required PairRateCodes pairRateCodes,
  })  : _searchRateCodes = searchRateCodes,
        _pairRateCodes = pairRateCodes,
        super(RateInitial()) {
    on<RateEvent>((event, emit) => emit(RateLoading()));
    on<RateSearchRateCode>(_onRateSearchRateCode);
    on<RateSelectFirstRateCode>(_onRateSelectFirstRateCode);
    on<RateSelectSecondRateCode>(_onRateSelectSecondRateCode);
    on<RateRestSelection>(_onRateRestSelection);
    on<RatePairRateCodes>(_onRatePairRateCodes);
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
            emit(FirstRateSearch(_firstRateCode!));
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
    emit(SecondRateSearch(_firstRateCode!, event.secondRateCode));
  }

  void _onRateRestSelection(
    RateRestSelection event,
    Emitter<RateState> emit,
  ) async {
    _firstRateCode = null;
    emit(RateInitial());
  }

  void _onRatePairRateCodes(
    RatePairRateCodes event,
    Emitter<RateState> emit,
  ) async {
    final res = await _pairRateCodes(PairCodesParams(
        firstCode: event.firstCode, secondCode: event.secondCode));
    res.fold((l) => emit(RateFailure(l.message)),
        (r) => emit(RatePairRatesResult(r)));
  }
}
