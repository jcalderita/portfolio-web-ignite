import Ignite

@MainActor
var logo: some InlineElement {
    Span(Global.name)
        .font(.title5)
        .fontWeight(.bold)
        .style(.color, .primary)
        .margin(.none)
}
