import SwiftUI

public struct AkharaContentView: View {
    @State private var selectedCategory: String = "All"
    @State private var cart: [CartItem] = []
    @State private var isBagPresented: Bool = false
    @State private var selectedProduct: Product? = nil
    @State private var showToast: Bool = false
    @State private var toastText: String = ""

    let categories = ["All", "Women's Sculpt", "Men's Strength", "Technical Sets"]

    let catalog: [Product] = [
        Product(
            id: 1,
            name: "The Akhara Gada Heavyweight Tee",
            tag: "DROP EXCLUSIVE",
            category: "Men's Strength",
            price: 1899,
            originalPrice: 2499,
            imageName: "desi_gym_pump_tee_1789228870689",
            description: "260 GSM vintage-washed French terry cotton. Features sacred mandala geometry framing the traditional Indian Akhara Gada (mace) and 'शक्ति और समर्पण' calligraphy.",
            features: ["260 GSM Heavy Terry", "Drop-shoulder Oversized Fit", "High-density Screenprint", "Pre-shrunk Vintage Wash"],
            sizes: ["M", "L", "XL", "XXL"]
        ),
        Product(
            id: 2,
            name: "The Mandala Flow Sculpt Set",
            tag: "BESTSELLER",
            category: "Women's Sculpt",
            price: 2699,
            originalPrice: 3499,
            imageName: "women_mandala_set_1789229190657",
            description: "Terracotta high-waisted squat-proof leggings and longline bra set. Contouring mandala lattice placement highlights natural athletic silhouette.",
            features: ["Squat-Tested 100% Opaque", "High-Rise No-Roll Waistband", "Buttery Soft 4-Way Flex", "Sweat-Wicking Anti-Microbial"],
            sizes: ["XS", "S", "M", "L"]
        ),
        Product(
            id: 3,
            name: "The Shakti Cropped Hoodie Set",
            tag: "GEN Z FAVORITE",
            category: "Women's Sculpt",
            price: 2499,
            originalPrice: 3199,
            imageName: "women_shakti_cropped_1789229209368",
            description: "Sage green raw-cut French terry crop hoodie with gold Devanagari 'शक्ति' script, paired with compressive biker shorts featuring dual phone pockets.",
            features: ["Raw Cut Edge Hem", "Biker Shorts with Deep Pockets", "Breathable Cotton Blend", "Subtle Paisley Sleeve Detailing"],
            sizes: ["XS", "S", "M", "L"]
        ),
        Product(
            id: 4,
            name: "The Ajrakh Matrix Compression Set",
            tag: "PERFORMANCE TECH",
            category: "Technical Sets",
            price: 2999,
            originalPrice: 3999,
            imageName: "ajrakh_compression_wear_1789228887908",
            description: "Elite muscle-support compression top & shorts. Features authentic Kutch/Sindhi Ajrakh geometric star panels along natural muscle lines.",
            features: ["Zonal Targeted Compression", "Sublimation Stretch Print", "Flatlock Anti-Chafe Seams", "Quick-Dry Tech Poly-Elastane"],
            sizes: ["S", "M", "L", "XL"]
        ),
        Product(
            id: 5,
            name: "The Kalamkari Warrior Halter Set",
            tag: "LUXURY SERIES",
            category: "Women's Sculpt",
            price: 2899,
            originalPrice: 3699,
            imageName: "women_kalamkari_set_1789229234783",
            description: "Midnight onyx high-neck strappy halter sports bra paired with high-rise sculpting tights. Accented with metallic bronze Kalamkari vine line-art.",
            features: ["High-Impact Support", "Sculpting Core Waistband", "Metallic Bronze Foil Accent", "Zero Front-Seam Pattern"],
            sizes: ["XS", "S", "M", "L"]
        )
    ]

    var filteredProducts: [Product] {
        if selectedCategory == "All" {
            return catalog
        }
        return catalog.filter { $0.category == selectedCategory }
    }

    var totalItemsCount: Int {
        cart.reduce(0) { $0 + $1.quantity }
    }

    var totalAmount: Int {
        cart.reduce(0) { $0 + ($1.product.price * $1.quantity) }
    }

    public init() {}

