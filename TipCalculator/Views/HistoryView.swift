//
//  HistoryView.swift
//  TipCalculator
//
//  Created by Влад on 2/3/24.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var userData : UserData
    var body: some View {
        VStack{
            
            List {
                ForEach(userData.DictionaryForHistory.sorted(by: { $0.key > $1.key }), id: \.key) { date, billAmount in
                    Text("\(date): \(billAmount)")
                }
            }
        }
    }
}

#Preview {
    HistoryView(userData: UserData())
}
