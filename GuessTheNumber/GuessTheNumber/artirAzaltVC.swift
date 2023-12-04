//
//  artirAzaltVC.swift
//  GuessTheNumber
//
//  Created by Halit Bakır on 21.06.2023.
//

import UIKit

class artirAzaltVC: UIViewController {

    @IBOutlet weak var emojiImage: UIImageView!
    
    @IBOutlet weak var hakLabel: UILabel!
    
    @IBOutlet weak var artirAzaltLabel: UILabel!
    
    @IBOutlet weak var tahminGir: UITextField!
    
    
    var dogruSayi: Int = 0
    var kalanHak: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        dogruSayi = Int.random(in: 1...20)
        guncelleHakLabel()
    }
    
    @IBAction func tahminEtTiklandi(_ sender: Any) {
        if kalanHak > 0 {
                if let tahmin = Int(tahminGir.text ?? "") {
                    if tahmin < dogruSayi {
                        artirAzaltLabel.text = "Arttır"
                    } else if tahmin > dogruSayi {
                        artirAzaltLabel.text = "Azalt"
                    } else {
                        artirAzaltLabel.text = "KAZANDIN!"
                        kalanHak = 0 
                        emojiImage.image = UIImage(named: "basarili.png")
                    }
                } else {
                    artirAzaltLabel.text = "Geçersiz giriş. Lütfen bir sayı girin."
                }
                
                kalanHak -= 1 
                guncelleHakLabel()
                
                if kalanHak == 0 {
                    artirAzaltLabel.text = "KAYBETTİN! Doğru sayı: \(dogruSayi)"
                    emojiImage.image = UIImage(named: "basarisiz.png")
                }
            }
            
            tahminGir.text = "" 
        }

        func guncelleHakLabel() {
            hakLabel.text = "Hak: \(kalanHak)"
        }
    }
    

