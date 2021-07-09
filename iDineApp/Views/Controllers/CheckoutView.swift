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
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
