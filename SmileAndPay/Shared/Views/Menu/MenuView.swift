//
//  menuView.swift
//  SmileAndPay
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

struct MenuView: View {
    @Binding var balancer: BalancerViewEnum
    
    var body: some View {
        VStack(spacing: 15) {
            SmileAndPayButton(title: Strings.transactionsTitle) {
                withAnimation {
                    balancer = .transactions
                }
            }
            SmileAndPayButton(title: Strings.recapTitle) {
                withAnimation {
                    balancer = .recapitulatif
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        .background(
            Style.primaryBackgroundColor
        )
        .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .top)))
    }
}
