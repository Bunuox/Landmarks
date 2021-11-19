//
//  LandmarkDetail.swift
//  IntroToSwiftUI
//
//  Created by Bünyamin Kılıçer on 19.11.2021.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex : Int {
        modelData.landmarks.firstIndex(where: {
            //$0 is current list element.
            $0.id == landmark.id
        })!
    }
    
    var body: some View {
        
        ScrollView{
            MapView(coordinate: landmark.locationCoordinate).frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            CircleImage(image: landmark.image).offset(y: -110)
                .padding(.bottom,-110)
            
        VStack (alignment: .leading){
            HStack{
                Text(landmark.name).font(.title)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                
                FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
            }
                
            HStack {
                Text(landmark.park).font(.system(size: 14, weight: .medium, design: .default))
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text(landmark.state).font(.system(size: 14, weight: .medium, design: .default))
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            
            Divider()
            
            Text(landmark.description).font(.subheadline)
        }
        .padding()
    }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(ModelData())
    }
}
