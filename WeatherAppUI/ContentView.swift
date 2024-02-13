//
//  ContentView.swift
//  WeatherAppUI
//
//  Created by Neel Pandya on 11/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack{
                cityNameView(cityName: "Hyderabad, Telangana")
                heroSection(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill",
                            temp: 30)
                
                //.padding(.bottom, 60)
                Spacer()
                HStack(spacing: 20){
                    ParticularDay(dayOfWeek: "MON", 
                                  weatherImage: "cloud.sun.fill",
                                  temp: 24)
                    ParticularDay(dayOfWeek: "TUE",
                                  weatherImage: "cloud.sun.bolt.fill",
                                  temp: 18)
                    ParticularDay(dayOfWeek: "WED",
                                  weatherImage: "wind",
                                  temp: 14)
                    ParticularDay(dayOfWeek: "THU",
                                  weatherImage: "snowflake",
                                  temp: 6)
                    ParticularDay(dayOfWeek: "FRI",
                                  weatherImage: "tornado",
                                  temp: 1)
                    
                }
                
                Spacer()
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonText: "Change Day Time", backgroundColor: .white, textColor: .blue)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ParticularDay : View {
    
    var dayOfWeek    : String
    var weatherImage : String
    var temp         : Int
    
    var body: some View {
        VStack(spacing: 0) {
            Text(dayOfWeek)
                .font(.system(size: 20))
                .foregroundColor(.white)
            Image(systemName: weatherImage)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temp)°")
                .font(.system(size: 30))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    
    var isNight : Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue, isNight ? .gray: Color("LightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//                    .ignoresSafeArea(.all)
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct cityNameView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct heroSection: View {
    
    var imageName: String
    var temp     : Int
    
    var body: some View {
        Image(systemName: imageName)
            .symbolRenderingMode(.multicolor)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 160, height: 160)
        
            .padding(-10)
        
        Text("\(temp)°")
            .font(.system(size: 80, weight: .semibold))
            .foregroundColor(.white)
    }
}



