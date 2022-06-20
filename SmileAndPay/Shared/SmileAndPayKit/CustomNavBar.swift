//
//  CustomNavBar.swift
//  SmileAndPay
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

struct CustomNavBar: View {
    let title: String
    let action: ()->Void
    
    var body: some View {
        HStack {
            Button {
                action()
            } label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 30, height: 20, alignment: .center)
            }
            Text(title.uppercased())
                .foregroundColor(.blue)
                .font(.title)
                .bold()
                .padding(.horizontal, 40)
            Spacer()
        }
    }
}
