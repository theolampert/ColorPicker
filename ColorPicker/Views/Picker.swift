//
//  ContentView.swift
//  ColorPicker
//
//  Created by Theodore Lampert on 08.05.21.
//

import SwiftUI

struct Picker: View {
    @Environment(\.colorScheme) var colorScheme

    @StateObject private var pickerStore = PickerStore()

    static var circleSize: CGFloat = 40
    static var totalWidth: CGFloat = 240
    static var spacing: CGFloat = 10

    @ViewBuilder
    var label: some View {
        Text("Favorite Colors")
            .bold()
            .foregroundColor(colorScheme == .dark ? .black : .white)
            .padding(.vertical, Picker.spacing)
            .padding(.leading, Picker.spacing / 2)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                if pickerStore.shouldShowLabel { label }
                if pickerStore.shouldShowGrid {
                    ColorSelectionGrid(
                        choices: pickerStore.sortedSelections,
                        onItemTapped: pickerStore.toggleSelected(colorChoice:)
                    )
                }
            }
            .frame(width: Picker.totalWidth - Picker.circleSize)
            .transition(.move(edge: .bottom))
            .animation(.easeInOut(duration: 0.25))
            DisclosureButton(isOpen: $pickerStore.isOpen)
        }
        .padding(Picker.spacing)
        .clipped()
        .background(
            colorScheme == .dark
                ? Color.white.cornerRadius(Picker.spacing * 3)
                : Color.black.cornerRadius(Picker.spacing * 3)
        )
        .frame(width: Picker.totalWidth, alignment: .center)
        .shadow(radius: Picker.circleSize / 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Picker()
    }
}
