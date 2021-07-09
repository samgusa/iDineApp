//
//  ContentView.swift
//  iDineApp
//
//  Created by Sam Greenhill on 6/29/21.
//

import SwiftUI

struct ContentView: View {
    //SwiftUI is designed to be composable, which means that you can make views out of any other views you like. we have a textview and we want to add more to it.
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: ItemDetail(item: item)) {
                                    ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
