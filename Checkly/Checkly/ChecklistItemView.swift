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
    
    var body: some View {
        HStack {
            // Checkbox (spunta) accanto ad ogni elemento
            Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isChecked ? .green : .gray)
                .onTapGesture {
                    toggleCheckmark(item)
                }
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .strikethrough(item.isChecked)  // Barrato se è completato
                
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
        }
    }
}

