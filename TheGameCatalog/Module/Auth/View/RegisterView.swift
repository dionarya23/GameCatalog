//
//  RegisterView.swift
//  TheGameCatalog
//
//  Created by Dion Arya Pamungkas on 22/06/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Image("gameIcon")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding(.vertical, 32)
            Text("Register to join Community")
                .padding()
            VStack(spacing: 24) {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                InputView(text: $fullName,
                          title: "Full Name",
                          placeholder: "Enter your name")
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecuredField: true)
                InputView(text: $confirmPassword,
                          title: "Confirm Password",
                          placeholder: "Confirm your password",
                          isSecuredField: true)

            }
            .padding(.horizontal)
            .padding(.top, 12)
            Button(action: {
                print("Regsiter user")
            }, label: {
                HStack {
                    Text("SIGN UP")
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
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account")
                    Text("Sign In")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .foregroundColor(Color("brandColor"))
                .font(.system(size: 14))
            }
            .padding(.top, 24)
        }
    }
}

#Preview {
    RegisterView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
