part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}
final class ChatLoadingState extends ChatState {}
final class ChatSuccessState extends ChatState {}
final class ChatFailureState extends ChatState {}

final class SpeakerMuteState extends ChatState {}