    public var body: some View {
        ZStack {
            Color(red: 10/255, green: 10/255, blue: 12/255).ignoresSafeArea()

            VStack(spacing: 0) {
                // Top Header
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 6) {
                            Text("AKHARA")
                                .font(.system(size: 20, weight: .black, design: .serif))
                                .tracking(3)
                                .foregroundColor(.white)
                            Text("CLUB")
                                .font(.system(size: 9, weight: .bold))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color(red: 212/255, green: 175/255, blue: 55/255).opacity(0.2))
                                .foregroundColor(Color(red: 243/255, green: 222/255, blue: 179/255))
                                .cornerRadius(4)
                        }
                        Text("HERITAGE ATHLEISURE")
                            .font(.system(size: 9, weight: .bold))
                            .tracking(1.5)
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    // Bag Button
                    Button(action: { isBagPresented = true }) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "bag")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(Color.white.opacity(0.08))
                                .clipShape(Circle())

                            if totalItemsCount > 0 {
                                Text("\(totalItemsCount)")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(.black)
                                    .frame(width: 17, height: 17)
                                    .background(Color(red: 212/255, green: 175/255, blue: 55/255))
                                    .clipShape(Circle())
                                    .offset(x: 4, y: -2)
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 8)
                .padding(.bottom, 12)

                // Scrollable Content
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        // Drop Hero Banner
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("DROP #04 IS LIVE")
                                    .font(.system(size: 9, weight: .black))
                                    .tracking(1)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 3)
                                    .background(Color.yellow.opacity(0.15))
                                    .foregroundColor(.yellow)
                                    .cornerRadius(20)

                                Spacer()
                                Text("Limited to 150 Units")
                                    .font(.system(size: 11, weight: .medium))
                                    .foregroundColor(.gray)
                            }

                            Text("ANCIENT STRENGTH.\nMODERN ARMOR.")
                                .font(.system(size: 24, weight: .heavy))
                                .foregroundColor(.white)

                            Text("Indian Akhara motifs fused with high-stretch squat-proof performance textiles.")
                                .font(.system(size: 12))
                                .foregroundColor(Color.gray.opacity(0.9))

                            HStack(spacing: 8) {
                                Label("Squat-Proof", systemImage: "checkmark.shield.fill")
                                Label("Anti-Chafe", systemImage: "bolt.shield.fill")
                            }
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(Color(red: 212/255, green: 175/255, blue: 55/255))
                            .padding(.top, 4)
                        }
                        .padding(18)
                        .background(
                            LinearGradient(
                                colors: [Color(white: 0.14), Color(white: 0.08)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(22)
                        .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(Color.white.opacity(0.08), lineWidth: 1)
                        )
                        .padding(.horizontal, 16)

                        // Category Filter Pill Selector
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(categories, id: \.self) { cat in
                                    Button(action: { selectedCategory = cat }) {
                                        Text(cat)
                                            .font(.system(size: 12, weight: selectedCategory == cat ? .bold : .medium))
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 8)
                                            .background(selectedCategory == cat ? Color.white : Color.white.opacity(0.08))
                                            .foregroundColor(selectedCategory == cat ? .black : .white)
                                            .cornerRadius(20)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                        }

                        // Product Grid (2 columns)
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 14), GridItem(.flexible(), spacing: 14)], spacing: 16) {
                            ForEach(filteredProducts) { item in
                                ProductCard(product: item) {
                                    selectedProduct = item
                                } onQuickAdd: {
                                    addToCart(product: item, size: item.sizes.first ?? "M")
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 40)
                    }
                }
            }

            // Toast Alert
            if showToast {
                VStack {
                    HStack(spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                        Text(toastText)
                            .font(.system(size: 12, weight: .bold))
                        Spacer()
                    }
                    .padding(14)
                    .background(Color(red: 212/255, green: 175/255, blue: 55/255))
                    .foregroundColor(.black)
                    .cornerRadius(14)
                    .shadow(radius: 10)
                    .padding(.horizontal, 20)
                    .transition(.move(edge: .top).combined(with: .opacity))

                    Spacer()
                }
                .padding(.top, 10)
                .zIndex(10)
            }
        }
        .sheet(item: $selectedProduct) { prod in
            ProductDetailSheet(product: prod) { size in
                addToCart(product: prod, size: size)
                selectedProduct = nil
            }
        }
        .sheet(isPresented: $isBagPresented) {
            BagSheetView(cart: $cart, totalAmount: totalAmount)
        }
    }

    private func addToCart(product: Product, size: String) {
        if let index = cart.firstIndex(where: { $0.product.id == product.id && $0.size == size }) {
            cart[index].quantity += 1
        } else {
            cart.append(CartItem(product: product, size: size, quantity: 1))
        }
        triggerToast("Added \(product.name) (\(size)) to Bag")
    }

    private func triggerToast(_ msg: String) {
        toastText = msg
        withAnimation { showToast = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation { showToast = false }
        }
    }
}

