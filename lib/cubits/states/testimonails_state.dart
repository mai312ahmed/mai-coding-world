part of '../cubits/testimonails_cubit.dart';

enum LoadTestimonailsStatus { initial, loading, loaded, error }

enum AddTestimonailsStatus { initial, adding, error }

class TestimonailsState extends Equatable {
  final String errorMessage;
  final List<TestimonailsModel> testimonails;
  final LoadTestimonailsStatus loadStatus;
  final AddTestimonailsStatus addStatus;
  final int rating;

  const TestimonailsState({
    this.loadStatus = LoadTestimonailsStatus.initial,
    this.addStatus = AddTestimonailsStatus.initial,
    this.errorMessage = "",
    this.testimonails = const [],
    this.rating = 0,
  });

  TestimonailsState copyWith({
    LoadTestimonailsStatus? loadStatus,
    AddTestimonailsStatus? addStatus,
    String? errorMessage,
    int? rating,
    List<TestimonailsModel>? testimonails,
  }) => TestimonailsState(
    errorMessage: errorMessage ?? this.errorMessage,
    loadStatus: loadStatus ?? this.loadStatus,
    addStatus: addStatus ?? this.addStatus,
    testimonails: testimonails ?? this.testimonails,
    rating: rating ?? this.rating,
  );

  @override
  List<Object?> get props => [
    loadStatus,
    addStatus,
    errorMessage,
    testimonails,
    rating,
  ];
}

class TestimonailsInitial extends TestimonailsState {
  const TestimonailsInitial() : super();
}
