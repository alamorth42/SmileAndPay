//
//  RecapViews.swift
//  SmileAndPay
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

struct RecapView: View {
    let transactions: [Transaction]
    
    var body: some View {
        VStack(spacing: 40) {
            PCView(transactions: transactions, text: "\(getTotal(nil))")
                .padding(.top, 30)
            VStack(alignment: .leading, spacing: 25) {
                HStack {
                    Text("TOTAL CREDITS: ")
                    Spacer()
                    Text("\(getTotal(.crédit))").bold()
                }
                HStack {
                    Text("TOTAL DEBITS: ")
                    Spacer()
                    Text("\(getTotal(.débit))").bold()
                }
                HStack {
                    Text("TOTAL: ")
                    Spacer()
                    Text("\(getTotal(nil))").bold()
                }
            }
            .padding()
            Spacer()
        }
        .padding()
        .background(
            Color.yellow
        )
        .font(.headline)
        .foregroundColor(.blue)
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
    }
    
    private func getTotal(_ type: TypeTransaction?) -> String {
        var total: Double = 0
        transactions.forEach { transaction in
            if type != nil {
                if type == transaction.type {
                    total += transaction.amount
                }
            } else {
                total += transaction.amount
            }
        }
        return String(format: "%.2f", total) + " €"
    }
}
