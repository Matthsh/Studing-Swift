func stockList(_ listOfArt: [String], _ listOfCat: [String]) -> String {
    if listOfArt.isEmpty || listOfCat.isEmpty {
        return ""
    }
    var result = [String]()
    for cat in listOfCat {
        var sum = 0
        for art in listOfArt {
            if art.prefix(1) == cat {
                sum += Int(art.components(separatedBy: " ")[1])!
            }
        }
        result.append("(\(cat) : \(sum))")
    }
    return result.joined(separator: " - ")
}