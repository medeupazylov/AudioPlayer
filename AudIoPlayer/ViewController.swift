//
//  ViewController.swift
//  gradientTest
//
//  Created by Медеу Пазылов on 13.08.2023.
//

import UIKit
import AVFoundation
import PhotosUI


enum AudioPlayerState {
    case empty
    case loading
    case loaded
}

extension ViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let audioURL = urls.first else { return }
            print("we found URL")
            playAudioFromURL(audioURL)
    }
}


class ViewController: UIViewController {
    
    var currentTime: TimeInterval = 0.0
    var duration: TimeInterval!
    var audioPlayer: AVAudioPlayer?
    var audioIsPlaying: Bool = false
    var timer: Timer?

    var poinerLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
//        setupAudioPlayer()
        setupViews()
        setupSynthesisView()
        setupLayout()
        setupGestures()
        
        editButton.addTarget(self, action: #selector(loadAudioFromDevice), for: .touchUpInside)
        
        loadedContainer.isHidden = true
    }
    
    func playAudioFromURL(_ url: URL) {
        do {
            setupAudioPlayer(url)
        } catch {
            print("Can not play audio")
            // Handle any errors that might occur while initializing AVAudioPlayer
        }
    }
    
    private func setupAudioPlayer(_ url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let duration = audioPlayer?.duration else {return}
            self.duration = duration
            timer?.invalidate()
            endTimeLabel.text = formatTimeInterval(duration)
        } catch {
            print("Error initializing AVAudioPlayer: \(error)")
        }
    }
    
    private func setupViews() {
        view.addSubview(stackContainer)
        stackContainer.addArrangedSubview(loadedContainer)
        loadedContainer.addSubview(synthesisView)
        loadedContainer.addSubview(playButton)
        loadedContainer.addSubview(deleteButton)
        loadedContainer.addSubview(editButton)
        loadedContainer.addSubview(currenTimeLabel)
        loadedContainer.addSubview(endTimeLabel)
    }
    
    private func setupSynthesisView() {
        for i in 0..<50 {
            let stick = UIView()
            stick.translatesAutoresizingMaskIntoConstraints = false
            stick.heightAnchor.constraint(equalToConstant: CGFloat.random(in: 5...44)).isActive = true
            stick.widthAnchor.constraint(equalToConstant: 2).isActive = true
            stick.layer.cornerRadius = 1.0
            stick.backgroundColor = Color.neutral72.color
            synthesisView.addArrangedSubview(stick)
        }
        synthesisView.addSubview(poinerView)
    }
    
    @objc func loadAudioFromDevice() {
        print("here")
        var documentPicker: UIDocumentPickerViewController
        if #available(iOS 14.0, *) {
            let supportedTypes: [UTType] = [UTType.audio]
            documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes)
        } else {
            documentPicker = UIDocumentPickerViewController(documentTypes: ["public.audio"], in: UIDocumentPickerMode.import)
        }
        documentPicker.delegate = self
        self.present(documentPicker, animated: true, completion: nil)
    }
    

    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            stackContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
