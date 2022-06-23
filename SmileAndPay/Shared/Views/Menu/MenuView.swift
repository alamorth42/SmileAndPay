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
            Spacer()
            Text("SMILE AND PAY")
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .foregroundColor(.blue)
            Spacer()
        }
    }
}
