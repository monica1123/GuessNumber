//
//  ViewController.swift
//  GuessNumber
//
//  Created by Monica Lo on 2021/5/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var replyView: UIView!
    @IBOutlet weak var replyLabel: UILabel!
    
    @IBOutlet weak var timesLeft: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    
    @IBOutlet weak var askButton: UIButton!
    
    @IBOutlet weak var openingLabel: UILabel!
    
    var answer = Int.random(in: 1...50)
    var min = 1
    var max = 50
    
    var life = 6
    
    let lesss = ["想得美咧!🙄", "還早得很~🙄", "你哪來的自信?🙄", "也太看得起自己了吧!🙄"]
    let mores = ["這麼久他都和人跑了!😒", "你早點行動是會死膩!😒", "再拖延啊孤老終身吧你😒"]
    
    func gameOver(){
         if life == 0{
            replyView.backgroundColor = .black

            replyLabel.text = "你註定萬年單身😂"
            replyLabel.textColor = UIColor(red: 255/255, green: 251/255, blue: 0/255, alpha: 0.9)
            replyLabel.shadowColor = UIColor(red: 255/255, green: 251/255, blue: 0/255, alpha: 0.9)
       
            numberTextField.isEnabled = false
            askButton.isEnabled = false
       
            let controller = UIAlertController(title: "次數用盡", message: "想再問要給錢啊！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好啦...", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller, animated: true, completion: nil)
            
        } else {
          timesLeft.text = "\(life)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.isEnabled = false
        askButton.isEnabled = false
    }

    @IBAction func pay(_ sender: UIButton) {
       answer = Int.random(in: 1...50)
       min = 1
       max = 50
        
       life = 6
       timesLeft.text = "\(life)"
        
       openingLabel.isHidden = true
        
       replyView.backgroundColor = UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 0.9)
         
       replyLabel.text = "寫在肚裡問這還要我教?"
       replyLabel.textColor = .white
       replyLabel.shadowColor = .white
        
       rangeLabel.text = ""

       numberTextField.text = ""
       numberTextField.isEnabled = true
       askButton.isEnabled = true
    }
    
    @IBAction func ask(_ sender: UIButton) {
       numberTextField.resignFirstResponder()

       let numberText = numberTextField.text!
       let number = Int(numberText)
        
       if life >= 0{
        
          if numberTextField.text! == "" {
             let controller = UIAlertController(title: "沒寫你按屁啊！", message: "剛不是才教過？", preferredStyle: .alert)
             let okAction = UIAlertAction(title: "對不起我錯了！", style: .default, handler: nil)
             controller.addAction(okAction)
             present(controller, animated: true, completion: nil)
            
          } else if number != nil{
                    let guessNumber = number!
                    if guessNumber == 0 || guessNumber > 50{
                       let controller = UIAlertController(title: "眼瞎嗎？", message: "給我乖乖寫1~50", preferredStyle: .alert)
                       let okAction = UIAlertAction(title: "請再給我一次機會！(跪)", style: .default, handler: nil)
                       controller.addAction(okAction)
                       present(controller, animated: true, completion: nil)
                        
                    } else if guessNumber > answer{
                              life -= 1
                              timesLeft.text = "\(life)"

                              max = guessNumber - 1
                              rangeLabel.text = "\(min)~\(max)再猜"

                              replyView.backgroundColor = UIColor(red: 0/255, green: 145/255, blue: 147/255, alpha: 0.9)

                              replyLabel.text = "\(mores.randomElement()!)"
                              replyLabel.textColor = .white
                              replyLabel.shadowColor = .white
                              
                              gameOver()
                        
                    } else if guessNumber < answer{
                              life -= 1
                              timesLeft.text = "\(life)"

                              min = guessNumber + 1
                              rangeLabel.text = "\(min)~\(max)再猜"
                         
                              replyView.backgroundColor = UIColor(red: 0/255, green: 145/255, blue: 147/255, alpha: 0.9)

                              replyLabel.text = "\(lesss.randomElement()!)"
                              replyLabel.textColor = .white
                              replyLabel.shadowColor = .white
                        
                              gameOver()

                    } else {
                           life -= 1
                           timesLeft.text = "\(life)"

                           rangeLabel.text = "再玩再投幣"

                           replyView.backgroundColor = UIColor(red: 255/255, green: 252/255, blue: 121/255, alpha: 0.9)
                        
                           replyLabel.text = "高興了吧!還不快滾!👣"
                           replyLabel.textColor = UIColor(red: 255/255, green: 47/255, blue: 146/255, alpha: 0.9)
                           replyLabel.shadowColor = UIColor(red: 255/255, green: 47/255, blue: 146/255, alpha: 0.9)
                        
                           numberTextField.isEnabled = false
                           askButton.isEnabled = false
                        
                    }
          }
       }
    }
}
