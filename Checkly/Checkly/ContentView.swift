//
//  ContentView.swift
//  Checkly
//
//  Created by Alessia Piscitelli on 16/12/24.
//


import SwiftUI

struct ContentView: View {
    @State private var items: [ChecklistItem] = [
        ChecklistItem(title: "Work out", dueDate: Date(), description: ""),
        ChecklistItem(title: "Buy Groceries", dueDate: Date().addingTimeInterval(86400), description: "Don't forget to buy milk and eggs!")
    ]
    
    @State private var showAddItemView = false  // Variabile per mostrare il form per aggiungere un nuovo elemento
    @State private var newItemTitle = ""  // Titolo del nuovo elemento
    @State private var newItemDueDate = Date()  // Data di scadenza del nuovo elemento
    @State private var newItemDescription = ""  // Descrizione del nuovo elemento
    @State private var selectedDate: Date = Date()  // Data selezionata nel calendario

    var body: some View {
        TabView {
            // Tab "My List" per la checklist
            Tab("My List", systemImage: "checklist") {
                NavigationView {
                    VStack {
                        TaskListView(
                            items: $items,
                            showAddItemView: $showAddItemView,
                            toggleCheckmark: toggleCheckmark,
                            deleteItems: deleteItems  // Passa la funzione di eliminazione
                        )
                        .sheet(isPresented: $showAddItemView) {
                            AddItemView(
                                newItemTitle: $newItemTitle,
                                newItemDescription: $newItemDescription,
                                newItemDueDate: $newItemDueDate,
                                addItemAction: addItem
                            )
                            .presentationDragIndicator(.visible)
                        }
                    }
                    .navigationTitle("My Check-list")
                }
            }

            // Tab "Calendar" per visualizzare le attività in base alla data selezionata
            Tab("Calendar", systemImage: "calendar") {
                NavigationView {
                    CalendarView(
                        selectedDate: $selectedDate,
                        items: items
                    )
                }
            }
        }
        .tint(.green)  // Colore di tint della TabBar
    }

    // Funzione per eliminare un singolo elemento dalla lista
    private func deleteItems(_ item: ChecklistItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
        }
    }

    // Funzione per cambiare lo stato di un elemento (completato/non completato)
    private func toggleCheckmark(for item: ChecklistItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isChecked.toggle()  // Cambia lo stato (se spuntato o no)
        }
    }

    // Funzione per aggiungere un nuovo elemento
    private func addItem() {
        if !newItemTitle.isEmpty {
            let newItem = ChecklistItem(title: newItemTitle, dueDate: newItemDueDate, description: newItemDescription)
            items.append(newItem)
            newItemTitle = ""  // Resetta il campo del titolo
            newItemDueDate = Date()  // Resetta la data
            newItemDescription = ""  // Resetta la descrizione
            showAddItemView = false  // Chiudi il form
        }
    }
}





#Preview {
    ContentView()
}
