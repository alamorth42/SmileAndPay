//
//  SmileAndPayTests.swift
//  SmileAndPayTests
//
//  Created by Achille LAMORTHE on 20/06/2022.
//

import XCTest
@testable import SmileAndPay

class SmileAndPayTests: XCTestCase {
    
    let viewModel = MainViewModel()
    // WE HAVE 20 TRANSACTIONS IN THE JSON
    let numberOfTransactions = 20
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMainViewModel() {
        testFetchTransactions()
        filterByAmount()
        filterByType()
        filterByDate()
        deleteTransaction()
    }
    
    func testFetchTransactions() {
        viewModel.onAppearViewModel()
        let expectation = expectation(description: "NumberTransactions")
        // DISPATCHQUEUE IN VM -> DISPATCHQUEUE IN TESTING
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            XCTAssertEqual(self.viewModel.transactions.count, self.numberOfTransactions)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 2.0)
    }
    
    func filterByAmount() {
        viewModel.filterByAmount()
        var transactionBefore: Transaction? = nil
        for transaction in viewModel.transactions {
            if transactionBefore != nil {
                XCTAssertGreaterThanOrEqual(transactionBefore!.amount, transaction.amount)
                transactionBefore = transaction
            } else {
                transactionBefore = transaction
            }
        }
    }
    
    func filterByType() {
        viewModel.filterByType()
        var transactionBefore: Transaction? = nil
        for transaction in viewModel.transactions {
            if transactionBefore != nil {
                XCTAssertGreaterThanOrEqual(transactionBefore!.type.title, transaction.type.title)
                transactionBefore = transaction
            } else {
                transactionBefore = transaction
            }
        }
    }
    
    func filterByDate() {
        viewModel.filterByDate()
        var transactionBefore: Transaction? = nil
        for transaction in viewModel.transactions {
            if transactionBefore != nil {
                XCTAssertGreaterThanOrEqual(transactionBefore!.datetime, transaction.datetime)
                transactionBefore = transaction
            } else {
                transactionBefore = transaction
            }
        }
    }
    
    func deleteTransaction() {
        let randomInt = Int.random(in: 0..<numberOfTransactions)
        let transactionToDelete = viewModel.transactions[randomInt]
        viewModel.deleteTransaction(transactionToDelete)
        
        // CHECK IF A TRANSACTION ID DELETED
        let expectation = expectation(description: "DeleteTransaction")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            XCTAssertEqual(self.viewModel.transactions.count, self.numberOfTransactions - 1)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 2.0)
        
        // CHECK IF THE GOOD TRANSACTION HAS BEEN REMOVED
        for transaction in viewModel.transactions {
            XCTAssertNotEqual(transaction.id, transactionToDelete.id)
        }
    }

}
