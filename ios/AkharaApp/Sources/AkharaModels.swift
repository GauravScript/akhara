import Foundation

public struct Product: Identifiable {
    public let id: Int
    public let name: String
    public let tag: String
    public let category: String
    public let price: Int
    public let originalPrice: Int
    public let imageName: String
    public let description: String
    public let features: [String]
    public let sizes: [String]

    public init(id: Int, name: String, tag: String, category: String, price: Int, originalPrice: Int, imageName: String, description: String, features: [String], sizes: [String]) {
        self.id = id
        self.name = name
        self.tag = tag
        self.category = category
        self.price = price
        self.originalPrice = originalPrice
        self.imageName = imageName
        self.description = description
        self.features = features
        self.sizes = sizes
    }
}

public struct CartItem: Identifiable {
    public var id: String { "\(product.id)_\(size)" }
    public let product: Product
    public let size: String
    public var quantity: Int

    public init(product: Product, size: String, quantity: Int = 1) {
        self.product = product
        self.size = size
        self.quantity = quantity
    }
}
