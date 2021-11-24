//
//  ExpenseTableVC.swift
//  Expenses&Income
//
//  Created by Yu Sum Yung on 30/10/2021.
//

import UIKit

protocol sendRecordBackDelegate {
    func sendRecordBack(record: Expenses)
}



class ExpenseTableVC: UITableViewController, UITextFieldDelegate{

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountTF: UITextField!
    @IBOutlet weak var catLabel: UILabel!
    @IBOutlet weak var memoTF: UITextField!

    var expenseRecord = Expenses(date: "", amount: 0.00, category: "Food", memo: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catLabel?.text = expenseRecord.category
        
        //datePicker lines
        datePicker?.date = NSDate() as Date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy"
        let dateString: String = dateFormatter.string(from: self.datePicker.date)
        dateLabel.text = dateString
        
        
    }

    
    //remove header
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 1{
            let height : CGFloat = datePicker.isHidden ? 0.0 : 170.0
            return height
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let dateTFPath = NSIndexPath(row: 0, section: 0)
        tableView.deselectRow(at: indexPath, animated: true)
        
        
//
//        if dateTFPath as IndexPath == indexPath {
//
//            datePicker.isHidden = !datePicker.isHidden
//
//            UIView.animate(withDuration: 0.3, animations: { () -> Void in
//                    self.tableView.beginUpdates()
//                self.tableView.deselectRow(at: indexPath, animated: true)
//                    self.tableView.endUpdates()
//                })
//        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? CategoryCollectionVC{
            destinationVC.delegate = self
        }
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy"
        let dateString: String = dateFormatter.string(from: self.datePicker.date)
        dateLabel.text = dateString
        expenseRecord.date = dateString
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //expenseRecord.amount = Double(textField.text)
        
        textField.endEditing(true)
    }
  
    
//    func saveData(){
//        let encoder = PropertyListEncoder();encoder.outputFormat = .xml
//        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask[0].description.appendingPathComponent("Expenses.plist"))
//
//        var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
//        var path = paths.stringByAppendingPathComponent("data.plist")
//        var fileManager = NSFileManager.defaultManager()
//
//
//    }
}


extension ExpenseTableVC: CategoryCollectionDelegate{
    func didUpdateExpenseCat(selectedCat: String) {
        print("in didUpdateExpenseCat: \(selectedCat)")
        expenseRecord.category = selectedCat
        catLabel.text = selectedCat
        tableView.reloadData()
    }
    
}
