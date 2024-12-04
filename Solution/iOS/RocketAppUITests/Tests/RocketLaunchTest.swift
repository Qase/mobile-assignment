//
//  Test 2.swift
//  RocketApp
//
//  Created by Cyril Colombier on 30.11.2024.
//

import XCTest

final class TestRocketLaunch: BaseTestCase {
  func testRocketLaunchTest() {
    let username = "astronaut1"
    let password = "space"
    
    LoginScreen(app: app)
      .checkLoginTitle()
      .enterUsername(username)
      .enterPassword(password)
      .tapLoginButton()
    RocketListScreen(app: app)
      .checkLogoutButton()
      .tapFirstRocketCell()
    RocketDetailScreen(app: app)
      .checkRocketTitle()
      .tapLaunchButton()
    RocketLaunchScreen(app: app)
      .checkRocketImage()
  }
}
