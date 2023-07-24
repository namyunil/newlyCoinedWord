//
//  DateViewController.swift
//  newlyCoinedKeyboard
//
//  Created by NAM on 2023/07/20.
//

import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var background100ImageView: UIImageView!
    @IBOutlet var background200ImageView: UIImageView!
    @IBOutlet var background300ImageView: UIImageView!
    @IBOutlet var background400ImageView: UIImageView!
    @IBOutlet var backgroundView: [UIView]!
    @IBOutlet var date100Label: UILabel!
    @IBOutlet var date200Label: UILabel!
    @IBOutlet var date300Label: UILabel!
    @IBOutlet var date400Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for items in backgroundView {
            items.layer.cornerRadius = 20
            items.layer.shadowColor = UIColor.black.cgColor
            items.layer.shadowOffset = CGSize(width: 10, height: 10) // CGSize(width: 0, height: 0)
            items.layer.shadowRadius = 10 // 넓이
            items.layer.shadowOpacity = 0.50 // 불투명도
            items.backgroundColor = .clear
            
        }
        
        designAnniversaryDay(anniversaryImageView: background100ImageView, dayLabel: date100Label,  anniversaryImage: "cake")
        designAnniversaryDay(anniversaryImageView: background200ImageView, dayLabel: date200Label, anniversaryImage: "icecream")
        designAnniversaryDay(anniversaryImageView: background300ImageView, dayLabel: date300Label,  anniversaryImage: "macaroon")
        designAnniversaryDay(anniversaryImageView: background400ImageView, dayLabel: date400Label,  anniversaryImage: "churros")
        designDatePicker()
        datePickerValueChanged(datePicker)
        
        //클릭하지 않더라도, 날짜를 뜨게하는 방법
        //Action 함수를 viewDidLoad()에서 호출하면 된다..!
    }
    
    
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        print(sender.date)
        //시간은 영국 표준시 기준 9시간 차이
        
        //    yyyy-MM-dd
        //    hh:mm:ss
        let format = DateFormatter()
        format.dateFormat = "MM월 dd일, yyyy년"
        //+100일 뒤 날짜
        let result100 = Calendar.current.date(byAdding: .day, value: 100, to: sender.date)
        
        //        print(result)
        //        100일 뒤 날짜를 날짜 포맷 변경해서
        let value100 = format.string(from: result100!)
        print(value100)
        
        let result200 = Calendar.current.date(byAdding: .day, value: 200, to: sender.date)
        print(result200)
        let value200 = format.string(from: result200!)
        print(value200)
        
        let result300 = Calendar.current.date(byAdding: .day, value: 300, to: sender.date)
        print(result300)
        let value300 = format.string(from: result300!)
        print(value300)
        
        let result400 = Calendar.current.date(byAdding: .day, value: 400, to: sender.date)
        print(result400)
        let value400 = format.string(from: result400!)
        print(value400)
        
        
        
        //DateFormatter: 1. 시간대 변경 2. 날짜 포맷 변경
        //        let format = DateFormatter()
        //        format.dateFormat = "MM월 dd일, yyyy년"
        //        let value = format.string(from: sender.date)
        //        print(value)
        //

        date100Label.text = value100
        date200Label.text = value200
        date300Label.text = value300
        date400Label.text = value400
        
        
    }
    
    
    func designAnniversaryDay(anniversaryImageView: UIImageView, dayLabel: UILabel, anniversaryImage: String) {
        anniversaryImageView.image = UIImage(named: anniversaryImage)
        anniversaryImageView.layer.cornerRadius = 10
        anniversaryImageView.clipsToBounds = true
        anniversaryImageView.contentMode = .scaleAspectFill
        dayLabel.backgroundColor = .clear
        dayLabel.textAlignment = .center
        dayLabel.textColor = .white
       
    }
    
    //    func testViewProperty() {
    //        background100ImageView.layer.cornerRadius = 20
    //        background100ImageView.backgroundColor = .green
    //        background100ImageView.layer.shadowColor = UIColor.black.cgColor
    //        background100ImageView.layer.shadowOffset = .zero // CGSize(width: 15, height: 15) // CGSize(width: 0, height: 0)
    //        background100ImageView.layer.shadowRadius = 30 // 넓이
    //        background100ImageView.layer.shadowOpacity = 0.80 // 불투명도
    //        background100ImageView.clipsToBounds = false
    //
    //
    //
    //        date100Label.layer.cornerRadius = 20
    //        date100Label.clipsToBounds = true
    //        date100Label.backgroundColor = .clear
    //
    //    }
    
    func designDatePicker() {
        
        datePicker.tintColor = .systemPink
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
            
        }
        
        
        
    }
    
}
