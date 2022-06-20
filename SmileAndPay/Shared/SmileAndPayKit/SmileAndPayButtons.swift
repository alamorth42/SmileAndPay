//
//  SmileAndPayButtons.swift
//  SmileAndPay
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

struct SmileAndPayButton: View {
    
    let title: String
    let action: ()->Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Color.blue
                    .frame(width: UIScreen.main.bounds.width / 1.4, height: 75, alignment: .center)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                Text(title)
                    .foregroundColor(.white)
                    .font(.title)
            }
        }
    }
}
