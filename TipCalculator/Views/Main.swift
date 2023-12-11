//
//  Main.swift
//  TipCalculator
//
//  Created by Влад on 12/11/23.
//

import SwiftUI

struct Main: View {
    
    @State private var billAmount = ""
    @State private var tipPercentage = 15.0
    var body: some View {

        VStack{
            Spacer()
            HStack{
                Text("Amount")
                TextField("Enter bill amount", text: $billAmount)
                    .padding(.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
            }
            Slider(value: $tipPercentage, in: 0...30, step: 1.0)
            Text("Tip Percentage: \(String(format: "%.0f", tipPercentage))%")

            
            
            Spacer()
            
            Rectangle()
                .foregroundColor(Color(hue: 0.409, saturation: 0.922, brightness: 0.23))
                .frame(width: 350, height: 300)
                .cornerRadius(30)
                .overlay(
                    VStack{
                        HStack{ // Total amount of tip
                            Spacer()
                            Text("Tip Amount")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Spacer()
                            Text("$\(String(format: "%.2f",calculateTip(billAmount: self.billAmount, tipPercentage: self.tipPercentage)))")
                                .padding()
                                .font(.system(size: 40))
                                .foregroundColor(Color(hue: 0.482, saturation: 0.815, brightness: 0.805))
                                
                            Spacer()
                            
                        }
                        
                        
                        HStack{ // Total amount
                            Spacer()
                            Text("Total")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Spacer()
                            Text("$\(String(format: "%.2f",calculateTotal()))")
                                .padding()
                                .font(.system(size: 40))
                                .foregroundColor(Color(hue: 0.482, saturation: 0.815, brightness: 0.805)) // Первый цвет

                                
                            Spacer()
                            
                        }
                        
                    }
                )
                
            
        }// VStack end
        
        
    }
    func calculateTotal() -> Double {
            let bill = Double(billAmount) ?? 0
            let tip = (calculateTip(billAmount: self.billAmount, tipPercentage: self.tipPercentage))
            let total = bill + tip
            return total
        }
}

#Preview {
    Main()
}
