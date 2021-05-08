//
//  ColorIndicator.swift
//  ColorPicker
//
//  Created by Theodore Lampert on 08.05.21.
//

import SwiftUI

struct ColorIndicator: View {
    @Environment(\.colorScheme) var colorScheme

    let color: Color

    @Binding var selected: Bool

    @ViewBuilder
    var overlay: some View {
        Image(systemName: "multiply")
            .foregroundColor(colorScheme == .dark ? .black : .white)
            .opacity(selected ? 1 : 0)
    }

    var body: some View {
        Circle()
            .frame(width: Picker.circleSize, height: Picker.circleSize)
            .foregroundColor(color)
            .overlay(overlay)
            .onTapGesture { selected.toggle() }
    }
}

struct ColorIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ColorIndicator(
            color: .blue,
            selected: .constant(false)
        )
    }
}
