//
//  ViewExtension.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import SwiftUI

extension View {
    
    /// Wrapped view inside a navigation view
    ///
    /// - Returns: Navigation view
    ///
    func embedNavigationView() ->  some View {
        return NavigationView{self}
    }
}
