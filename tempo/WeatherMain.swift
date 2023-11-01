//
//  WeatherMain.swift
//  tempo
//
//  Created by Foundation09 on 31/10/23.
//

import SwiftUI

struct WeatherMain: View {
    
    let currentWeather: Weather = Weather(weekDay: .monday, month: .november, lowestTemperature: 18, highestTemperature: 24, weatherCondition: .cloudy)
    
    let weekWeatherForecast: [Weather] = [
        Weather(weekDay: .tuesday, month: .november, lowestTemperature: 12, highestTemperature: 22, weatherCondition: .sunny),
        Weather(weekDay: .wednesday, month: .november, lowestTemperature: 16, highestTemperature: 27, weatherCondition: .cloudy),
        Weather(weekDay: .thursday, month: .november, lowestTemperature: 14, highestTemperature: 20, weatherCondition: .rainy),
        Weather(weekDay: .friday, month: .november, lowestTemperature: 22, highestTemperature: 30, weatherCondition: .sunny),
        Weather(weekDay: .saturday, month: .november, lowestTemperature: 24, highestTemperature: 31, weatherCondition: .sunny),
        Weather(weekDay: .sunday, month: .november, lowestTemperature: 24, highestTemperature: 32, weatherCondition: .storm),
        Weather(weekDay: .monday, month: .november, lowestTemperature: 25, highestTemperature: 31, weatherCondition: .storm),
        Weather(weekDay: .tuesday, month: .november, lowestTemperature: 22, highestTemperature: 30, weatherCondition: .sunny),
        Weather(weekDay: .wednesday, month: .november, lowestTemperature: 22, highestTemperature: 30, weatherCondition: .cloudy)
        
        
    ]
    
    let currentWeatherForecast: [CurrentWeather] = [
        CurrentWeather(hour: 00, temperature: 27, weatherCondition: .moon),
        CurrentWeather(hour: 01, temperature: 26, weatherCondition: .moon),
        CurrentWeather(hour: 02, temperature: 26, weatherCondition: .moon),
        CurrentWeather(hour: 03, temperature: 26, weatherCondition: .moon),
        CurrentWeather(hour: 04, temperature: 25, weatherCondition: .cloudy),
        CurrentWeather(hour: 05, temperature: 25, weatherCondition: .cloudy),
        CurrentWeather(hour: 06, temperature: 25, weatherCondition: .sunrise),
        CurrentWeather(hour: 07, temperature: 27, weatherCondition: .sunny),
        CurrentWeather(hour: 08, temperature: 28, weatherCondition: .sunny),
        CurrentWeather(hour: 09, temperature: 30, weatherCondition: .sunny),
        CurrentWeather(hour: 10, temperature: 31, weatherCondition: .sunny),
        CurrentWeather(hour: 11, temperature: 32, weatherCondition: .sunny),
        CurrentWeather(hour: 12, temperature: 33, weatherCondition: .sunny),
        CurrentWeather(hour: 13, temperature: 34, weatherCondition: .sunny),
        CurrentWeather(hour: 14, temperature: 34, weatherCondition: .sunny),
    ]
    
    var body: some View {
        ZStack {
            
            Image("wallpaper2")
                .resizable()
                .ignoresSafeArea(edges: .all)
            
            ScrollView{
                Spacer()
                Text("Punta Cana")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size:30))
                    .padding(.top)
                Text("\(currentWeather.highestTemperature)º")
                    .foregroundColor(.white)
                    .font(.system(size:80))
                    .multilineTextAlignment(.center)
                Text("Mostly Sunny")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text("H:\(currentWeather.highestTemperature)º  L:\(currentWeather.lowestTemperature)º")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                
                Spacer()
                
                VStack{
                    Text("Sunny conditions will continue all day. Wind gusts are up to 38km/h.")
                        .padding(.horizontal)
                        .padding(.top)
                        .foregroundColor(.white)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(currentWeatherForecast.indices, id: \.self) { index in
                                let currentWeather = currentWeatherForecast[index]
                                SmallWeatherCard(currentWeather: currentWeather)
                            }
                        }
                    }
                }
                
                Spacer()
                
                Section {
                    VStack(alignment: .leading){
                        ForEach(weekWeatherForecast.indices, id: \.self) { index in
                            let currentWeekWeather = weekWeatherForecast[index]
                            WeatherRowCard(weather: currentWeekWeather)
                        }.padding(.horizontal)
                    }
                } header: {
                    HStack {
                        Text("10-DAY FORECAST")
                            .foregroundStyle(.white)
                            .padding(.leading)
                            .padding(.top)
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    WeatherMain()
}

