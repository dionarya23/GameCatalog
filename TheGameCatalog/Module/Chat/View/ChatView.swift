//
//  ChatView.swift
//  TheGameCatalog
//
//  Created by Dion Arya Pamungkas on 21/06/24.
//

import SwiftUI

struct ChatMessage: Identifiable {
    let id = UUID()
    let message: String
    let sender: String
}

struct ChatView: View {
    @State private var isLogin = false
    @State private var newMessage: String = ""
    @State private var messages: [ChatMessage] = [
        ChatMessage(message: "Hallo Apakabar?", sender: "John Doe"),
        ChatMessage(message: "Game yang lagi hits sekarang apa ?", sender: "John Doe")
    ]
    @State var isSending = false
    @State private var text: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    if !isLogin {
                        authIndicator
                    } else {
                       communityChat
                       textfield
                    }
                }
            }
        }
    }
}

extension ChatView {
    var authIndicator: some View {
        VStack {
            Image("gameIcon")
            Text("You have not joined the community")
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            Text("Log in or sign up to join and chat with the community")
                .font(.subheadline)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(.top, 12)
            NavigationLink {
                LoginView()
                    .toolbar(.hidden, for: .tabBar)
            } label: {
                HStack {
                    Text("Log In or Sign Up")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 50)
            }
            .background(Color("brandColor"))
            .cornerRadius(20)
            .padding(.top, 12)
        }
    }
    var communityChat: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(messages.indices, id: \.self) { index in
                    let chatMessage = messages[index]
                    VStack(alignment:
                            chatMessage.sender != "You"
                           ? .leading
                           : .trailing, spacing: 5) {
                    if index == 0 || messages[index - 1].sender != chatMessage.sender {
                        Text(chatMessage.sender)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                        BubbleChat(chatMessage: chatMessage)
                    }
                }
            }
            .padding()
        }

    }
    var textfield: some View {
        HStack {
            TextField("Write here", text: $newMessage)
                .padding(10)
                .background(Color.black)
                .cornerRadius(20)
                .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
                .overlay(
                    Capsule().stroke(Color("brandColor"), lineWidth: 1)
                )
                .overlay(
                    Button(action: {
                    if !newMessage.isEmpty {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            let newChatMessage = ChatMessage(message: newMessage, sender: "You")
                            messages.append(newChatMessage)
                            newMessage = ""
                        }
                    }
                }, label: {
                    Image(systemName: "arrow.up")
                        .padding(5)
                        .background(newMessage.isEmpty ? Color("brandColor").opacity(0.4) : Color("brandColor"))
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .offset(x: -12, y: 0)
                    })
                    .disabled(newMessage.isEmpty),
                    alignment: .trailing
                )
                .padding(.horizontal)
        }

    }
}
