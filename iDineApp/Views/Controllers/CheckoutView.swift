//
//  CheckoutView.swift
//  iDineApp
//
//  Created by Sam Greenhill on 7/8/21.
//

import SwiftUI
//Forms are containers like stacks, but they are specifically designed for things like settings screens and user input - anywhere user might want to make several choices in one place.
struct CheckoutView: View {
    
    //@State works similarly to @EnvironmentObject in that if the object changes it automatically refreshes UI, but it's designed for simple local values like integers and strings.
    @State private var paymentType = "Cash"
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    
    @State private var tipAmount = 15
    
    @EnvironmentObject var order: Order
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    //this can show where the reactive nature of SqiftUI starts to become clear. We don't say, "show the alert" or "hide the alert" like in UIKit, but instead say, "here are conditions where the alert should be shown", let SwiftUI siguren out when those conditions are met.
    @State private var showingPaymentAlert = false
    
    var body: some View {
        Form {
            Section {
                //picker doesn't just read value of paymentType, it also writes the value, which is called two-way binding, because any changes to the value of paymentType will update the picker.
                //this is where $ comes in, Swift property wrappers use that to provide two-way bindings to their data.
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
            Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
            if addLoyaltyDetails {
                TextField("Enter your iDine ID", text: $loyaltyNumber)
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("TOTAL: \(totalPrice)")
                        .font(.largeTitle)) {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) - thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
