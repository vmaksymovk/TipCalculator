//
//  PersonCircleView.swift
//  TipCalculator
//
//  Created by Влад on 12/12/23.
//

import SwiftUI

struct PersonCircleView: View {
    var isSelected: Bool
    var body: some View {
        Image(systemName: isSelected ? "person.fill" : "person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(isSelected ? .blue : .gray)
    }
}

#Preview {
    PersonCircleView(isSelected: false)
}
