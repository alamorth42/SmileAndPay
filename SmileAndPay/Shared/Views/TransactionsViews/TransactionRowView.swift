//
//  TransactionRowView.swift
//  SmileAndPay
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        VStack {
            HStack {
                Text(transaction.type.title)
                Spacer()
                Text(transaction.mode)
            }
            Spacer()
            HStack {
                Text(transaction.datetime)
                Spacer()
                Text(String(format: "%.2f", transaction.amount) + " €")
            }
        }
        .foregroundColor(.white)
        .padding()
        .frame(height: 100, alignment: .center)
        .background(
            Color.blue
                .shadow(radius: 5)
        )
        .cornerRadius(10)
    }
}
