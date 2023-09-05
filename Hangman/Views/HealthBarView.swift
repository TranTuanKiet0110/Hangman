/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Tran Tuan Kiet
  ID: 3879300
  Created  date: 12/08/2023
  Last modified: 05/09/2023
  Acknowledgement: 
*/

import SwiftUI

struct HealthBarView: View {
    
    @Binding var currentHealth: Int
    
    var maximumHealth = 5
    var offImage: Image?
    var onImage = Image(systemName: "heart.fill") //image for health bar
    var offColor = Color.gray
    var onColor = Color.red
    
    func image(for number: Int) -> Image {
        if number > currentHealth {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    var body: some View {
        ForEach(1..<maximumHealth + 1, id: \.self) {
            number in image(for: number).foregroundColor(number > currentHealth ? offColor : onColor)
        }
    }
}

struct HealthBarView_Previews: PreviewProvider {
    static var previews: some View {
        HealthBarView(currentHealth: .constant(5))
    }
}
