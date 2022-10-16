//
//  ContentView.swift
//  ProjetoAplicadoGustavo
//
//  Created by Nor, Gustavo on 16/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @StateObject private var vm = SignUpViewModel()
    @EnvironmentObject var coordinator: Coordinator
    
    
    var body: some View {
        VStack {
            Spacer().frame(height: 75)
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("Sign Up"){
                vm.signUp(email: email, password: password) { result in
                    switch result {
                    case .success(_):
                        coordinator.path.append(.login)
                    case .failure(let error):
                        vm.errorMessage = error.errorMessage
                    }
                    
                }
                
            }.buttonStyle(.borderedProminent)
            
            if let errorMessage = vm.errorMessage {
                Text(errorMessage)
            }
            
            Spacer()
            
            .navigationTitle("Sign Up")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }.navigationDestination(for: Route.self) { route in
            switch route{
            case .login:
                Text("LOGIN SCREEN")
            }
        }
    }
}
