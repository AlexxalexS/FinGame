//
//  DividerView.swift
//  FinGame
//
//  Created by Alexey on 09.10.2021.
//

import SwiftUI

struct DividerView: View {

    var body: some View {
        Rectangle()
            .frame(maxHeight: 1)
            .padding(.horizontal, 24)
    }

}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}
