//
//  dateFormatter.swift
//  Checkly
//
//  Created by Alessia Piscitelli on 16/12/24.
//

import Foundation

// Formattatore di data per mostrare la data in un formato leggibile
public var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}
