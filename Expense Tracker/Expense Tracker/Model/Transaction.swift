//
//  Transaction.swift
//  Expense Tracker
//
//  Created by Sean Veal on 3/4/24.
//

import SwiftUI
import SwiftData

@Model
class Transaction {
    /// Properties
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var category: String
    var tintColor: String
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    
    /// Extracting Color Value from tintColor String
    @Transient
    var color: Color {
        return tints.first { $0.color == tintColor }?.value ?? appTint
    }
    
    @Transient
    var tint: TintColor? {
        return tints.first { $0.color == tintColor }
    }
    
    @Transient
    var rawCategory: Category? {
        return Category.allCases.first { category == $0.rawValue }
    }
}
