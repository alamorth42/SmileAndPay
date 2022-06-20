//
//  TransactionDetailsView.swift
//  SmileAndPay
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

struct TransactionDetailsView: View {
    var transaction: Transaction?
    let delete: ()->Void
    
    var body: some View {
        if transaction != nil {
            VStack {
                VStack(alignment: .leading, spacing: 15) {
                    HStack(spacing: 10) {
                        Text("ID : ")
                            .underline()
                            .bold()
                        Text("\(transaction!.id)")
                    }
                    HStack(spacing: 10) {
                        Text("Date : ")
                            .underline()
                            .bold()
                        Text("\(transaction!.datetime)")
                    }
                    HStack(spacing: 10) {
                        Text("Amount : ")
                            .underline()
                            .bold()
                        Text(String(format: "%.2f", transaction!.amount) + " €")
                    }
                    HStack(spacing: 10) {
                        Text("Type : ")
                            .underline()
                            .bold()
                        Text("\(transaction!.type.title)")
                    }
                    if transaction!.mode != "" {
                        HStack(spacing: 10) {
                            Text("Mode : ")
                                .underline()
                                .bold()
                            Text("\(transaction!.mode)")
                        }
                    }
                    if transaction!.commentaire != nil && transaction!.commentaire != "" {
                        VStack(alignment: .leading) {
                            Text("Commentaire : ")
                                .underline()
                                .bold()
                            Text("\(transaction!.commentaire!)")
                        }
                    }
                    Spacer()
                }
                SmileAndPayButton(title: Strings.delete.uppercased()) {
                    delete()
                }
            }
        }
    }
}
