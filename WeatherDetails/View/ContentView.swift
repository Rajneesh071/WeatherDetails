//
//  ContentView.swift
//  WeatherDetails
//
//  Created by Rajneesh on 07/02/21.
//  Copyright © 2021 BRRV. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherModel: WeatherDetailViewModel = WeatherDetailViewModel()
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                VStack {
                    Text("Weather Details")
                        .font(.largeTitle)                        
                    Text(self.weatherModel.time)
                }.padding(50)
                VStack {
                    Text(self.weatherModel.currentCity)
                }
                Divider().background(Color.gray)
                HStack {
                    Text("Temperature => ")
                    Text(self.weatherModel.temperature)
                }.padding()
                HStack {
                    Text("Wind Speed => ")
                    Text(self.weatherModel.windSpeed)
                }.padding()
                Spacer()
            }
            .onAppear {
                self.weatherModel.fetchWeatherDetails()
            }
        }.colorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
