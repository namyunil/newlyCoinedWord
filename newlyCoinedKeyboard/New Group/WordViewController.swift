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
    
    @IBOutlet var wordButton: [UIButton]!
    
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var backgroundImageView: UIImageView!
    
    
    enum newlyWordList: String {
        case 오운완
        case 스불재
        case 별다줄
        case 워라밸
        case 중꺽마
        case 맑눈광
        case 내또출
        case 억텐
    }
    
    var newlyWord: newlyWordList = .별다줄
    
    var newlyWordDictionary = ["오운완" : "오늘 운동 완료",
                               "스불재" : "스스로 불러온 재앙",
                               "별다줄" : "별 걸 다 줄인다",
                               "워라밸" : "워크 라이프 밸런스",
                               "중꺽마" : "중요한 건 꺽이지 않는 마음",
                               "맑눈광" : "맑은 눈의 광인", "내또출" : "내일 또 출근", "억텐" : "억지 텐션"
    ]
    
    var newlyWordArray = ["오운완", "스불재", "별다줄", "워라밸", "중꺽마", "맑눈광", "내또출", "억텐"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //        wordFirstButton.isHidden = true
        
        
        
        designWordTextField(textField: wordTextField)
        designResultLabel(label: resultLabel)
        desigNormalBackgroundImageView(imageview: backgroundImageView)
        for button in wordButton {
            button.layer.cornerRadius = 10
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1.5
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
    
    func alert() {
        if let wordTextField = wordTextField.text {
            if wordTextField.count == 1 || wordTextField.count == 0 {
                let alert = UIAlertController(title: "경고 문구", message: "알맞은 글자 수를 입력해주세요.", preferredStyle: .alert)
                
                let cancel = UIAlertAction(title: "취소", style: .cancel)
                let ok = UIAlertAction(title: "확인", style: .default)
                //3.
                alert.addAction(cancel)
                alert.addAction(ok)
                //4.
                present(alert, animated: true)
            }
        }
    }
    
    func designWordTextField(textField: UITextField) {
        textField.placeholder = "신조어를 입력해주세요."
        textField.textColor = .black
        textField.tintColor = .black
        textField.backgroundColor = .clear
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.5
        
    }
    
    func designWordButton(button: UIButton) {
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.5
        
    }
    
    
    
    func designResultLabel(label: UILabel) {
        label.backgroundColor = .clear
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
    }
    
    
    func desigNormalBackgroundImageView(imageview: UIImageView) {
        imageview.image = UIImage(named: "word_logo")
        imageview.backgroundColor = .clear
        imageview.contentMode = .scaleAspectFill
        
    }
    
    func designHighlitedBackgroundImageView(imageview: UIImageView) {
        imageview.image = UIImage(named: "background")
        imageview.backgroundColor = .clear
        imageview.contentMode = .scaleAspectFill
        
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
        //4. 버튼 클릭시 랜덤하게 신조어 대입
        sender.setTitle(newlyWordArray.shuffled()[sender.tag - 1], for: .normal)
        
    }
    
    @IBAction func tapGesturetapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func textFieldKeyboardTapped(_ sender: UITextField) {
        
        print("DidEndOnExit")
        
        alert()
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
        
        alert()
        
        //버튼 클릭 시 텍스트 필드 내용에 따라 결과 레이블의 값이 달라지는 기능
        
        
        if wordTextField.text == newlyWord.rawValue {
            resultLabel.text = newlyWordDictionary["\(newlyWord.rawValue)"]
        } else if wordTextField.text != newlyWord.rawValue {
            resultLabel.text = newlyWordDictionary["\(wordTextField.text!)"]
        }
        
        
    
//        for items in newlyWordDictionary.keys {
//            if items == wordTextField.text {
//                resultLabel.text = newlyWordDictionary["\(items)"]
//            }
//        }
        
       
        
        
        
        //        switch wordTextField.text?.lowercased() {
        //        case "별다줄":
        //            resultLabel.text = "별다줄 뜻은 별거 다 줄인다입니다."
        //        case "중꺽마":
        //            resultLabel.text = "중꺽마 뜻은 중요한 것은 꺽이지 않는 마음입니다."
        //        case "오운완":
        //            resultLabel.text = "오운완 뜻은 오늘 운동 완료입니다."
        //        case "스불재":
        //            resultLabel.text = "스불재 뜻은 스스로 불러온 재앙입니다."
        //        case "워라밸":
        //            resultLabel.text = "워라밸 뜻은 워크 라이프 밸런스입니다."
        //        default:
        //            resultLabel.text = "찾는 결과가 없습니다."
        //
        //        }
        backgroundImageView.image = UIImage(named: "background")
        
    }
    
    
}
