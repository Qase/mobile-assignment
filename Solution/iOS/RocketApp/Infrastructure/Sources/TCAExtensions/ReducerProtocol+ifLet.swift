import ComposableArchitecture

// TODO: Complete this function to get rid of getter and setter in child states.
// public extension ReducerProtocol {
//  func ifLet2<WrappedState, Route, WrappedAction, Wrapped: ReducerProtocol>(
//    _ toWrappedState: WritableKeyPath<State, Route?>,
//    case toRouteCase: CasePath<Route, WrappedState?>,
//    action toWrappedAction: CasePath<Action, WrappedAction>,
//    @ReducerBuilder<WrappedState, WrappedAction> then wrapped: () -> Wrapped,
//    file: StaticString = #file,
//    fileID: StaticString = #fileID,
//    line: UInt = #line
//  ) -> _IfLetReducer<Self, Wrapped>
//  where WrappedState == Wrapped.State, WrappedAction == Wrapped.Action {
//    ifLet(
//      toRouteCase.extract(from: toWrappedState[keyPath: toWrappedState]),
//      action: toWrappedAction,
//      then: wrapped
//    )
//
//    .init(
//      parent: self,
//      child: wrapped(),
//      toChildState: toWrappedState,
//      toChildAction: toWrappedAction,
//      file: file,
//      fileID: fileID,
//      line: line
//    )
//  }
// }
