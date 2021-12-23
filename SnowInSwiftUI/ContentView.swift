//
//  ContentView.swift
//  SnowInSwiftUI
//
//  Created by ramil on 23.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SnowView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SnowView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let screenSize = UIScreen.main.bounds
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        view.layer.masksToBounds = true
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        emitterLayer.emitterShape = .circle
        emitterLayer.emitterPosition = CGPoint(x: screenSize.width / 2, y: -100)
        
        emitterLayer.emitterMode = .surface
        emitterLayer.renderMode = .oldestLast
        
        let cell = CAEmitterCell()
        cell.birthRate = 100
        cell.lifetime = 10
        cell.velocity = 100
        cell.scale = 0.03
        cell.emissionRange = CGFloat.pi
        
        cell.contents = UIImage(named: "snowflake")?.cgImage
        
        emitterLayer.emitterCells = [cell]
        view.layer.addSublayer(emitterLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
