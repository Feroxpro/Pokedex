//
//  ViewController.swift
//  Pokedex
//
//  Created by Felipe Domingos on 03/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var bottomSheet: UIView!
    @IBOutlet weak var constraintTop: NSLayoutConstraint!
    @IBOutlet weak var searchBtnView: UIView!
    @IBOutlet weak var typeLabel1: UILabel!
    @IBOutlet weak var typeLabel2: UILabel!
    @IBOutlet var firstView: UIView!
    @IBOutlet weak var typeView2: UIView!
    @IBOutlet weak var typeView1: UIView!
    
    
    var viewModel = SearchViewModel()

    
    let baseUrl: String = "https://pokeapi.co/api/v2"

    override func viewDidLoad() {
        super.viewDidLoad()
        AdjustViewController()

    }
    
    @IBAction func searchBtn(_ sender: Any) {
        viewModel.validatePoke(url: baseUrl, name: searchTextField.text ?? "") { register in
        self.addData(register: register)
        }
        constraintTop.constant = -48
        UIView.animate(withDuration: 0.5, delay: 0.8, options: [.curveLinear], animations: {
                self.bottomSheet.frame = CGRect(
                x:self.bottomSheet.frame.origin.x,
                y:self.bottomSheet.frame.origin.y,
                width:self.bottomSheet.frame.size.width,
                height:-448)
            }, completion: nil)

        idLabel.textColor = .white
        nameLabel.textColor = .white
        }
    func addData(register: Register) {
        if let name = register.name,
           let id = register.id,
           let others = register.sprites?.other {
            nameLabel.text = name
            if id >= 9 {
                idLabel.text = "*0\(id)"
            }
            idLabel.text = "*00\(id)"
            image.downloaded(from: others.home?.front_default ?? "")
        }
        let names = register.types
        for item in names {
            let result = item.type.name
            typeLabel1.text = result
            break
        }
            let name = register.types
            for item in name {
                let result = item.type.name
                typeLabel2.text = result
        }
        
        switch typeLabel1.text {
            case "electric":
                electricChanges()
        default: break
        }
        
        if typeLabel1.text == typeLabel2.text {
            typeLabel2.isHidden = true
            typeView2.isHidden = true
            }
    }
    
    func AdjustViewController() {
        bottomSheet.backgroundColor = .white
        bottomSheet.layer.cornerRadius = 35
        searchTextField.layer.cornerRadius = 10
        searchBtnView.layer.cornerRadius = 5
        searchTextField.text = "bulbasaur"
        nameLabel.textColor = .systemPink
        idLabel.textColor = .systemPink
        typeView1.backgroundColor = .systemPink
        typeView2.backgroundColor = .systemPink
        typeLabel1.textColor = .systemPink
        typeLabel2.textColor = .systemPink
        firstView.backgroundColor = .systemPink
        typeView2.layer.cornerRadius = 10
        typeView1.layer.cornerRadius = 10
        }
    func electricChanges() {
        firstView.backgroundColor = .green
        typeView1.backgroundColor = .red
        typeView2.backgroundColor = .red
        typeLabel1.textColor = .green
        typeLabel2.textColor = .green
    }
    
}



