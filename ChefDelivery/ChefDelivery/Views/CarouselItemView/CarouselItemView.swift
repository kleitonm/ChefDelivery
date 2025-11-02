//
//  CarouselItemView.swift
//  ChefDelivery
//
//  Created by Kleiton Mendes on 26/08/25.
//

import SwiftUI

struct CarouselItemView: View {
    
    let order: OrderType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
    }
    
}

struct CarouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselItemView(
            order: OrderType(
                id: 1,
                name: "",
                image: "barbecue-banner"
            )
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
