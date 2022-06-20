//
//  TransactionFIltersButton.swift
//  SmileAndPay
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

struct TransactionsFiltersButton: View {
    let title: String
    let action: ()->Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Color.blue.frame(width: 70, height: 30, alignment: .center)
                    .cornerRadius(20)
                Text(title)
                    .foregroundColor(.white)
                    .font(.caption)
            }
        }

    }
}
