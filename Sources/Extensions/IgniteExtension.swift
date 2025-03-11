import Ignite

extension Body {
    func background(_ color: Color) -> Self {
        .init { self.style(.backgroundColor, color.description) }
    }
}

extension InlineElement {
    func style(_ property: Property, _ value: Palette) -> some InlineElement {
        self.style(property, value.rawValue)
    }
}

extension HTML {
    func style(_ property: Property, _ value: Palette) -> some HTML {
        self.style(property, value.rawValue)
    }
}
