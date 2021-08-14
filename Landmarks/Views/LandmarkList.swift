//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Alex Lin on 2021/8/12.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        //只有包裹在了NavigationView才可以有navigationTitle
        NavigationView {
            //因为在Landmark.swift中说明了Identifiable
            //所以删除括号中的id: \.id
            List (landmarks){ landmark in
                
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
            
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 12 Pro Max","iPad Pro (12.9-inch) (5th generation)"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
