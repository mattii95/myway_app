part of 'client_home_bloc.dart';

class ClientHomeState extends Equatable {
  final int pageIndex;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const ClientHomeState({this.pageIndex = 0, this.scaffoldKey});

  ClientHomeState copyWith({
    int? pageIndex,
    GlobalKey<ScaffoldState>? scaffoldKey,
  }) => ClientHomeState(
    pageIndex: pageIndex ?? this.pageIndex,
    scaffoldKey: scaffoldKey,
  );

  @override
  List<Object?> get props => [pageIndex, scaffoldKey];
}

final class ClientHomeInitial extends ClientHomeState {}
