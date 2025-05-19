import Foundation
import Ignite

@MainActor
func Tecnologies(_ tecnologies: [String]) -> some HTML {
    Text {
//        ForEach(tecnologies) {
        InlineForEach(tecnologies) {
            Badge($0)
                .role(.close)
                .style(.backgroundColor, .accentOpacity)
                .padding(.medium)
                .margin(.small)
        }
    }
}
