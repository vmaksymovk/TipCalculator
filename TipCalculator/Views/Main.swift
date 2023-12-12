import SwiftUI

struct Main: View {
    
    @State private var billAmount = ""
    @State private var tipPercentage = 15.0
    @State private var numberOfPeople = 1
    
    var body: some View {
        VStack {
            Spacer()
            
            Rectangle()
                .foregroundColor(Color.blue)
                .frame(width: 370, height: 140)
                .cornerRadius(30)
                .overlay(
                    VStack {
                        HStack {
                            Text("Bill")
                                .foregroundColor(.white)
                                .padding()
                                .font(.title)
                            
                            TextField("Enter bill amount", text: $billAmount)
                                .padding(.trailing)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        Slider(value: $tipPercentage, in: 0...30, step: 1.0)
                            .accentColor(.white)
                        
                        Text("Tip Percentage: \(Int(tipPercentage))%")
                            .foregroundColor(.white)
                    }
                )
            
            HStack {
                ForEach(0..<5, id: \.self) { index in
                    PersonCircleView(isSelected: index < numberOfPeople)
                        .onTapGesture {
                            numberOfPeople = index + 1
                        }
                }
            }
            
            Spacer()
            
            Rectangle()
                .foregroundColor(Color.blue)
                .frame(width: 370, height: 200)
                .cornerRadius(30)
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            Text("Tip Amount")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Spacer()
                            Text("$\(String(format: "%.2f", calculateTip(billAmount: self.billAmount, tipPercentage: self.tipPercentage)))")
                                .padding()
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Text("Total")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Spacer()
                            Text("$\(String(format: "%.2f", (calculateTotal()/Double(numberOfPeople))))")
                                .padding()
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                )
                .padding()
            
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    func calculateTotal() -> Double {
        let bill = Double(billAmount) ?? 0
        let tip = calculateTip(billAmount: self.billAmount, tipPercentage: self.tipPercentage)
        let total = bill + tip
        return total
    }
    
    
    
}

#if DEBUG
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
#endif
