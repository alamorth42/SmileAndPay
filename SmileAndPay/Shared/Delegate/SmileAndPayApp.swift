//
//  SmileAndPayApp.swift
//  Shared
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

@main
struct SmileAndPayApp: App {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel)
                .onAppear {
                    viewModel.onAppearViewModel()
                }
        }
    }
}
