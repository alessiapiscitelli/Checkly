//
//  CalendarView.swift
//  Checkly
//
//  Created by Alessia Piscitelli on 16/12/24.
//
import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date
    var items: [ChecklistItem]
    
    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

            // Filtro per mostrare solo gli item che corrispondono alla data selezionata
            let tasksForSelectedDate = items.filter {
                Calendar.current.isDate($0.dueDate, inSameDayAs: selectedDate)
            }

            if tasksForSelectedDate.isEmpty {
                Text("No tasks for this date")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .padding()
            } else {
                List {
                    ForEach(tasksForSelectedDate) { item in
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text("Due: \(item.dueDate, formatter: dateFormatter)")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            Text(item.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationTitle("Calendar View")
    }
}
