import Foundation
import Ignite

struct IntroductionView: HTML {
    let role: String
    let introduction: String
    
    var body: some HTML {
        Text(role)
            .horizontalAlignment(.center)
            .margin(.top, 80)
            .font(.title2)
            .style(.color, .titleColor)
        
        Divider()
            .style(.color, .accent)
        
        Text(introduction)
            .font(.title6)
            .style(.color, .primary)
    }
}
