//
//  ViewController.swift
//  App_primer_parcial_gp
//
//  Created by Alumno on 06/09/22.
//  Copyright © 2022 ULSA. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Declaraciom reproductor
    var reproductor : AVAudioPlayer?
    var reproductor_cancion : AVAudioPlayer?
    @IBOutlet weak var lblElementoActivo: UILabel!
    
    @IBOutlet weak var imgShip: UIImageView!
    @IBOutlet weak var imgOutpost: UIImageView!
    @IBOutlet weak var imgStation: UIImageView!
    @IBOutlet weak var imgShipB: UIImageView!
    
    var secuenciaShip : [UIImage] = []
    var secuenciaShipB : [UIImage] = []
    var secuenciaOutpost : [UIImage] = []
    var secuenciaStation : [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, mode: AVAudioSessionModeDefault)
            try AVAudioSession.sharedInstance().setActive(true)
            let url = Bundle.main.url(forResource: "song", withExtension: "mp3")
            reproductor_cancion = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductor_cancion?.play()
        } catch let error{
            print(error.localizedDescription)
        }
        for i in 1...5{
            let imagen = UIImage(named: "Nave\(i)")
            secuenciaShip.append(imagen!)
        }
        imgShip.animationImages = secuenciaShip
        imgShip.animationDuration = 1.0
        imgShip.startAnimating()
        
        for i in 1...5{
            let imagen = UIImage(named: "outpost\(i)")
            secuenciaOutpost.append(imagen!)
        }
        imgOutpost.animationImages = secuenciaOutpost
        imgOutpost.animationDuration = 1.0
        imgOutpost.startAnimating()
        
        for i in 1...7{
            let imagen = UIImage(named: "Station\(i)")
            secuenciaStation.append(imagen!)
        }
        imgStation.animationImages = secuenciaStation
        imgStation.animationDuration = 1.0
        imgStation.startAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doTapShip(_ sender: Any) {
        lblElementoActivo.text = "Ship"
        do{
            //let url = Bundle.main.url(forResource: "ship", withExtension: "mp3")
            let url2 = Bundle.main.url(forResource: "ship_v", withExtension: "mp3")
            reproductor = try AVAudioPlayer(contentsOf: url2!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductor?.play()
            //reproductor = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
            //reproductor?.play()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    @IBAction func doTapOutpost(_ sender: Any) {
        lblElementoActivo.text = "Outpost"
        do{
            let url = Bundle.main.url(forResource: "Outpost", withExtension: "mp3")
            let url2 = Bundle.main.url(forResource: "outpost_v", withExtension: "mp3")
            reproductor = try AVAudioPlayer(contentsOf: url2!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductor?.play()
            reproductor = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductor?.play()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    @IBAction func doTapStation(_ sender: Any) {
        lblElementoActivo.text = "Station"
        do{
            let url = Bundle.main.url(forResource: "Station_gun", withExtension: "mp3")
            let url2 = Bundle.main.url(forResource: "station_v", withExtension: "mp3")
            reproductor = try AVAudioPlayer(contentsOf: url2!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductor?.play()
            reproductor = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductor?.play()

        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    
}

