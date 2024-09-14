import Foundation
import Ignite

extension Column {
    func applyFirstStyle() -> Self {
        self.style(
            "background-color: \(Palette.secondary.rawValue)",
            "border-color: \(Palette.accentOpacity.rawValue)"
        )
        .padding()
    }

    func applySecondStyle() -> Self {
        self.style(
            "background-color: \(Palette.background.rawValue)",
            "border-color: \(Palette.accentOpacity.rawValue)"
        )
        .padding()
    }
    
    func applyThirdStyle() -> Self {
        self.style(
            "background-color: \(Palette.secondary.rawValue)",
            "border-bottom-width: 0"
        )
        .padding()
    }
}


