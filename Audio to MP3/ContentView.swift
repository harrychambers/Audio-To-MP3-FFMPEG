//
//  ContentView.swift
//  Audio to MP3
//
//  Created by Harry Chambers on 24/01/2024.
//

import SwiftUI
import UniformTypeIdentifiers
import AVFoundation
import Foundation


struct ContentView: View {
    @State private var selectedFiles: [URL] = []
    @State private var outputDirectory: URL?
    @State private var fileCount: Int = 0
    @State private var conversionProgress: Double = 0.0
    @State private var conversionComplete: Bool = false
    @State private var showProgressBar: Bool = false

    var body: some View {
        VStack {
            Spacer();
            Text("Audio to MP3")
                .font(.title)
                .padding()

            HStack {
                Button("Input") {
                    selectInputFiles()
                }
                .padding()

                Button("Output") {
                    selectOutputDir()
                }
                .padding()
            }
            
            Text("Selected Files: " + String(fileCount))
                .font(.title2)
                .padding()

            Button("Convert") {
                showProgressBar = true
                convertSelected()
            }
            .padding()
            
            ProgressView(value: conversionProgress)
                .padding()
                .opacity(showProgressBar ? 1.0 : 0.0)
            
            //success message
            if conversionComplete {
                Text("Conversion Successful!")
                    .padding()
            }

            Spacer()
        }
        .padding()
    }
    
    //get input
    func selectInputFiles() {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = true
        openPanel.canChooseDirectories = true
        
        openPanel.allowedContentTypes = [UTType.audio]

        openPanel.begin { response in
            if response == .OK {
                selectedFiles = openPanel.urls
                fileCount = selectedFiles.count
                    
                print("Selected Files: \(selectedFiles)")
            }
        }
    }
    
    //set output
    func selectOutputDir() {
        let openPanel = NSOpenPanel()
        openPanel.canChooseFiles = false
        openPanel.canChooseDirectories = true
        openPanel.allowsMultipleSelection = false
        
        openPanel.begin { response in
            if response == .OK {
                if let directoryURL = openPanel.url {
                    outputDirectory = directoryURL
                    
                    print("Selected Output Directory: \(directoryURL.path)")
                }
            }
        }
    }
    
    //loop
    func convertSelected() {
        conversionProgress = 0.0
        conversionComplete = false
        
        for (index, fileURL) in selectedFiles.enumerated() {
            
            // Set outDir
            if let outDir = outputDirectory?.path {
                
                // If it is already an mp3, do nothing
                if fileURL.pathExtension == "mp3" {
                    // Copy and paste
                    let fileManager = FileManager.default
                    do {
                        let newFilePath = URL(fileURLWithPath: outDir).appendingPathComponent(fileURL.lastPathComponent)
                        try fileManager.copyItem(at: fileURL, to: newFilePath)
                    } catch {
                        print("Error copying file: \(error)")
                    }
                } else {
                    // Not mp3
                    let newFileName = fileURL.deletingPathExtension().lastPathComponent + ".mp3"
                      
                    let ffmpegArguments = ["-i", fileURL.path, "-codec:a", "libmp3lame", "-b:a", "320k", "\(outDir)/\(newFileName)"]
                    
                    convertFFMPEG(arguments: ffmpegArguments)
                    
                    print("Converted File Name: \(newFileName)")
                }
            } else {
                print("Output Directory is not set.")
            }
            
            conversionProgress = Double(index + 1) / Double(selectedFiles.count)
        }
        
        conversionComplete = true
    }

    // ffmpeg
    func convertFFMPEG(arguments: [String]) {
        
        let task = Process()
        
        // Set the environment path to include the location of the ffmpeg executable
        task.environment = ["PATH": Bundle.main.bundlePath]
        task.launchPath = Bundle.main.path(forResource: "ffmpeg", ofType: nil)
            task.arguments = arguments

        let pipe = Pipe()
        task.standardOutput = pipe
        task.standardError = pipe

        // Print the command that will be executed
        let argumentsString = (task.arguments ?? []).joined(separator: " ")
        print("Executing command: \(task.launchPath) \(argumentsString)")

        task.launch()
        task.waitUntilExit()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            print("Command output:\n\(output)")
        }
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
