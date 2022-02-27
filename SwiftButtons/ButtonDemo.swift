//
//  ButtonDemo.swift
//  SwiftButtons
//
//  Created by Arun Sinthanaisirrpi on 26/2/2022.
//

import SwiftUI

struct ButtonDemo: View {
    var body: some View {
        Button(action: tapped) {
            Text("Tap Meo")
                .accessibilityLabel("Text ")
        }
        .padding()
        .background(Color.pink)
        .accessibilityLabel("Button")
    }
    
    private func tapped() {}
}

struct ButtonDemo_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemo()
    }
}
