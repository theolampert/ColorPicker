//
//  DisclosureButton.swift
//  ColorPicker
//
//  Created by Theodore Lampert on 08.05.21.
//

import SwiftUI

struct DisclosureButton: View {
    @Environment(\.colorScheme) var colorScheme

    @Binding var isOpen: Bool

    var body: some View {
        Circle()
            .frame(width: Picker.circleSize, height: Picker.circleSize)
            .foregroundColor(
                colorScheme == .dark
                    ? .black.opacity(0.2)
                    : .white.opacity(0.2)
            )
            .overlay(
                Image(systemName: "arrow.down")
                    .rotationEffect(.degrees(isOpen ? 180 : 0))
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .animation(.easeInOut)
            )
            .onTapGesture {
                withAnimation {
                    isOpen.toggle()
                }
            }
    }
}

struct DisclosureButton_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureButton(isOpen: .constant(false))
    }
}
