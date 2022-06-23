//
//  PieChartSwiftUIView.swift
//  SmileAndPay (iOS)
//
//  Created by Achille LAMORTHE on 23/06/2022.
//

import SwiftUI
import Charts

struct PCView: View {
    let transactions: [Transaction]
    let text: String
    
    var body: some View {
        VStack {
            Text("Total transactions")
                .font(.title)
            Text("Tap on a slice for detailed information")
                .font(.caption)
            PieChart(entries: [PieChartDataEntry(value: getTotal(.crédit), label: "TOTAL CREDITS"), PieChartDataEntry(value: getTotal(.débit), label: "TOTAL DEBITS")],
                     descriptionText: "Description", defaultCenterText: text)
                .frame(height: 300)
            
        }
        .padding(.horizontal)
    }
    
    private func getTotal(_ type: TypeTransaction?) -> Double {
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
        return total
    }
}
