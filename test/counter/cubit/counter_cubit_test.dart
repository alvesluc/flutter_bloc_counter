import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_counter/counter/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(CounterCubit().state, 0);
    });

    group('increment', () {
      blocTest<CounterCubit, int>(
        'emits [1] when state is 0',
        build: () => CounterCubit(),
        act: (cubit) => cubit.increment(),
      );

      blocTest<CounterCubit, int>(
        'emits [1, 2] when state is 0 and invoked twice',
        build: () => CounterCubit(),
        act: (cubit) => cubit
          ..increment()
          ..increment(),
      );

      blocTest<CounterCubit, int>(
        'emits [42] when state is 41',
        seed: () => 41,
        build: () => CounterCubit(),
        act: (cubit) => cubit.increment(),
      );
    });

    group('decrement', () {
      blocTest<CounterCubit, int>(
        'emits [-1] when state is 0',
        build: () => CounterCubit(),
        act: (cubit) => cubit.decrement(),
      );

      blocTest<CounterCubit, int>(
        'emits [-1, -2] when state is 0 and invoked twice',
        build: () => CounterCubit(),
        act: (cubit) => cubit
          ..decrement()
          ..decrement(),
      );

      blocTest<CounterCubit, int>(
        'emits [42] when state is 43',
        seed: () => 43,
        build: () => CounterCubit(),
        act: (cubit) => cubit.decrement(),
      );
    });
  });
}
