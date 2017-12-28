import LeafCore

let leaf = Leaf()

do {
    try leaf.run()
} catch {
    print("An error occurred: \(error)")
}
