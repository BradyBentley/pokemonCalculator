//
//  ViewController.swift
//  Calculator
//
//  Created by Brady Bentley on 1/8/19.
//  Copyright © 2019 Brady. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var isTypingANumber: Bool = false
    var firstNumber: Double = 0.0
    var mathOperation = ""
    var currentNumber: Double = 0.0
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addAllSubViews()
        constrainPokemonImageView()
        constrainCalculatorTextField()
        constrainTopButtonStackView()
        constrainTopMiddleButtonStackView()
        constrainMiddleButtonStackView()
        constrainBottomMiddleButtonStackView()
        constrainZeroButton()
        constrainBottomButtonStackView()
        //button functionatility
        oneButton.addTarget(self, action: #selector(digits(button:)), for: .touchUpInside)
        oneButton.addTarget(self, action: #selector(digitsUnTapped(button:)), for: .touchDown)
        twoButton.addTarget(self, action: #selector(digits(button:)), for: .touchUpInside)
        twoButton.addTarget(self, action: #selector(digitsUnTapped(button:)), for: .touchDown)
        threeButton.addTarget(self, action: #selector(digits(button:)), for: .touchUpInside)
        threeButton.addTarget(self, action: #selector(digitsUnTapped(button:)), for: .touchDown)
        fourButton.addTarget(self, action: #selector(digits(button:)), for: .touchUpInside)
        fourButton.addTarget(self, action: #selector(digitsUnTapped(button:)), for: .touchDown)
        fiveButton.addTarget(self, action: #selector(digits(button:)), for: .touchUpInside)
        fiveButton.addTarget(self, action: #selector(digitsUnTapped(button:)), for: .touchDown)
        sixButton.addTarget(self, action: #selector(digits(button:)), for: .touchUpInside)
        sixButton.addTarget(self, action: #selector(digitsUnTapped(button:)), for: .touchDown)
        sevenButton.addTarget(self, action: #selector(digits(button:)), for: .touchUpInside)
        sevenButton.addTarget(self, action: #selector(digitsUnTapped(button:)), for: .touchDown)
        eightButton.addTarget(self, action: #selector(digits(button:)), for: .touchUpInside)
        eightButton.addTarget(self, action: #selector(digitsUnTapped(button:)), for: .touchDown)
        nineButton.addTarget(self, action: #selector(digits(button:)), for: .touchUpInside)
        nineButton.addTarget(self, action: #selector(digitsUnTapped(button:)), for: .touchDown)
        zeroButton.addTarget(self, action: #selector(digits(button:)), for: .touchUpInside)
        zeroButton.addTarget(self, action: #selector(digitsUnTapped(button:)), for: .touchDown)
        clearButton.addTarget(self, action: #selector(clearButtonTapped(button:)), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(specialCharacterUnTapped(button:)), for: .touchDown)
        decimalButton.addTarget(self, action: #selector(digits(button:)), for: .touchUpInside)
        decimalButton.addTarget(self, action: #selector(digitsUnTapped(button:)), for: .touchDown)
        digimonButton.addTarget(self, action: #selector(digimonButtonTapped(button:)), for: .touchUpInside)
        digimonButton.addTarget(self, action: #selector(specialCharacterUnTapped(button:)), for: .touchDown)
        plusButton.addTarget(self, action: #selector(operation(button:)), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(orangeButtonUnTapped(button:)), for: .touchDown)
        minusButton.addTarget(self, action: #selector(operation(button:)), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(orangeButtonUnTapped(button:)), for: .touchDown)
        timesButton.addTarget(self, action: #selector(operation(button:)), for: .touchUpInside)
        timesButton.addTarget(self, action: #selector(orangeButtonUnTapped(button:)), for: .touchDown)
        divisionButton.addTarget(self, action: #selector(operation(button:)), for: .touchUpInside)
        divisionButton.addTarget(self, action: #selector(orangeButtonUnTapped(button:)), for: .touchDown)
        equalButton.addTarget(self, action: #selector(equalButtonPressed(button:)), for: .touchUpInside)
        equalButton.addTarget(self, action: #selector(orangeButtonUnTapped(button:)), for: .touchDown)
        pokemonButton.addTarget(self, action: #selector(getPokemon(button:)), for: .touchUpInside)
        pokemonButton.addTarget(self, action: #selector(specialCharacterUnTapped(button:)), for: .touchDown)
    }
    
    // MARK: - Views
    let pokemonImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.backgroundColor = .black
        return image
    }()
    
    let inputDisplayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.backgroundColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 80)
        label.text = "0"
        return label
    }()
    
    var topButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    let clearButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "Clear", cornerRadius: 40, backgroundColor: .lightGray, textColor: .black, fontSize: 30)
        return button
    }()
    
    let pokemonButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "Pokemon", cornerRadius: 40, backgroundColor: .lightGray, textColor: .black, fontSize: 20)
        return button
    }()
    
    let digimonButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "Digimon", cornerRadius: 40, backgroundColor: .lightGray, textColor: .black, fontSize: 20)
        return button
    }()
    
    let divisionButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "÷", cornerRadius: 40, backgroundColor: .orange, textColor: .white, fontSize: 40)
        return button
    }()
    
    var topMiddleButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    let sevenButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "7", cornerRadius: 40, backgroundColor: .darkGray, textColor: .white, fontSize: 30)
        return button
    }()
    
    let eightButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "8", cornerRadius: 40, backgroundColor: .darkGray, textColor: .white, fontSize: 30)
        return button
    }()
    
    let nineButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "9", cornerRadius: 40, backgroundColor: .darkGray, textColor: .white, fontSize: 30)
        return button
    }()
    
    let timesButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "⨉", cornerRadius: 40, backgroundColor: .orange, textColor: .white, fontSize: 30)
        return button
    }()
    
    var middleButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    let fourButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "4", cornerRadius: 40, backgroundColor: .darkGray, textColor: .white, fontSize: 30)
        return button
    }()
    
    let fiveButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "5", cornerRadius: 40, backgroundColor: .darkGray, textColor: .white, fontSize: 30)
        return button
    }()
    
    let sixButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "6", cornerRadius: 40, backgroundColor: .darkGray, textColor: .white, fontSize: 30)
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "-", cornerRadius: 40, backgroundColor: .orange, textColor: .white, fontSize: 40)
        return button
    }()
    
    var bottomMiddleButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    let oneButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "1", cornerRadius: 40, backgroundColor: .darkGray, textColor: .white, fontSize: 30)
        return button
    }()
    
    let twoButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "2", cornerRadius: 40, backgroundColor: .darkGray, textColor: .white, fontSize: 30)
        return button
    }()
    
    let threeButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "3", cornerRadius: 40, backgroundColor: .darkGray, textColor: .white, fontSize: 30)
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "+", cornerRadius: 40, backgroundColor: .orange, textColor: .white, fontSize: 40)
        return button
    }()
    
    var bottomButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    let zeroButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "0", cornerRadius: 20, backgroundColor: .darkGray, textColor: .white, fontSize: 30)
        return button
    }()
    
    let decimalButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: ".", cornerRadius: 40, backgroundColor: .darkGray, textColor: .white, fontSize: 40)
        return button
    }()
    
    let equalButton: UIButton = {
        let button = UIButton()
        button.setupButtons(title: "=", cornerRadius: 40, backgroundColor: .orange, textColor: .white, fontSize: 40)
        return button
    }()
    
    // MARK: - setup
    func addAllSubViews(){
        view.addSubview(pokemonImageView)
        view.addSubview(inputDisplayLabel)
        view.addSubview(topButtonStackView)
        topButtonStackView.addArrangedSubview(clearButton)
        topButtonStackView.addArrangedSubview(pokemonButton)
        topButtonStackView.addArrangedSubview(digimonButton)
        topButtonStackView.addArrangedSubview(divisionButton)
        view.addSubview(topMiddleButtonStackView)
        topMiddleButtonStackView.addArrangedSubview(sevenButton)
        topMiddleButtonStackView.addArrangedSubview(eightButton)
        topMiddleButtonStackView.addArrangedSubview(nineButton)
        topMiddleButtonStackView.addArrangedSubview(timesButton)
        view.addSubview(middleButtonStackView)
        middleButtonStackView.addArrangedSubview(fourButton)
        middleButtonStackView.addArrangedSubview(fiveButton)
        middleButtonStackView.addArrangedSubview(sixButton)
        middleButtonStackView.addArrangedSubview(minusButton)
        view.addSubview(bottomMiddleButtonStackView)
        bottomMiddleButtonStackView.addArrangedSubview(oneButton)
        bottomMiddleButtonStackView.addArrangedSubview(twoButton)
        bottomMiddleButtonStackView.addArrangedSubview(threeButton)
        bottomMiddleButtonStackView.addArrangedSubview(plusButton)
        view.addSubview(zeroButton)
        view.addSubview(bottomButtonStackView)
        bottomButtonStackView.addArrangedSubview(decimalButton)
        bottomButtonStackView.addArrangedSubview(equalButton)
    }
    
    // MARK: - Constraints
    func constrainPokemonImageView() {
        pokemonImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: view.leftAnchor, right: nil, paddingTop: 10, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: view.frame.width
            , height: 110)
    }
    
    func constrainCalculatorTextField() {
        inputDisplayLabel.anchor(top: pokemonImageView.bottomAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: view.frame.width, height: 100)
    }
    
    func constrainTopButtonStackView() {
        topButtonStackView.anchor(top: inputDisplayLabel.bottomAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingBottom: 0, paddingLeft: 8, paddingRight: -8, width: view.frame.width, height: 80)
    }
    
    func constrainTopMiddleButtonStackView() {
        topMiddleButtonStackView.anchor(top: topButtonStackView.bottomAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingBottom: 0, paddingLeft: 8, paddingRight: -8, width: view.frame.width, height: 80)
    }
    
    func constrainMiddleButtonStackView() {
        middleButtonStackView.anchor(top: topMiddleButtonStackView.bottomAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingBottom: 0, paddingLeft: 8, paddingRight: -8, width: view.frame.width, height: 80)
    }
    
    func constrainBottomMiddleButtonStackView() {
        bottomMiddleButtonStackView.anchor(top: middleButtonStackView.bottomAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingBottom: 0, paddingLeft: 8, paddingRight: -8, width: view.frame.width, height: 80)
    }
    
    func constrainZeroButton() {
        zeroButton.anchor(top: bottomMiddleButtonStackView.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leftAnchor, right: nil, paddingTop: 8, paddingBottom: -16, paddingLeft: 8, paddingRight: 0, width: (view.frame.width / 2) - 20, height: 80)
    }
    
    func constrainBottomButtonStackView() {
        bottomButtonStackView.anchor(top: bottomMiddleButtonStackView.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: zeroButton.rightAnchor, right: view.rightAnchor, paddingTop: 8, paddingBottom: -16, paddingLeft: 20, paddingRight: -8, width: view.frame.width / 2, height: 80)
    }
    
    // MARK: - Math Functions
    @objc func digits(button: UIButton) {
        guard let digit = button.currentTitle else { return }
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        if isTypingANumber {
            let number = inputDisplayLabel.text ?? ""
            inputDisplayLabel.text = number + digit
        } else {
            inputDisplayLabel.text = digit
            isTypingANumber = true
        }
    }
    
    @objc func digitsUnTapped(button: UIButton){
        button.backgroundColor = .white
        button.setTitleColor(.darkGray, for: .normal)
    }
    
    @objc func clearButtonTapped(button: UIButton) {
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        inputDisplayLabel.text = "0"
        isTypingANumber = false
        inputDisplayLabel.textColor = .white
        firstNumber = 0.0
        currentNumber = 0.0
        mathOperation = ""
        pokemonImageView.image = UIImage(named: "default")
    }
    
    @objc func digimonButtonTapped(button: UIButton) {
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        inputDisplayLabel.text = "Digimon, Really just use the Pokemon Button!"
        isTypingANumber = false
    }
    
    @objc func specialCharacterUnTapped(button: UIButton){
        button.backgroundColor = .black
        button.setTitleColor(.lightGray, for: .normal)
    }
    
    @objc func operation(button: UIButton) {
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        if let mathSign = button.currentTitle{
            switch mathSign {
            case "+":
                firstNumber = Double(inputDisplayLabel.text!)!
                mathOperation = "+"
                isTypingANumber = false
            case "-":
                firstNumber = Double(inputDisplayLabel.text!)!
                mathOperation = "-"
                isTypingANumber = false
            case "⨉":
                firstNumber = Double(inputDisplayLabel.text!)!
                mathOperation = "⨉"
                isTypingANumber = false
            case "÷":
                firstNumber = Double(inputDisplayLabel.text!)!
                mathOperation = "÷"
                isTypingANumber = false
            default:
                isTypingANumber = false
            }
        }
    }
    
    @objc func equalButtonPressed(button: UIButton) {
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        currentNumber = Double(inputDisplayLabel.text!)!
        if mathOperation == "+"{
            let result = firstNumber + currentNumber
            inputDisplayLabel.text = String(result)
        }
        else if mathOperation == "-"{
            let result = firstNumber - currentNumber
            inputDisplayLabel.text = String(result)
        }
        else if mathOperation == "⨉"{
            let result = firstNumber * currentNumber
            inputDisplayLabel.text = String(result)
        }
        else if mathOperation == "÷"{
            if currentNumber == 0 {
                inputDisplayLabel.text = "ERROR, Cannot divide by 0"
                inputDisplayLabel.textColor = .red
            } else {
                let result = firstNumber / currentNumber
                inputDisplayLabel.text = String(result)
            }
        }
        isTypingANumber = false
    }
    
    @objc func orangeButtonUnTapped(button: UIButton){
        button.backgroundColor = .white
        button.setTitleColor(.orange, for: .normal)
    }
    
     @objc func getPokemon(button: UIButton){
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        if inputDisplayLabel.text == "Digimon, Really just use the Pokemon Button!"{
            pokemonImageView.image = UIImage(named: "pokemonLogo")
        } else {
            let numberAsDouble: Double = Double(inputDisplayLabel.text!)!
            let number: Int = Int(numberAsDouble)
            let pokemonNumber = String(PokemonController.shared.getPokemonActualNumber(number: number))
            PokemonController.shared.fetchPokemonWith(nameOrId: pokemonNumber) { (pokemon) in
                guard let pokemon = pokemon else { return }
                PokemonController.shared.fetchImage(for: pokemon, completion: { (image) in
                    guard let image = image else { return }
                    DispatchQueue.main.async {
                        self.pokemonImageView.image = image
                        
                    }
                })
            }
            let originalPosition = pokemonImageView.frame
            pokemonImageView.center.x -= view.bounds.width
            UIView.animate(withDuration: 2.0, delay: 0.0, options: [], animations: {
                self.pokemonImageView.center = CGPoint(x: (0.7 * self.view.frame.width), y: 0)
            }) { (_) in
                self.pokemonImageView.frame = originalPosition
            }
            isTypingANumber = false
        }
    }
}
