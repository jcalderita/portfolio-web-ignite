import Foundation
import Ignite

extension NavigationBar {
    func applyStyle() -> some HTML {
        self.width(.viewport)
            .navigationItemAlignment(.trailing)
            .navigationBarStyle(.dark)
            .background(.secondaryColor)
            .position(.fixedTop)
    }
}


