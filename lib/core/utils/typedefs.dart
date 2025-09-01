import 'package:dartz/dartz.dart';
import 'package:devicesensorapp/core/errors/failures.dart';

// Generic type definitions for common use cases
typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = ResultFuture<void>;
typedef DataMap = Map<String, dynamic>;
