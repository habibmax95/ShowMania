//
//  OnFirstAppearModifier.swift
//  ShowMania
//
//  Created by Office on 1/4/23.
//

import SwiftUI

struct OnFirstAppearModifier: ViewModifier {
    let perform:() -> Void
    @State private var firstTime: Bool = true
    
    func body(content: Content) -> some View {
        content
            .onAppear{
                if firstTime{
                    firstTime = false
                    self.perform()
                }
            }
    }
}

extension View {
   func onFirstAppear( perform: @escaping () -> Void ) -> some View {
     return self.modifier(OnFirstAppearModifier(perform: perform))
   }
}
