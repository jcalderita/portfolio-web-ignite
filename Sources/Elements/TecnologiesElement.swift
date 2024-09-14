import Foundation
import Ignite

func Tecnologies(_ tecnologies: [String]) -> Text {
    Text {
        for tecnology in tecnologies {
            Badge(tecnology)
                .role(.close)
                .style(
                    "background-color: \(Palette.accentOpacity.rawValue)"
                )
                .padding(.medium)
                .margin(.small)
        }
    }
}
