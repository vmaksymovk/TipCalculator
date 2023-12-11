import SwiftUI
import Foundation



func calculateTip(billAmount : String, tipPercentage : Double) -> Double {
    let bill = Double(billAmount) ?? 0
    let tip = bill * (tipPercentage / 100)
    return tip
}

