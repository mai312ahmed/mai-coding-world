import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/models/project_model/testimonails_model.dart';
import 'package:mai_coding_world/services/testimonails_service.dart';

part '../states/testimonails_state.dart';

class TestimonailsCubit extends Cubit<TestimonailsState> {
  TestimonailsCubit() : super(TestimonailsInitial());

  Future<void> loadTestimonails() async {
    try {
      emit(state.copyWith(loadStatus: LoadTestimonailsStatus.loading));
      final testimonails = await TestimonailsService().getTestimonails() ?? [];
      emit(
        state.copyWith(
          loadStatus: LoadTestimonailsStatus.loaded,
          testimonails:
              testimonails.isNotEmpty ? testimonails : state.testimonails,
          rating: 0,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loadStatus: LoadTestimonailsStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
    emit(state.copyWith(loadStatus: LoadTestimonailsStatus.initial));
  }

  Future<void> addTestimonails(String name, String content) async {
    state.copyWith(addStatus: AddTestimonailsStatus.adding);
    try {
      final bool isSuccess = await TestimonailsService().addTestimonails(
        TestimonailsModel(
          content: content,
          writer: name,
          date: Timestamp.now(),
          rating: state.rating,
        ),
      );
      isSuccess
          ? loadTestimonails()
          : emit(
            state.copyWith(
              addStatus: AddTestimonailsStatus.error,
              errorMessage: "Failed to add testimonail",
            ),
          );
    } catch (e) {
      emit(
        state.copyWith(
          addStatus: AddTestimonailsStatus.error,
          errorMessage: "Failed to add testimonail",
        ),
      );
    }
    state.copyWith(addStatus: AddTestimonailsStatus.initial);
  }

  void setRate(int rate) => emit(state.copyWith(rating: rate));
}
