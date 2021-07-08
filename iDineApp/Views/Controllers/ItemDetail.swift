//
//  ItemDetail.swift
//  iDineApp
//
//  Created by Sam Greenhill on 7/4/21.
//

import SwiftUI

//we want to add items to our order form detail screen
struct ItemDetail: View {
    let item: MenuItem
    //haven't given it a default value, so might think it wil cause problems, but EnvironmentObject var doesn't have to have a value in code.
    @EnvironmentObject var order: Order
    //when this view is shown, SwiftUI will automatically look in its list of environemtn objects for something that is of type Order, and attach it to that property.
    
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                order.add(item: item)
            }
                .font(.headline)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    //can't see title at top because preview doesn't know its in a navigation view, so add one to preview.
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
        
    }
}
