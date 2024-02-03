//
//  Profile.swift
//  TipCalculator
//
//  Created by Влад on 12/11/23.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        NavigationStack{
            VStack{
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color(hue: 0.6, saturation: 0.8, brightness: 0.9))
                Spacer()
                
                List {
                    Section(header: Text("Account")) {
                        Text("Username: Vladyslav")
                        Text("Email: vmaksymovk@gmail.com")
                        NavigationLink(destination: HistoryView()){
                            Text("History")
                        }
                    }//end list
                }
            }
        }
        
    }
}

#Preview {
    Profile()
}
