//
//  TitleRow.swift
//  MAD-257_Firebase_JonathanK
//
//  Created by Jonathan Kearns on 2/13/23.
//

import SwiftUI

struct TitleRow: View {
    var contactImage1 = Image(systemName: "person.circle")
    var contactName1 = "Biff"
    
    
    var body: some View {
        VStack (spacing: 20){
            contactImage1.resizable()
                .frame(width: 40, height: 40)
                .padding(.bottom, -15)
            
            HStack{
                Text("Biff")
                    .font(.title2).multilineTextAlignment(.leading).bold()
                    
                   
                
                Text("Lastname")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.top, 9.0)
                
                    
            }

//            .frame(maxWidth: .infinity)
            
        }
     
        .padding(3)
//        .background(.cyan)
        .cornerRadius(10)
        
    
    }
    

    
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
    }
}
