//
//  ChecklistItemView.swift
//  Checkly
//
//  Created by Alessia Piscitelli on 16/12/24.
//

import SwiftUI

struct ChecklistItemView: View {
    var item: ChecklistItem
    var toggleCheckmark: (ChecklistItem) -> Void
    var deleteItem: (ChecklistItem) -> Void
    
    @State private var showingAlert = false  // Stato per mostrare l'alert
    
    var body: some View {
        HStack {
            // Checkbox accanto ad ogni elemento
            Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isChecked ? .green : .gray)
                .onTapGesture {
                    toggleCheckmark(item)
                }
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .strikethrough(item.isChecked)  // Barrato se completato
                
                Text("Due: \(item.dueDate, formatter: dateFormatter)")
                    .font(.subheadline)
                    .foregroundColor(.blue)

                // Mostra la descrizione sotto il titolo, se presente
                if !item.description.isEmpty {
                    Text(item.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }

            // Cliccando sulla task si mostra un alert
            Button(action: {
                showingAlert = true  // Mostra l'alert quando clicchi sulla task
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .padding(5)
            }
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Delete: Are you sure?"),
                    primaryButton: .destructive(Text("Yes")) {
                        deleteItem(item)  // Elimina l'elemento dalla lista
                    },
                    secondaryButton: .cancel()  // Annulla l'eliminazione
                )
            }
        }
        .padding(.vertical, 8)
        .background(Color.clear)
        .cornerRadius(10)
    }
}





