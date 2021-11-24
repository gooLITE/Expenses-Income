//
//  Constant.swift
//  Expenses&Income
//
//  Created by Yu Sum Yung on 2/11/2021.
//

import Foundation

let expenseCat = [
        ["Food", "fork.knife"],
        ["Groceries", "bag.fill"],
        ["Transportation", "tram.fill"],
        ["Clothes", "tshirt.fill"],
        ["Entertainment", "logo.playstation"],
        ["Health", "pills.fill"],
        ["Others", "note.text"]
    ]




struct Expenses: Codable{
    var date: String
    var amount: Double
    var category: String
    var memo: String
}




/*
    1. find the url of the plist file
    2. Create data from the content of url
    3. Decode the data and get the expenses
    4. Update the UI (testing the flow)
 */
