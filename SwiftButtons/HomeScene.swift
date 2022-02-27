//
//  ContentView.swift
//  SwiftButtons
//
//  Created by Arun Sinthanaisirrpi on 25/2/2022.
//

import SwiftUI

/// HomeScence that list the available button types.
///
/// A SwiftUI view tha
struct HomeScene: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 44) {
                ButtonsListHeader()
                SimpleTextButton()
                ButtonBase(text: "Flat")
                    .frame(width: 100, height: 44)
                    .applyFlatStyle()
                ButtonBase(text: "Filled")
                    .applyFilledStyle()
                    .frame(width: 100, height: 44)
                DeleteButton()
                InfoButton()
                ButtonBase(text: "Prominetnt Bordered")
                    .frame(width: 100, height: 44)
                    .buttonStyle(.borderedProminent)
                ButtonBase(text: "bordered")
                    .frame(width: 100, height: 44)
                    .buttonStyle(.bordered)
                ButtonBase(text: "bordered-less")
                    .frame(width: 100, height: 44)
                    .buttonStyle(.borderless)
                ButtonBase(text: "DLS-Style Fill")
                    .frame(width: 100, height: 44)
                    .buttonStyle(FillButtonStyle())
            }
        }
    }
}

struct HomeScene_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene()
    }
}

/// Heading of the List
///
/// This Button List header using a HStack to lay the controls in a row.
/// There is a spacers on either side to align the controls at the center
/// There is Image with a SFSymbol and Text
struct ButtonsListHeader: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            Spacer()
            Image(systemName: "ladybug.fill")
                .renderingMode(.original)
                .resizable()
                .frame(width: 32.0, height: 32.0)
            Text("All kinds of buttons")
                .font(.title3)
                .foregroundColor(.black)
                .bold()
            Spacer()
        }
    }
}

struct ButtonsListHeader_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsListHeader()
    }
}

/// Simple Button
struct SimpleTextButton: View {
    @State
    private var isPresented = false
    private let systemImageName = "hand.tap"
    private func buttonAction() {
        isPresented = true
    }
    
    var body: some View {
        Button(action: buttonAction) {
            Label("Simple Button", systemImage: systemImageName)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.pink, .indigo)
        }
        .alert("Simple Text Button", isPresented: $isPresented) {}
    }
}

/// Button With a role
struct DeleteButton: View {
    var body: some View {
        Button(role: .destructive) {} label: {
            Label("Delete", systemImage: "trash.square.fill")
        }
    }
}

struct InfoButton: View {
    var body: some View {
        Button(role: .cancel) {} label: {
            Label("Info", systemImage: "thermometer.sun.fill")
        }
    }
}

/// ButtonBase
struct ButtonBase: View {
    @State
    private var isPresented = false
    let text: String
    private func buttonAction() {
        isPresented = true
    }
    
    var body: some View {
        GeometryReader { geometry in
            Button(action: buttonAction) {
                Text(text)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .alert("\(text) - DLS Button", isPresented: $isPresented) {}
    }
}

/// Filled Button style.
///
/// Filled button have background colour on default. In terms of usage,
/// they are used for primary call to action.
struct FilledButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(hex: 0xFDC605))
            .foregroundColor(Color(hex: 0x000000))
            .cornerRadius(4)
    }
}

struct FillButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            Button(configuration)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color(hex: 0xFDC605))
                .foregroundColor(Color(hex: 0x000000))
                .cornerRadius(4)
        }
    }
}

/// Flat Button style.
///
/// Flat button have no background colour as default. In terms of usage,
/// they are used for secondary call to action.
struct FlatButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(hex: 0x000000))
            .cornerRadius(4)
    }
}

/// Extend the view for declarative code style
extension View {
    func applyFilledStyle() -> some View {
        modifier(FilledButton())
    }
    
    func applyFlatStyle() -> some View {
        modifier(FlatButton())
    }
}


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