// Product Card
struct ProductCard: View {
    let product: Product
    let onSelect: () -> Void
    let onQuickAdd: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(white: 0.12))
                    .aspectRatio(3/4, contentMode: .fit)
                    .overlay(
                        VStack {
                            Image(systemName: "tshirt.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.gray.opacity(0.3))
                        }
                    )

                Text(product.tag)
                    .font(.system(size: 8, weight: .heavy))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 3)
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(Color(red: 243/255, green: 222/255, blue: 179/255))
                    .cornerRadius(6)
                    .padding(8)
            }
            .onTapGesture { onSelect() }

            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
                    .lineLimit(1)

                Text(product.category.uppercased())
                    .font(.system(size: 9, weight: .semibold))
                    .foregroundColor(.gray)

                HStack {
                    Text("₹\(product.price)")
                        .font(.system(size: 13, weight: .heavy))
                        .foregroundColor(.white)

                    Text("₹\(product.originalPrice)")
                        .font(.system(size: 10))
                        .strikethrough()
                        .foregroundColor(.gray)

                    Spacer()

                    Button(action: onQuickAdd) {
                        Image(systemName: "plus")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.black)
                            .frame(width: 26, height: 26)
                            .background(Color(red: 212/255, green: 175/255, blue: 55/255))
                            .cornerRadius(8)
                    }
                }
                .padding(.top, 2)
            }
        }
        .padding(10)
        .background(Color(white: 0.08))
        .cornerRadius(18)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.white.opacity(0.06), lineWidth: 1)
        )
    }
}

// Product Detail Sheet
struct ProductDetailSheet: View {
    let product: Product
    let onAddToBag: (String) -> Void
    @State private var selectedSize: String = "M"
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color(red: 14/255, green: 14/255, blue: 16/255).ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    }
                }

                Text(product.tag)
                    .font(.system(size: 9, weight: .black))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(Color.yellow.opacity(0.15))
                    .foregroundColor(.yellow)
                    .cornerRadius(6)

                Text(product.name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)

                HStack {
                    Text("₹\(product.price)")
                        .font(.system(size: 22, weight: .heavy))
                        .foregroundColor(Color(red: 212/255, green: 175/255, blue: 55/255))

                    Text("₹\(product.originalPrice)")
                        .strikethrough()
                        .foregroundColor(.gray)
                }

                Text(product.description)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .lineSpacing(4)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Features:")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)

                    ForEach(product.features, id: \.self) { feat in
                        HStack(spacing: 6) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                                .font(.system(size: 12))
                            Text(feat)
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Select Size")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)

                    HStack(spacing: 10) {
                        ForEach(product.sizes, id: \.self) { s in
                            Button(action: { selectedSize = s }) {
                                Text(s)
                                    .font(.system(size: 13, weight: .bold))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .background(selectedSize == s ? Color(red: 212/255, green: 175/255, blue: 55/255) : Color.white.opacity(0.08))
                                    .foregroundColor(selectedSize == s ? .black : .white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }

                Spacer()

                Button(action: { onAddToBag(selectedSize) }) {
                    Text("Add to Bag • ₹\(product.price)")
                        .font(.system(size: 14, weight: .heavy))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color(red: 212/255, green: 175/255, blue: 55/255))
                        .cornerRadius(14)
                }
            }
            .padding(24)
        }
    }
}

// Shopping Bag Sheet
struct BagSheetView: View {
    @Binding var cart: [CartItem]
    let totalAmount: Int
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color(red: 14/255, green: 14/255, blue: 16/255).ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("YOUR BAG")
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    }
                }

                if cart.isEmpty {
                    VStack(spacing: 12) {
                        Spacer()
                        Image(systemName: "bag")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                        Text("Your bag is currently empty.")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                } else {
                    List {
                        ForEach($cart) { $item in
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.product.name)
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundColor(.white)
                                    Text("Size: \(item.size) • ₹\(item.product.price)")
                                        .font(.system(size: 11))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Text("Qty: \(item.quantity)")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            .listRowBackground(Color(white: 0.1))
                        }
                    }
                    .listStyle(.plain)

                    VStack(spacing: 8) {
                        HStack {
                            Text("Total")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                            Spacer()
                            Text("₹\(totalAmount)")
                                .font(.system(size: 18, weight: .heavy))
                                .foregroundColor(Color(red: 212/255, green: 175/255, blue: 55/255))
                        }

                        Button(action: {
                            // Checkout action
                        }) {
                            Text("Proceed to Checkout")
                                .font(.system(size: 14, weight: .heavy))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color(red: 212/255, green: 175/255, blue: 55/255))
                                .cornerRadius(14)
                        }
                    }
                }
            }
            .padding(20)
        }
    }
}