//            stackContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            loadedContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loadedContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loadedContainer.heightAnchor.constraint(equalToConstant: 156),
            
            synthesisView.leadingAnchor.constraint(equalTo: loadedContainer.leadingAnchor, constant: 16.0),
            synthesisView.trailingAnchor.constraint(equalTo: loadedContainer.trailingAnchor, constant: -16.0),
            synthesisView.topAnchor.constraint(equalTo: loadedContainer.topAnchor, constant: 16.0),
            synthesisView.heightAnchor.constraint(equalToConstant: 48),
            
            currenTimeLabel.leadingAnchor.constraint(equalTo: loadedContainer.leadingAnchor, constant: 16.0),
            currenTimeLabel.topAnchor.constraint(equalTo: synthesisView.bottomAnchor, constant: 8.0),
            
            endTimeLabel.trailingAnchor.constraint(equalTo: loadedContainer.trailingAnchor, constant: -16.0),
            endTimeLabel.topAnchor.constraint(equalTo: synthesisView.bottomAnchor, constant: 8.0),
            
            playButton.heightAnchor.constraint(equalToConstant: 48),
            playButton.widthAnchor.constraint(equalToConstant: 48),
            playButton.centerXAnchor.constraint(equalTo: loadedContainer.centerXAnchor),
            playButton.bottomAnchor.constraint(equalTo: loadedContainer.bottomAnchor, constant: -16),
            
            deleteButton.heightAnchor.constraint(equalToConstant: 40),
            deleteButton.widthAnchor.constraint(equalToConstant: 40),
            deleteButton.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -40),
            deleteButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            
            editButton.heightAnchor.constraint(equalToConstant: 40),
            editButton.widthAnchor.constraint(equalToConstant: 40),
            editButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 40),
            editButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
        ])
        NSLayoutConstraint.activate([
            poinerView.heightAnchor.constraint(equalToConstant: 55),
            poinerView.centerYAnchor.constraint(equalTo: synthesisView.centerYAnchor),
            poinerView.widthAnchor.constraint(equalToConstant: 3),
        ])
        
        poinerLeadingConstraint = poinerView.leadingAnchor.constraint(equalTo: synthesisView.leadingAnchor)
        poinerLeadingConstraint?.isActive = true
    }
    
    private func setupGestures() {
        playButton.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        let intervalDragPanGesture = UIPanGestureRecognizer(target: self, action: #selector(intervalDragAction))
        synthesisView.addGestureRecognizer(intervalDragPanGesture)
        let currentTimeDragPanGesture = UIPanGestureRecognizer(target: self, action: #selector(currentTimeDragAction))
        poinerView.addGestureRecognizer(currentTimeDragPanGesture)
    }
    
    @objc func playButtonAction() {
        guard let audioPlayer = audioPlayer else {return}
        print("playButtonAction")
        timer?.invalidate()
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            audioIsPlaying = false
        } else {
            audioPlayer.play()
            audioIsPlaying = true
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func currentTimeDragAction(_ sender: UIPanGestureRecognizer) {
        audioPlayer?.pause()
        timer?.invalidate()
        var translation = sender.location(in: synthesisView)
        if Double(translation.x) < 0 {
            translation.x = 1
        }
        if Double(translation.x) > Double(synthesisView.frame.width) {
            translation.x = synthesisView.frame.width-1
        }
    
        guard let audioPlayer = audioPlayer else {return}
        audioPlayer.currentTime = audioPlayer.duration * Double(translation.x/synthesisView.frame.width)
        
        poinerLeadingConstraint.isActive = false
        poinerLeadingConstraint = poinerView.leadingAnchor.constraint(equalTo: synthesisView.leadingAnchor,constant: translation.x)
        poinerLeadingConstraint.isActive = true
        if sender.state == .ended && audioIsPlaying {
            audioPlayer.play()
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
    }
    
    @objc private func intervalDragAction(_ sender: UIPanGestureRecognizer) {
        let translation = sender.location(in: synthesisView)
        var stickNumber = Int(50 * translation.x/synthesisView.frame.width)
        if stickNumber<0 {
            stickNumber = 0
        }
        if stickNumber>49 {
            stickNumber = 49
        }
        synthesisView.arrangedSubviews.forEach({ view in
            view.backgroundColor = Color.neutral72.color
        })
        for i in getRange(index: stickNumber) {
            synthesisView.subviews[i].backgroundColor = Color.primaryMain.color
        }
        print(stickNumber)
    }
    
    @objc private func timerAction() {
        if let currentTime = audioPlayer?.currentTime {
            currenTimeLabel.text = "\(formatTimeInterval(currentTime))"
            print(currentTime)
            poinerLeadingConstraint.isActive = false
            poinerLeadingConstraint = poinerView.leadingAnchor.constraint(equalTo: synthesisView.leadingAnchor,constant: getConstraintConstant(currentTime: currentTime))
            poinerLeadingConstraint.isActive = true
        } else {
            print("Невозможно получить текущее время воспроизведения")
        }
    }
    
    private func getConstraintConstant(currentTime: TimeInterval) -> CGFloat {
        return CGFloat(synthesisView.frame.width * (currentTime/duration))
    }
    
    private let poinerView: UIView = {
        let line = UIView()
        line.backgroundColor = Color.accentMain.color
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    } ()
    
    private func formatTimeInterval(_ timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%01d:%02d", minutes, seconds)
    }

    private func getRange(index: Int) -> Range<Int> {
        if(index < 8) {
            return (0..<15)
        } else if (index > 43) {
            return (36..<50)
        } else {
            return ((index-7)..<(index+7))
        }
    }
    
    private let synthesisView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    } ()
    
    private let stackContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    } ()

    private let loadedContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.elevatedBgColor.color
        view.layer.cornerRadius = 12.0
        return view
    } ()
    
    private let currenTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color.neutral72.color
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0:00"
        return label
    } ()
    
    private let endTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = Color.neutral72.color
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4:19"
        return label
    } ()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.trash.image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Color.neutral16.color
        button.layer.cornerRadius = 20.0
        button.tintColor = Color.neutral100.color
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "play_button"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let editButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.pencil.image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Color.neutral16.color
        button.layer.cornerRadius = 20.0
        button.tintColor = Color.neutral100.color
        return button
    }()
    

    private func playInterval(startSeconds: TimeInterval, endSeconds: TimeInterval) {
            guard let audioPlayer = audioPlayer else { return }
            if startSeconds >= 0 && startSeconds < audioPlayer.duration
                && endSeconds > startSeconds && endSeconds <= audioPlayer.duration {
                audioPlayer.currentTime = startSeconds
                audioPlayer.play()
                
                let intervalDuration = endSeconds - startSeconds
                DispatchQueue.main.asyncAfter(deadline: .now() + intervalDuration) {
                    audioPlayer.stop()
                }
            } else {
                print("Invalid interval range.")
            }
    }

}


