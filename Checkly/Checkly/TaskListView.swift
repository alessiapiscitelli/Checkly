//
//  TaskListView.swift
//  Checkly
//
//  Created by Alessia Piscitelli on 16/12/24.
//

import SwiftUI

struct TaskListView: View {
    @Binding var items: [ChecklistItem]
    @Binding var showAddItemView: Bool
    var toggleCheckmark: (ChecklistItem) -> Void
    var deleteItems: (IndexSet) -> Void
    
    var body: some View {
        List {
            ForEach(items) { item in
                ChecklistItemView(item: item, toggleCheckmark: toggleCheckmark)
            }
            .onDelete(perform: deleteItems)  // Permette di eliminare gli elementi dalla lista
        }
        .toolbar {
            // Pulsante "+" per aggiungere un nuovo elemento
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    showAddItemView.toggle()  // Mostra il form
                }) {
                    Image(systemName: "plus.circle")
                        .foregroundColor(Color.blue)
                }
            }
        }
    }
}
