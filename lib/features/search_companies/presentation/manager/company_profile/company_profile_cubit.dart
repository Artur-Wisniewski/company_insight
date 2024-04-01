import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/resources/data_source.dart';
import '../../../domain/entities/company_profile.dart';
import '../../../domain/use_cases/get_company_profile.dart';

part 'company_profile_state.dart';

class CompanyProfileCubit extends Cubit<CompanyProfileState> {
  CompanyProfileCubit(this._getCompanyProfileUseCase) : super(CompanyProfileInitial());

  final GetCompanyProfileUseCase _getCompanyProfileUseCase;

  void getCompanyProfile(String symbol) async {
    emit(CompanyProfileLoading());
    final dataState = await _getCompanyProfileUseCase(symbol: symbol);
    if (dataState is DataSuccess) {
      emit(CompanyProfileDone(companyProfile: dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(CompanyProfileFailure(exception: dataState.exception!));
    }
  }
}
