//
//  Profile.swift
//  TipCalculator
//
//  Created by Влад on 12/11/23.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack{
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color(hue: 0.6, saturation: 0.8, brightness: 0.9))
            Spacer()
            
            List {
                    Text("A List Item")
                    Text("A Second List Item")
                    Text("A Third List Item")
                }
        }
       
        
    }
}

#Preview {
    Profile()
}
