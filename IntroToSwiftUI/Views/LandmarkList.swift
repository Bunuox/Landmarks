//
//  LandmarkList.swift
//  IntroToSwiftUI
//
//  Created by Bünyamin Kılıçer on 18.11.2021.
//

import SwiftUI

struct LandmarkList: View {
    //The modelData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks : [Landmark] {
        modelData.landmarks.filter { landmark in
            if showFavoritesOnly{
                return landmark.isFavorite
            }else{
                return true
            }
        }
    }
    
    var body: some View {
        //if landmark would not have id, List(landmarks: landmark, id: \.id)
        NavigationView{
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
