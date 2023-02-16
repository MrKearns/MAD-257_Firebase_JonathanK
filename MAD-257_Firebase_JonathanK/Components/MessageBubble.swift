//
//  MessageBubble.swift
//  MAD-257_Firebase_JonathanK
//
//  Created by Jonathan Kearns on 2/13/23.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack{
                
               let rect = Text(message.text)
                    .padding(10)
                    .frame(minWidth: 46)
                    .background(message.received ? Color("Gray") : Color("Peach"))
                    
                if message.received{
                    rect.cornerRadiusAll(30, corners: [.bottomRight, .topLeft, .topRight])
                } else{
                    rect.cornerRadiusAll(30, corners: [.bottomLeft, .topLeft, .topRight])
                }
                    
                
                    
            }
            
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime{
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
        
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "1234", text: "Hi there. How are you?", received: true, timestamp: Date()))
    }
}

