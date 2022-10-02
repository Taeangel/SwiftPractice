//
//  Coordinator.swift
//  TCACoordinator
//
//  Created by song on 2022/09/29.
//

import ComposableArchitecture
import TCACoordinators

struct CoordinatorState: Equatable, IndexedRouterState {
  var routes: [Route<ScreenState>]
  
  init(routes: [Route<Screen>] = [.root(.home(.init()), embedInNavigationView: true)] ) {
    self.routes = routes
  }
}

enum CoordinatorAction: IndexedRouterAction {
  case routeAction(Int, action: ScreenAction)
  case updateRoutes([Route<ScreenState>])
}

struct CoordinatorEnvironment {
  
}

let coordunatorReducer: Reducer<CoordinatorState, CoordinatorAction, CoordinatorEnvironment> = screenReducer.forEachIndexedRoute(environment: { _ in ScreenEnvironment() })
  .withRouteReducer(
    Reducer { state, action, environment in
      switch action {
      case let .routeAction(_, action: .home(.itemTapped(num))):
        state.routes.push(.detail(.init(title: num)))
        return Effect.none
      case .routeAction(_, action: .detail(.backButtonTapped)):
        state.routes.pop()
        return Effect.none
      default:
        return Effect.none
      }
    }
  )

//push                  Pushes a new screen onto the stack.
//presentSheet          Presents a new screen as a sheet.                    †††
//presentCover          Presents a new screen as a full-screen cover.        †††
//goBack                Goes back one screen in the stack.
//goBackToRoot          Goes back to the very first screen in the stack.
//goBackTo              Goes back to a specific screen in the stack.
//pop                   Pops the current screen if it was pushed.
//dismiss               Dismisses the most recently presented screen.

// embedInNavigationView. ††† 이둘이 먼 상관이 있는거같음
