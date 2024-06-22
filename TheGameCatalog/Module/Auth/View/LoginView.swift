//
//  LoginView.swift
//  TheGameCatalog
//
//  Created by Dion Arya Pamungkas on 22/06/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack {
                Image("gameIcon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .padding(.vertical, 32)
                Text("Login to join Community")
                    .padding()
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecuredField: true)
                    .autocapitalization(.none)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                Button(action: {
                    print("login user")
                }, label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                })
                .background(Color("brandColor"))
                .cornerRadius(10)
                .padding(.top, 24)
                Spacer()
                NavigationLink {
                    RegisterView()
                        .toolbar(.hidden, for: .tabBar)
                } label: {
                    HStack {
                        Text("Don't have an account")
                        Text("Sign Up")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .foregroundColor(Color("brandColor"))
                    .font(.system(size: 14))
                }
            }
        }
    }
}

#Preview {
    LoginView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
