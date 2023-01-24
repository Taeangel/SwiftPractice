//
//  AppRouterGroup.swift
//  TCAProject
//
//  Created by song on 2022/12/02.
//

import LinkNavigator

struct AppRouterGroup {
  
  var routers: [RouteBuilder] { [
    MainCoinRouteBuilder(),
    SettingRouteBuilder()
  ] }
}
