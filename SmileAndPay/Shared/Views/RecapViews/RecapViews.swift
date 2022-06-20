//
//  RecapViews.swift
//  SmileAndPay
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

struct RecapView: View {
    let transactions: [Transaction]
    let action: ()->Void
    
    var body: some View {
        VStack(spacing: 40) {
            CustomNavBar(title: Strings.recapTitle) {
                action()
            }
            .padding(.top, 35)
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
        .transition(.move(edge: .bottom))
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
