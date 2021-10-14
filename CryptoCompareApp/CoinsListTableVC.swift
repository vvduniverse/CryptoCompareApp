//
//  CoinsListTableViewController.swift
//  CryptoCompareApp
//
//  Created by Vahtee Boo on 12.10.2021.
//

import UIKit

class CoinsListTableVC: UITableViewController {

    private var coins = [Coin]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let urlString = Url.coinsList.rawValue

        self.loadJson(fromURLString: urlString) { (result) in
            switch result {
            case .success(let data):
                self.parse(jsonData: data)
            case .failure(let error):
                print(error)
            }
        }
        
//        self.tableView.reloadData()

        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return coins.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let coin = coins[indexPath.row]
        
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(coin.id + 1).  " +  coin.symbol
        content.secondaryText = coin.coinName
//        content.image = UIImage(named: track.title)
//        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content

        return cell

    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CoinsListTableVC {
    
    private func parse(jsonData: Data) {


        do {
            let decodeData = try JSONDecoder().decode(CoinsList.self, from: jsonData)
            
            for (i, y) in decodeData.data.enumerated() {
                let coin = Coin.init(id: i,
                                     url: y.value.url,
////                                     imageURL: y.value.im,
                                     name: y.value.name,
                                     symbol: y.value.symbol,
                                     coinName: y.value.coinName,
                                     fullName: y.value.fullName)
//                print(coin)
                coins.append(coin)
//                for (i, y) in y.enumerated() {
//                    print(y)
//                }

//                print("Key is \(i), Value is \(y)")
//                print("y.key is \(y.key), y.value is \(y.value)")
//                y.value.id
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
//            print(coins)
        } catch {
            print("decode error")
        }
    }
    
    private func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
    
}
