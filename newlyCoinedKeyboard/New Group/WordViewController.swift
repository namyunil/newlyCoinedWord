//
//  WordViewController.swift
//  newlyCoinedKeyboard
//
//  Created by NAM on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController {
    
    
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    //    @IBOutlet var wordFirstButton: UIButton!
    
    
    @IBOutlet var wordButtonList: [UIButton]!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var backgroundImageView: UIImageView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //        wordFirstButton.isHidden = true
        

        
        designWordTextField()
        designResultLabel()
        desigNormalBackgroundImageView()

        for items in wordButtonList {
            items.layer.cornerRadius = 10
            items.layer.borderColor = UIColor.black.cgColor
            items.layer.borderWidth = 1.5
            
        }
  
       
//        wordTextField.text = getRandomword()
        
        
        
        
        // 함수 호출 후 사용하지 않아도 되는 키워드
        //@discardableResult
        @discardableResult
        func getRandomword() -> String {
            let random = ["중꺽마", "워라밸", "별다줄", "스불재", "오운완"]
            let result = random.randomElement()!
            print(result)
            
            return result
            // return 뒤에 코드는 실행되지 않는다.
            // return은 함수의 맨 마지막에 와야한다.
        }
        
        //        wordFirstButton.titleLabel?.font = .systemFont(ofSize: 20)
        //        wordFirstButton.titleLabel?.textColor = .black
        
        
    }
    
    func designWordTextField() {
        wordTextField.placeholder = "신조어를 입력해주세요."
        wordTextField.textColor = .black
        wordTextField.tintColor = .black
        wordTextField.backgroundColor = .clear
        wordTextField.layer.borderColor = UIColor.black.cgColor
        wordTextField.layer.borderWidth = 0.5
        
    }
    

    
    func designResultLabel() {
        resultLabel.backgroundColor = .clear
        resultLabel.textColor = .black
        resultLabel.textAlignment = .center
        resultLabel.font = .systemFont(ofSize: 16)
        resultLabel.numberOfLines = 0
    }
    
    func designWordButton(button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 4
//        wordButton.configuration = config

    }
    
    func desigNormalBackgroundImageView() {
        backgroundImageView.image = UIImage(named: "word_logo")
        backgroundImageView.backgroundColor = .clear
        backgroundImageView.contentMode = .scaleAspectFill
        
    }
    
    func designHighlitedBackgroundImageView() {
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.backgroundColor = .clear
        backgroundImageView.contentMode = .scaleAspectFill
        
    }
    //버튼 클릭 시 텍스트 필드의 텍스트에 버튼 타이틀이 들어가는 기능
    //1. 버튼 클릭
    @IBAction func wordButtonTapped(_ sender: UIButton) {
        print(sender.currentTitle)
        print(sender.titleLabel?.text)
        //2. 버튼 타이틀이 텍스트 필드의 텍스트에 들어감
        wordTextField.text = sender.currentTitle
        //3. 텍스트 필드의 텍스트 내용이 결과 레이블에 들어감
        //        textFieldKeyboardTapped(wordTextField)
        
    }
    
    @IBAction func tapGesturetapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func textFieldKeyboardTapped(_ sender: UITextField) {
        
        print("DidEndOnExit")
        
        //        resultLabel.text = wordTextField.text
        
        //        if wordTextField.text == "별다줄" {
        //
        //            resultLabel.text = "별다줄 뜻은 별거 다 줄인다입니다."
        //        } else if wordTextField.text == "뉴진스" {
        //            resultLabel.text = "뉴진스 뜻은 ..."
        //        } else {
        //            resultLabel.text = "찾는 결과가 없습니다."
        //
        //        }
        
        // 소문자만 입력 text?.lowercased()
        switch wordTextField.text?.lowercased() {
        case "별다줄":
            resultLabel.text = "별다줄 뜻은 별거 다 줄인다입니다."
        case "중꺽마":
            resultLabel.text = "중꺽마 뜻은 중요한 것은 꺽이지 않는 마음입니다."
        case "오운완":
            resultLabel.text = "오운완 뜻은 오늘 운동 완료입니다."
        case "스불재":
            resultLabel.text = "스불재 뜻은 스스로 불러온 재앙입니다."
        case "워라밸":
            resultLabel.text = "워라밸 뜻은 워크 라이프 밸런스입니다."
        default:
            resultLabel.text = "찾는 결과가 없습니다."
            
        }
        backgroundImageView.image = UIImage(named: "background")
        
    }
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        view.endEditing(true)
        
        switch wordTextField.text?.lowercased() {
        case "별다줄":
            resultLabel.text = "별다줄 뜻은 별거 다 줄인다입니다."
        case "중꺽마":
            resultLabel.text = "중꺽마 뜻은 중요한 것은 꺽이지 않는 마음입니다."
        case "오운완":
            resultLabel.text = "오운완 뜻은 오늘 운동 완료입니다."
        case "스불재":
            resultLabel.text = "스불재 뜻은 스스로 불러온 재앙입니다."
        case "워라밸":
            resultLabel.text = "워라밸 뜻은 워크 라이프 밸런스입니다."
        default:
            resultLabel.text = "찾는 결과가 없습니다."
            
        }
        backgroundImageView.image = UIImage(named: "background")
        
    }
    
    
}
