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

struct CustomTabBar: View {
    @Binding var balancer: BalancerViewEnum
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            Button {
                withAnimation {
                    balancer = .transactions
                }
            } label: {
                ZStack {
                    if balancer == .transactions {
                        Color.yellow
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                    }
                    Image(systemName: "arrow.down.right.and.arrow.up.left")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .frame(width: 45, height: 45)
            }
            Spacer()
            Button {
                withAnimation {
                    balancer = .menu
                }
            } label: {
                ZStack {
                    if balancer == .menu {
                        Color.yellow
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                    }
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .frame(width: 45, height: 45)
            }
            Spacer()
            Button {
                withAnimation {
                    balancer = .recapitulatif
                }
            } label: {
                ZStack {
                    if balancer == .recapitulatif {
                        Color.yellow
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                    }
                    Image(systemName: "equal.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .frame(width: 45, height: 45)
            }
            Spacer()
        }
        .frame(height: 40)
        .foregroundColor(.blue)
        .padding()
        .background(
            Color.white
                .cornerRadius(20)
                .shadow(radius: 10)
        )
        .padding()
    }
}

struct MainView: View {
    @State var balancer: BalancerViewEnum = .menu
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            VStack {
                switch balancer {
                case .menu:
                    MenuView(balancer: $balancer)
                    .zIndex(1)
                case .transactions:
                    TransactionsView(viewModel: viewModel)
                    .zIndex(1)
                case .recapitulatif:
                    RecapView(transactions: viewModel.transactions)
                    .zIndex(1)
                }
            }
            if viewModel.showTabBar {
                VStack {
                    Spacer()
                    CustomTabBar(balancer: $balancer)
                        .zIndex(2)
                        .padding(.bottom, 30)
                }
            }
        }
        .background(
            Style.primaryBackgroundColor
        )
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

//struct BindingViewExample_1_Previews : PreviewProvider {
//
//    static var previews: some View {
//        CustomTabBar()
//    }
//
//}
