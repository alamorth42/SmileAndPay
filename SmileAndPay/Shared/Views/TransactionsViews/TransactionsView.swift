//
//  TransactionsView.swift
//  SmileAndPay
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

struct TransactionsView: View {
    @ObservedObject var viewModel: MainViewModel
    let action: ()->Void
        
    var body: some View {
        NavigationView {
            VStack {
                CustomNavBar(title: Strings.transactionsTitle) {
                    action()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        TransactionsFiltersButton(title: "Amount") {
                            viewModel.filterByAmount()
                        }
                        TransactionsFiltersButton(title: "Type") {
                            viewModel.filterByType()
                        }
                        TransactionsFiltersButton(title: "Date") {
                            viewModel.filterByDate()
                        }
                    }
                }
                .padding(.vertical, 10)
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.transactions) { transaction in
                        NavigationLink(destination: {
                            TransactionDetailsView(transaction: transaction) {
                                deleteRow(transaction)
                            }
                        }, label: {
                            TransactionRow(transaction: transaction)
                                .padding(.vertical, 8)
                        })
                    }
                }
                Spacer()
            }
            .padding()
            .background(
                Style.primaryBackgroundColor
            )
            .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.all)
        .transition(.move(edge: .bottom))
    }
    
    private func deleteRow(_ transaction: Transaction) {
        viewModel.deleteTransaction(transaction)
    }
}
