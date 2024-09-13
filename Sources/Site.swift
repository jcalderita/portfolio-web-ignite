import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        let site = JcalderitaSite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct JcalderitaSite: Site {
    var name = "jcalderita"
    var titleSuffix = " – Profile"
    var url = URL("https://www.jcalderita.com")
    var builtInIconsEnabled = true
    var pageWidth = 12
    var favicon = URL("/images/favicon.png")
    var feedConfiguration = FeedConfiguration(mode: .full, contentCount: 20, image: .init(url: "https://www.jcalderita.com/images/favicon.png", width: 32, height: 32))
    var author = "Jorge Calderita"


    var homePage = Home()
    var theme = MyTheme()
}


