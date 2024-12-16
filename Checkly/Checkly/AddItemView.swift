//
//  AddItemView.swift
//  Checkly
//
//  Created by Alessia Piscitelli on 16/12/24.
//
import SwiftUI

struct AddItemView: View {
    @Binding var newItemTitle: String
    @Binding var newItemDescription: String
    @Binding var newItemDueDate: Date
    var addItemAction: () -> Void
    
    var body: some View {
        VStack {
            TextField("Enter task title", text: $newItemTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Enter task description", text: $newItemDescription)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            DatePicker("Due Date", selection: $newItemDueDate, displayedComponents: .date)
                .padding()

            Button("Add Item") {
                addItemAction()
            }
            .padding()
        }
        .padding()
    }
}
