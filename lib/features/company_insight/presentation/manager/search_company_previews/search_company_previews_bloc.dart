import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:company_insight_app/core/helpers/stream_transformers.dart';
import 'package:company_insight_app/core/resources/data_source.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/company_overview.dart';
import '../../../domain/use_cases/search_company_previews.dart';

part 'search_company_previews_event.dart';
part 'search_company_previews_state.dart';

@lazySingleton
class SearchCompanyOverviewsBloc extends Bloc<SearchCompanyOverviewsEvent, SearchCompanyOverviewsState> {
  SearchCompanyOverviewsBloc(this._searchCompanyOverviewsUseCase) : super(const SearchCompanyOverviewsInitial()) {
    on<SearchCompanyOverviews>(onSearchCompanyOverviews, transformer: debounce(Durations.long4));
    on<SearchCompanyOverviewsLoadMore>(onSearchMoreCompanyOverviews, transformer: droppable());
    on<ResetSearch>(onResetSearch, transformer: restartable());
  }

  static const int itemsPerPage = 100;

  final SearchCompanyPreviewsUseCase _searchCompanyOverviewsUseCase;

  void onSearchCompanyOverviews(SearchCompanyOverviews event, Emitter<SearchCompanyOverviewsState> emit) async {
    if (state is SearchCompanyOverviewsLoading || state is SearchCompanyPreviewsLoadingMore) return;

    emit(const SearchCompanyOverviewsLoading());
    final dataState = await _searchCompanyOverviewsUseCase(query: event.query, limit: itemsPerPage);
    if (dataState is DataSuccess) {
      if (dataState.data?.isEmpty ?? true) {
        emit(const SearchCompanyOverviewsEmpty());
      } else {
        bool hasReachedMax = dataState.data!.length < itemsPerPage;
        emit(SearchCompanyOverviewsDone(
          companyPreviews: dataState.data!,
          page: 1,
          hasReachedMax: hasReachedMax,
          query: event.query,
        ));
      }
    }
    if (dataState is DataFailed) {
      emit(SearchCompanyOverviewsFailure(exception: dataState.exception!));
    }
  }

  void onSearchMoreCompanyOverviews(
      SearchCompanyOverviewsLoadMore event, Emitter<SearchCompanyOverviewsState> emit) async {
    if (state is SearchCompanyOverviewsLoading || state is SearchCompanyPreviewsLoadingMore) return;
    if (state is! SearchCompanyOverviewsDone) return;
    if ((state as SearchCompanyOverviewsDone).hasReachedMax) return;
    emit(SearchCompanyPreviewsLoadingMore.fromDone(state as SearchCompanyOverviewsDone));
    final newState = state as SearchCompanyPreviewsLoadingMore;
    final newPage = newState.page + 1;
    final dataState = await _searchCompanyOverviewsUseCase(
      query: state.query ?? '',
      limit: newPage * itemsPerPage,
    );
    if (dataState is DataSuccess) {
      if (dataState.data?.isEmpty ?? true) {
        emit(const SearchCompanyOverviewsEmpty());
      } else {
        bool hasReachedMax = dataState.data!.length < newPage * itemsPerPage;
        emit(SearchCompanyOverviewsDone(
          companyPreviews: dataState.data!,
          page: newPage,
          hasReachedMax: hasReachedMax,
          query: state.query,
        ));
      }
    }
    if (dataState is DataFailed) {
      emit(SearchCompanyOverviewsFailure(exception: dataState.exception!));
    }
  }

  void onResetSearch(ResetSearch event, Emitter<SearchCompanyOverviewsState> emit) {
    emit(const SearchCompanyOverviewsInitial());
  }
}
