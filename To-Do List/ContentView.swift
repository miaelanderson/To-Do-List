//
//  ContentView.swift
//  To-Do List
//
//  Created by Mia Anderson on 1/22/25.
//

import SwiftUI

struct ContentView: View {
    @State private var things = ["First thing", "Second thing", "Third thing", "Fourth thing", "Fifth thing"]
    var body: some View {
        NavigationView {
            List {
                ForEach(things, id: \.self) { thing in
                    Text(thing)
                }
                .onMove(perform: { indices, newOffset in things.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in things.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Things", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

#Preview {
    ContentView()
}
