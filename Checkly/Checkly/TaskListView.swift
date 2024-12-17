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
    var deleteItems: (ChecklistItem) -> Void  // Qui accettiamo l'oggetto ChecklistItem

    var body: some View {
        List {
            ForEach(items) { item in
                ChecklistItemView(item: item, toggleCheckmark: toggleCheckmark, deleteItem: deleteItems)
            }
            .onDelete(perform: { indexSet in
                // Quando si fa swipe-to-delete, passiamo l'oggetto corrispondente
                for index in indexSet {
                    let itemToDelete = items[index]
                    deleteItems(itemToDelete)
                }
            })
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




