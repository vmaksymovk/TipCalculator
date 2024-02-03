import SwiftUI

struct Main: View {
    
    @AppStorage("billAmount") private var billAmount = ""
    @AppStorage("tipPercentage") private var tipPercentage = 15.0
    @AppStorage("numberOfPeople") private var numberOfPeople = 1
    @State var DictionaryForHistory : [Date:String] = [:]
    
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
                                .font(.system(size: 20))
                            
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
            
            Spacer()
            Text("How many people are paying?")
                .font(.system(size: 20))
            HStack {
                ForEach(0..<8, id: \.self) { index in
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
                        Button("Save to history") {
                            saveBill()
                        }
                        .foregroundStyle(.white)
                        Spacer()
                        
                        
                        
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
    
    func saveBill(){
        guard let amount = Double(billAmount) else {
            // Handle invalid input
            return
        }
        
        let currentDate = Date()
        
        // Add the bill amount and date to the dictionary
        DictionaryForHistory[Date.now] = "\(amount)$"
        
        // Optionally, you can reset the billAmount to an empty string after saving
        billAmount = ""
        print(DictionaryForHistory)
    }
    
    
    
}

#if DEBUG
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
#endif
