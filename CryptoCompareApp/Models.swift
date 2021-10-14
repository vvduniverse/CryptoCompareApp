struct CoinsList: Codable {
    let data: [String: Datum]
    
    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }
}

struct Datum: Codable {
    let id, url: String
//    let imageURL: String?
    let name, symbol, coinName, fullName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case url = "Url"
//        case imageURL = "ImageUrl"
        case name = "Name"
        case symbol = "Symbol"
        case coinName = "CoinName"
        case fullName = "FullName"
    }
}

struct Coin {
    let id: Int
    let url: String
//    let imageURL: String?
    let name, symbol, coinName, fullName: String
}

enum Url: String {
    case base = "https://cryptocompare.com"
    case baseApi = "https://min-api.cryptocompare.com"
    case coinsList = "https://min-api.cryptocompare.com/data/all/coinlist"
}
