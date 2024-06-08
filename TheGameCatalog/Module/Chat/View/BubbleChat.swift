//
//  BubbleChat.swift
//  TheGameCatalog
//
//  Created by Dion Arya Pamungkas on 22/06/24.
//

import SwiftUI

struct BubbleChat: View {
    var chatMessage: ChatMessage
    var body: some View {
        Text(chatMessage.message)
            .padding(10)
            .background(
                chatMessage.sender != "You"
                ? Color.gray.opacity(0.2)
                : Color("brandColor").opacity(0.2))
            .foregroundColor(.white)
            .cornerRadius(10)
            .frame(maxWidth: .infinity,
                   alignment: chatMessage.sender != "You"
                   ? .leading
                   : .trailing)
    }
}

#Preview {
    BubbleChat(chatMessage: ChatMessage(message: "Hallo Apakabar?", sender: "John Doe"))
}
