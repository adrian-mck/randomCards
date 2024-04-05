//
//  CardSelectionVC.swift
//  RandomCards - Programmatic
//
//  Created by Adrian Mück on 25.01.24.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView   = UIImageView()
    let stopButton      = RCButton(color: .systemRed, title: "Stop!", systemImageName: "stop.circle")
    let resetButton     = RCButton(color: .systemGreen, title: "Reset", systemImageName: "arrow.clockwise.circle")
    let rulesButton     = RCButton(color: .systemBlue, title: "Rules", systemImageName: "list.bullet")
    
    var cards: [UIImage] = Card.allValues
    var timer: Timer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @objc func stopTimer(){
        timer.invalidate()
    }
    
    @objc func resetTimer(){
        stopTimer()
        startTimer()
    }
    
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    func configureCardImageView(){
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
  
    
    func configureStopButton(){
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureResetButton(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func presentRulesVC(){
        present(RulesVC(), animated: true)
        
    }
}
