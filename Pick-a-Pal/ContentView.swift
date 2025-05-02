//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Jeremy Kim on 5/1/25.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Elisha", "Andre", "Jason", "Po-Chun"]
    @State private var nameToAdd: String = ""
    @State private var pickedName: String = ""
    @State private var shouldRemovePickedName: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold(!pickedName.isEmpty)
                .foregroundStyle(.tint)
            
            
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
                
            }
            .clipShape (RoundedRectangle(cornerRadius: 8))
            
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled(true)
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            Button {
                if let randomName = names.randomElement() {
                    print("Picked \(randomName)")
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll { name in name == pickedName }
                    }
                } else {
                    pickedName = ""
                }
            } label : {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
