 import 'package:fpdart/fpdart.dart';

import '../../utils/api_failure.dart';

typedef EitherWithType<T> = Either<ApiFailure, T>;
typedef EitherWithVoid = Either<ApiFailure, void>;
typedef EitherWithCustomType<T,E> = Either<E, T>;
