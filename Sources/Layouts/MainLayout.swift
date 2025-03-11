import Foundation
import Ignite

struct MainLayout: Layout {
    
    var body: some HTML {
        Body { content }
            .background(.backgroundColor)
    }
}
