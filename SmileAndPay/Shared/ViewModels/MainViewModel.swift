//
//  MainViewModel.swift
//  SmileAndPay
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var showTabBar = true
        
    func onAppearViewModel() {
        guard let data = readLocalFile(forName: "exemple_transactions") else { return }
        let transactions = parse(jsonData: data)
        DispatchQueue.main.async {
            self.transactions = transactions
        }
    }
    
    func filterByAmount() {
        transactions = transactions.sorted(by: {$0.amount > $1.amount})
    }
    
    func filterByType() {
        transactions = transactions.sorted(by: {$0.type.title > $1.type.title })
    }
    
    func filterByDate() {
        transactions = transactions.sorted(by: {$0.datetime > $1.datetime })
    }
    
    func deleteTransaction(_ transaction: Transaction) {
        var i = 0
        while (i < transactions.count) {
            if transactions[i].id == transaction.id {
                DispatchQueue.main.async {
                    self.transactions.remove(at: i)
                }
                break
            }
            i += 1
        }
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) -> [Transaction] {
        do {
            let decodedData = try JSONDecoder().decode(TransactionsData.self,
                                                       from: jsonData)
            
            let transactions = decodedData.transactions
            
            var transactionStruct: [Transaction] = []
            
            for transaction in transactions {
                if let amount = Double(transaction.amount) {
                    var type: TypeTransaction = .crédit
                    if transaction.type == "débit" {
                        type = .débit
                    }
                    transactionStruct.append(Transaction(id: transaction.id,
                                                         datetime: transaction.datetime,
                                                         amount: amount,
                                                         type: type,
                                                         mode: transaction.mode,
                                                         commentaire: transaction.commentaire))
                }
            }
            return transactionStruct
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
}
