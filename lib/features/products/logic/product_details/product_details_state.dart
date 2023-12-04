part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsFailure extends ProductDetailsState {}

final class ProductDetailsSuccessl extends ProductDetailsState {}

