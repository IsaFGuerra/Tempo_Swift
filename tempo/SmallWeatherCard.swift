//
//  SmallWeatherCard.swift
//  tempo
//
//  Created by Foundation09 on 31/10/23.
//

import SwiftUI

//Estrutura Scrollview tempo hoje

struct SmallWeatherCard: View{
    
    let currentWeather: CurrentWeather
    
    var body: some View {
        EmptyView()
        VStack{
            Text("\(currentWeather.hour)")
                .padding(1)
                .foregroundColor(.white)
            Image(systemName: currentWeather.weatherCondition.systemName)
                .padding(1)
                .foregroundColor(.white)
            Text("\(currentWeather.temperature)")
                .foregroundStyle(.white
                )
        }.padding(.leading)
    }
}


#Preview {
    SmallWeatherCard(currentWeather: CurrentWeather(hour: 10, temperature: 20, weatherCondition: .sunny))
}

