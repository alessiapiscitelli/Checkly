//
//  ChecklistItem.swift
//  Checkly
//
//  Created by Alessia Piscitelli on 16/12/24.
//
import Foundation

// Struttura per un elemento della lista, con un titolo, stato (completato o no), una data e una descrizione
struct ChecklistItem: Identifiable {
    let id = UUID()  // Identificatore unico per ogni elemento
    var title: String  // Titolo dell'elemento
    var isChecked: Bool = false  // Stato di completamento (se è spuntato o meno)
    var dueDate: Date  // Data di scadenza
    var description: String  // Descrizione dell'elemento
}

