/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Tran Tuan Kiet
  ID: 3879300
  Created  date: 27/08/2023
  Last modified: 05/09/2023
  Acknowledgement: 
*/

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String, numOfLoop: Int) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.numberOfLoops = numOfLoop
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}
