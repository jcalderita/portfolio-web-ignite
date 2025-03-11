import Foundation
import Ignite

extension Column {
    func applyFirstStyle() -> some HTML {
        self.style(.backgroundColor, .secondary)
            .style(.borderColor, .accentOpacity)
            .padding()
    }

    func applySecondStyle() -> some HTML {
        self.style(.backgroundColor, .background)
            .style(.borderColor, .accentOpacity)
            .padding()
    }
    
    func applyThirdStyle() -> some HTML {
        self.style(.backgroundColor, .secondary)
            .style(.borderBottomWidth, "0")
            .padding()
    }
}


