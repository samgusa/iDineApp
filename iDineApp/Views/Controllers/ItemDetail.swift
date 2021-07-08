//
//  ItemDetail.swift
//  iDineApp
//
//  Created by Sam Greenhill on 7/4/21.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    
    
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
            ItemDetail(item: MenuItem.example)
        }
        
    }
}
