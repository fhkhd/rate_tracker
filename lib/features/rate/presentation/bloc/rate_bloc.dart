import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/rate_codes.dart';
import '../../domain/usecases/get_rate_codes.dart';
import '../../domain/usecases/search_rate_codes.dart';

part 'rate_event.dart';

part 'rate_state.dart';

class RateBloc extends Bloc<RateEvent, RateState> {
  final GetRateCodes _getRateCodes;
  final SearchRateCodes _searchRateCodes;

  RateBloc({
    required GetRateCodes getRateCodes,
    required SearchRateCodes searchRateCodes,
  })  : _getRateCodes = getRateCodes,
        _searchRateCodes = searchRateCodes,
        super(RateInitial()) {
    on<RateEvent>((event, emit) => emit(RateLoading()));
    on<RateFetchAllRateCodes>(_onFetchAllRateCodes);
    on<RateSearchRateCode>(_onRateSearchRateCode);
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

  void _onRateSearchRateCode(
    RateSearchRateCode event,
    Emitter<RateState> emit,
  ) async {
    final res = await _searchRateCodes(SearchValue(value: event.value));

    res.fold(
      (l) => emit(RateSearchFailure(l.message)),
      (r) {
        RateCodes? rateCodes = RateCodes(
          documentation: '',
          result: '',
          termsOfUse: '',
          supportedCodes: [],
        );
        var value = event.value;
        for (var result in r.supportedCodes!) {
          if (result.code.toString().contains(value.toUpperCase())) {
            rateCodes.supportedCodes?.add(result);
          }
        }
        rateCodes != null
            ? emit(RateSearchDisplaySuccess(rateCodes))
            : emit(RateSearchDisplaySuccess(r));
      },
    );
  }
}
