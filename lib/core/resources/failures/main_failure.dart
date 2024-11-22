import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.clientFailure({Exception? e}) = _ClientFailure;
  const factory MainFailure.serverFailure({Exception? e}) = _ServerFailure;
}
