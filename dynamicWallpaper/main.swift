//
//  main.swift
//  dynamicWallpaper
//
//  Created by Эльдар Дамиров on 03.09.2018.
//  Copyright © 2018 Эльдар Дамиров. All rights reserved.
//



import AppKit




let wallpaperExtension = ".jpeg";
let lk = LightKit();
var lightSensorsReadings = lk?.lightSensors;

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
    
func determineIndex() -> String
    {
    let time = NSDate();
    var index: Int!;
    
    switch time.currentHour()
        {
        case 5...6:
            index = 1;
        case 7:
            index = 2;
        case 8:
            index = 3;
        case 9...10:
            index = 4;
        case 11:
            index = 5;
        case 12...13:
            index = 6;
        case 14:
            index = 7;
        case 15...16:
            index = 8;
        case 17:
            index = 9;
        case 18:
            index = 10;
        case 19:
            index = 11;
        case 20:
            index = 12;
        case 21...22:
            index = 13;
        case 0...1, 23:
            index = 14;
        case 2:
            index = 15;
        case 3...4:
            index = 16;
        
        default:
            index = 16;
        }
        
    return String ( String ( index ) + wallpaperExtension );
    }







while ( true )
    {
    Thread.sleep ( until: Date ( timeIntervalSinceNow: 1 ) );
//    lightSensorsReadings = lk?.lightSensors;
    setWallpaper ( wallpaperPath: determineIndex() );
    }




//for index in 1...16
//    {
//    Thread.sleep ( until: Date ( timeIntervalSinceNow: 0.5 ) )
//    setWallpaper ( wallpaperPath: String ( String ( index ) + wallpaperExtension ) );
//    }




