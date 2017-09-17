import LeafProvider

extension Config {
    public func setup() throws {
        // allow fuzzy conversions for these types
        // (add your own types here)
        Node.fuzzy = [JSON.self, Node.self]

        try setupProviders()
        try setupPreparations()

        addConfigurable(command: SeedCommand.init, name: "seed")
    }

    /// Configure providers
    private func setupProviders() throws {
        try addProvider(LeafProvider.Provider.self)
    }

    /// Add all models that should have their
    /// schemas prepared before the app boots
    private func setupPreparations() throws {
    }
}
