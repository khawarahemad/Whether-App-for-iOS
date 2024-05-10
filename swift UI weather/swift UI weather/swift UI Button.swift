//
//  swift UI Button.swift
//  swift UI weather
//
//  Created by Khawar Ahemad Khan on 07/04/24.
//

import SwiftUI

struct WeatherButton: View {
    var Title: String
    var TextColor: Color
    var Textbackgroung: Color
    
    var body: some View {
        
        Text("Change Day time")
            .font(.system(size: 20, weight: .medium, design: .default))
            .frame(width: 280, height: 50 )
            .background(Textbackgroung)
            .foregroundColor(TextColor)
            .cornerRadius(10)
    }
}
