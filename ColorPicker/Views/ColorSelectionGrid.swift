//
//  ColorSelectionGrid.swift
//  ColorPicker
//
//  Created by Theodore Lampert on 08.05.21.
//

import SwiftUI

struct ColorSelectionGrid: View {
    let choices: [PickerStore.Selection]

    var onItemTapped: (PickerStore.Selection) -> Void

    var columns: [GridItem] = [
        GridItem(
            .adaptive(minimum: Picker.circleSize, maximum: 100),
            spacing: Picker.spacing
        )
    ]

    var body: some View {
        LazyVGrid(
            columns: columns,
            alignment: .center,
            spacing: Picker.spacing
        ) {
            ForEach(choices, id: \.color) { choice in
                ColorIndicator(
                    color: choice.color,
                    selected: .init(get: {
                        choice.selected
                    }, set: { _ in
                        withAnimation {
                            onItemTapped(choice)
                        }
                    })
                )
            }
        }
    }
}

struct ColorSelectionGrid_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectionGrid(choices: [
            .init(color: .red),
            .init(color: .green, selected: true),
            .init(color: .blue),
            .init(color: .yellow)
        ],
        onItemTapped: { _ in })
    }
}
