//
//  SynthesisView.swift
//  gradientTest
//
//  Created by Медеу Пазылов on 13.08.2023.
//

import UIKit

class SynthesisView: UIView {

    var audioSamples: [Float] = [] // Provide audio samples here

    override func draw(_ rect: CGRect) {
            super.draw(rect)
            
            guard let context = UIGraphicsGetCurrentContext() else {
                return
            }
            
            context.clear(rect)
            
            let sampleCount = audioSamples.count
            if sampleCount > 0 {
                let scaleX = bounds.width / CGFloat(sampleCount)
                let scaleY = bounds.height / 2.0
                
                for (index, sample) in audioSamples.enumerated() {
                    let x = CGFloat(index) * scaleX
                    let y = bounds.midY - CGFloat(sample) * scaleY
                    
                    let startPoint = CGPoint(x: x, y: bounds.midY)
                    let endPoint = CGPoint(x: x, y: y)
                    
                    context.move(to: startPoint)
                    context.addLine(to: endPoint)
                    
                    context.setStrokeColor(UIColor.blue.cgColor)
                    context.setLineWidth(1.0)
                    context.strokePath()
                }
            }
        }
}

