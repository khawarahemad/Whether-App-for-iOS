//
//  ContentView.swift
//  swift UI weather
//
//  Created by Khawar Ahemad Khan on 06/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var IsNight = false
    
    var body: some View {
        ZStack {
            ColorGredient(TopColor: IsNight ? .black : .blue,
                          BottomColor: IsNight ? .white :  Color("LightBlue"))
            VStack{
                CityandDay(City: "kerang", Day:"mon")
                VStack{
                    MainWether(Wetherimage: IsNight ? "cloud.moon.fill" : "cloud.sun.fill", Tempreture: IsNight ? 34 : 40)
                    
                }
                .padding(40)
                HStack(spacing: 15) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName:IsNight ? "cloud.moon.rain.fill" : "cloud.sun.rain.fill",
                                   temperature: 37)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "cloud.bolt.fill",
                                   temperature: 34)
                    WeatherDayView(dayOfWeek: "THR",
                                   imageName: IsNight ? "cloud.moon.bolt.fill":"cloud.sun.bolt.fill",
                                   temperature: 29)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "smoke.fill",
                                   temperature: 20)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.snow.fill",
                                   temperature: -10)
                    WeatherDayView(dayOfWeek: "SUN",
                                   imageName: "cloud.sleet.fill",
                                   temperature: -15)
                    
                }
                Spacer()
                
                Button {
                    IsNight .toggle()
                } label: {
                    WeatherButton(Title: IsNight ? String("Change Day Time"): String("Change Night Time"), TextColor: .white, Textbackgroung: .blue)
                
                }
                Spacer()
                
            }
        }
    }
}

#Preview {
    ContentView()
}
struct WeatherDayView: View {
    
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
//                .foregroundColor(.pink)
//                .foregroundStyle(.pink, .orange, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
struct ColorGredient: View {
    var TopColor: Color
    var BottomColor: Color
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [TopColor,BottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing )
            .edgesIgnoringSafeArea(.all)
    }
    

}

struct CityandDay: View {
    
    var City: String
    var Day: String
    
    var body: some View {
        Text(City)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        Text(Day)
            .font(.system(size: 25, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}

struct MainWether: View {
    
    var Wetherimage: String
    var Tempreture: Int
    
    var body: some View {
        Image(systemName: Wetherimage )
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 180 ,height: 180)
        Text("\(Tempreture)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
            .padding(-10)

    }
}

