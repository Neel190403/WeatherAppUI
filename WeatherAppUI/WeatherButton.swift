//
//  WeatherButton.swift
//  WeatherAppUI
//
//  Created by Neel Pandya on 11/02/24.
//

import SwiftUI

struct WeatherButton: View {
    
    var buttonText: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(buttonText)
            .background(backgroundColor)
            .frame(width: 280, height: 50)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
