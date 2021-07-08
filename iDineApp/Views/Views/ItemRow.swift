//
//  ItemRow.swift
//  iDineApp
//
//  Created by Sam Greenhill on 7/7/21.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            //we have an array of strings, so we can't conform them to Identifiable. Instead we need to tell Swift that the string itself is the identifier for each item.
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
            
        }
        //.padding(15)
        
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        //allows it to show live previews while we work. It is trying to create an ItemRow withour a menu item attached, which it cant do.
        //We usually make it so we provide dummy data to the preview. Provide an example item.
        ItemRow(item: MenuItem.example)
    }
}
