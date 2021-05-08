//
//  PickerStore.swift
//  ColorPicker
//
//  Created by Theodore Lampert on 08.05.21.
//
import SwiftUI

final class PickerStore: ObservableObject {
    struct Selection: Hashable {
        let color: Color
        var selected: Bool = false

        static func == (lhs: Selection, rhs: Selection) -> Bool {
            return lhs.color == rhs.color
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(color)
        }
    }

    @Published private(set) var colors: Set<Selection> = [
        Selection(color: .red),
        Selection(color: .blue),
        Selection(color: .red),
        Selection(color: .green),
        Selection(color: .yellow),
        Selection(color: .pink),
        Selection(color: .purple),
        Selection(color: .gray),
        Selection(color: Color(UIColor.brown)),
        Selection(color: Color(UIColor.cyan)),
        Selection(color: Color(UIColor.magenta)),
        Selection(color: Color(UIColor.systemTeal))
    ]

    @Published var isOpen: Bool = false

    var shouldShowLabel: Bool {
        !isOpen && !colors.contains(where: \.selected)
    }

    var shouldShowGrid: Bool { !sortedSelections.isEmpty }

    var sortedSelections: [Selection] {
        if isOpen {
            return colors.sorted { $0.selected && !$1.selected }
        }
        return colors.filter(\.selected)
    }

    func toggleSelected(colorChoice: Selection) {
        let updated = Selection(
            color: colorChoice.color,
            selected: !colorChoice.selected
        )
        colors.update(with: updated)
    }
}
