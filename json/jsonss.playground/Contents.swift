
struct CoinsList: Codable {
    let data: [String: Datum]
    
    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }
}

struct Datum: Codable {
    let id, url: String
    let imageURL: String?
    let name, symbol, coinName, fullName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case url = "Url"
        case imageURL = "ImageUrl"
        case name = "Name"
        case symbol = "Symbol"
        case coinName = "CoinName"
        case fullName = "FullName"
    }
}

//struct CoinsList: Codable {
//    let response, message: String
//    let data: [String: Datum]
//    let rateLimit: RateLimit
//    let hasWarning: Bool
//    let type: Int
//
//    enum CodingKeys: String, CodingKey {
//        case response = "Response"
//        case message = "Message"
//        case data = "Data"
//        case rateLimit = "RateLimit"
//        case hasWarning = "HasWarning"
//        case type = "Type"
//    }
//}
//
//// MARK: - Datum
//struct Datum: Codable {
//    let id, url: String
//    let imageURL: String?
//    let contentCreatedOn: Int
//    let name, symbol, coinName, fullName: String
//    let datumDescription: String
//    let assetTokenStatus: AssetTokenStatus
//    let algorithm, proofType, sortOrder: String
//    let sponsored: Bool
//    let taxonomy: Taxonomy
//    let rating: Rating
//    let isTrading: Bool
//    let totalCoinsMined, circulatingSupply: Double?
//    let blockNumber: Int?
//    let netHashesPerSecond, blockReward: Double?
//    let blockTime: Double?
//    let assetLaunchDate: String?
//    let assetWhitepaperURL: String?
//    let assetWebsiteURL: String?
//    let maxSupply, mktCapPenalty: Double?
//    let isUsedInDefi, isUsedInNft: Int?
//    let platformType: PlatformType?
//    let builtOn, smartContractAddress: String?
//    let decimalPoints, difficulty: Double?
//    let algorithmType: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "Id"
//        case url = "Url"
//        case imageURL = "ImageUrl"
//        case contentCreatedOn = "ContentCreatedOn"
//        case name = "Name"
//        case symbol = "Symbol"
//        case coinName = "CoinName"
//        case fullName = "FullName"
//        case datumDescription = "Description"
//        case assetTokenStatus = "AssetTokenStatus"
//        case algorithm = "Algorithm"
//        case proofType = "ProofType"
//        case sortOrder = "SortOrder"
//        case sponsored = "Sponsored"
//        case taxonomy = "Taxonomy"
//        case rating = "Rating"
//        case isTrading = "IsTrading"
//        case totalCoinsMined = "TotalCoinsMined"
//        case circulatingSupply = "CirculatingSupply"
//        case blockNumber = "BlockNumber"
//        case netHashesPerSecond = "NetHashesPerSecond"
//        case blockReward = "BlockReward"
//        case blockTime = "BlockTime"
//        case assetLaunchDate = "AssetLaunchDate"
//        case assetWhitepaperURL = "AssetWhitepaperUrl"
//        case assetWebsiteURL = "AssetWebsiteUrl"
//        case maxSupply = "MaxSupply"
//        case mktCapPenalty = "MktCapPenalty"
//        case isUsedInDefi = "IsUsedInDefi"
//        case isUsedInNft = "IsUsedInNft"
//        case platformType = "PlatformType"
//        case builtOn = "BuiltOn"
//        case smartContractAddress = "SmartContractAddress"
//        case decimalPoints = "DecimalPoints"
//        case difficulty = "Difficulty"
//        case algorithmType = "AlgorithmType"
//    }
//}
