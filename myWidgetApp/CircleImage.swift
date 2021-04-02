//
//  CircleImage.swift
//  myWidgetApp
//
//  Created by mesutAygun on 1.04.2021.
//

import SwiftUI

struct CircleImage: View {
    var image : Image
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.green,lineWidth: 5))
            .shadow(radius: 30)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("ali"))
    }
}
