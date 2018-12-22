//
//  main.swift
//  dynamicWallpaper
//
//  Created by Эльдар Дамиров on 03.09.2018.
//  Copyright © 2018 Эльдар Дамиров. All rights reserved.
//

import AppKit



func setWallpaper(wallpaperPath: String)
    {
    var error : NSError?;
    let sharedWorkspace = NSWorkspace.shared;
    let screens = NSScreen.screens;
    let wallpaperUrl : NSURL = NSURL.fileURL(withPath: wallpaperPath) as NSURL;

    
    guard var options = sharedWorkspace.desktopImageOptions(for: screens [ 0 ] ) else 
        {
        return;
        }

        options [ NSWorkspace.DesktopImageOptionKey.imageScaling ] = 1;
        options [ NSWorkspace.DesktopImageOptionKey.allowClipping ] = true;


    for screen in screens
        {
        do 
            {
            try sharedWorkspace.setDesktopImageURL ( wallpaperUrl as URL, for: screen, options: options );
            }
        catch 
            {
            print ( error.localizedDescription );
            }
        }
    }

let lk = LightKit();

let lightSensorsReadings = lk?.lightSensors;
print("Left sensor: \(lightSensorsReadings?.left).")
print("Right sensor: \(lightSensorsReadings?.right).")


//var wallpaperExtension = ".jpeg";

//for index in 1...16
//    {
//    Thread.sleep ( until: Date ( timeIntervalSinceNow: 0.5 ) )
//    setWallpaper ( wallpaperPath: String ( String ( index ) + wallpaperExtension ) );
//    }




