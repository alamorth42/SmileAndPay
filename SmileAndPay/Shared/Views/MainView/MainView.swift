//
//  ContentView.swift
//  Shared
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

enum BalancerViewEnum {
    case menu
    case transactions
    case recapitulatif
}

struct MainView: View {
    @State var balancer: BalancerViewEnum = .menu
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        switch balancer {
        case .menu:
            MenuView(balancer: $balancer)
                .edgesIgnoringSafeArea(.all)
        case .transactions:
            TransactionsView(viewModel: viewModel) {
                goBack()
            }
            .edgesIgnoringSafeArea(.all)
            .zIndex(1)
        case .recapitulatif:
            RecapView(transactions: viewModel.transactions) {
                goBack()
            }
            .edgesIgnoringSafeArea(.all)
            .zIndex(1)
        }
    }
    
    private func goBack() {
        withAnimation {
            balancer = .menu
        }
    }
}
