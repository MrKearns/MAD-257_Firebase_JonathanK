//
//  MessageField.swift
//  MAD-257_Firebase_JonathanK
//
//  Created by Jonathan Kearns on 2/13/23.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    
    @State private var message = ""
    
    var body: some View {
        HStack{
            CustomTextField(placeholder: Text(""), text: $message)
            
            Button {
                messagesManager.sendMessage(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }

        }
        .frame(height: 30 )
        .padding(10)
        .background(Color("Gray"))
        .cornerRadius(90)
        .padding(.horizontal, 15)
       
    }
        
}

struct MessageField_Previews: PreviewProvider{
    static var previews: some View{
        MessageField()
            .environmentObject(MessagesManager())
    }
}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View{
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
