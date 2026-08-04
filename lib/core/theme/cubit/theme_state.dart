part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ChangeState extends ThemeState {
  final ThemeData theme;
  ChangeState({required this.theme});
}
