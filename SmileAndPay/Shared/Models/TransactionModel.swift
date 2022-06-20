//
//  TransactionModel.swift
//  SmileAndPay
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

// SERVER SIDE
struct TransactionsData: Codable {
    let transactions: [TransactionData]
}

struct TransactionData: Codable {
    var id: String
    var datetime: String
    var amount: String
    var type: String
    var mode: String
    var commentaire: String?
}

enum TypeTransaction {
    case crédit
    case débit
    
    // IF WE WANT TO LOCALIZED TEXT
    var title: String {
        switch self {
        case .crédit:
            return "Crédit"
        case .débit:
            return "Débit"
        }
    }
}

// CLIENT SIDE
struct Transaction: Identifiable {
    var id: String
    var datetime: String
    var amount: Double
    var type: TypeTransaction
    var mode: String
    var commentaire: String?
}
