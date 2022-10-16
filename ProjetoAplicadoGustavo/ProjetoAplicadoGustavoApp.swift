//
//  ProjetoAplicadoGustavoApp.swift
//  ProjetoAplicadoGustavo
//
//  Created by Nor, Gustavo on 16/10/22.
//

import SwiftUI
import FirebaseCore

enum Route: Hashable{
    case login
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

class Coordinator: ObservableObject {
    @Published var path = [Route]()
}

@main
struct ProjetoAplicadoGustavo: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @ObservedObject var coordinator = Coordinator()


  var body: some Scene {
    WindowGroup {
        NavigationStack(path: $coordinator.path) {
        ContentView()
              .navigationDestination(for: Route.self) { route in
                  switch route{
                  case .login:
                      Text("LOGIN SCREEN")
                  }
              }
        }.environmentObject(coordinator)
    }
  }
}
