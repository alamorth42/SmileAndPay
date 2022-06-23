//
//  TransactionsView.swift
//  SmileAndPay
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

struct TransactionsView: View {
    @ObservedObject var viewModel: MainViewModel
        
    var body: some View {
        NavigationView {
            VStack {
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
                            TransactionDetailsView(transaction: transaction, actionBack: actionBack) {
                                deleteRow(transaction)
                            }
                            .onAppear {
                                withAnimation {
                                    viewModel.showTabBar = false
                                }
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
        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
    }
    
    private func actionBack() {
        withAnimation {
            viewModel.showTabBar = true
        }
    }
    
    private func deleteRow(_ transaction: Transaction) {
        viewModel.deleteTransaction(transaction)
        actionBack()
    }
}
