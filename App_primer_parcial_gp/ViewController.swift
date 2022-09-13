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
    @IBOutlet weak var imgHeader: UIImageView!
    
    var secuenciaShip : [UIImage] = []
    var secuenciaHeader : [UIImage] = []
    var secuenciaOutpost : [UIImage] = []
    var secuenciaStation : [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let imagen = UIImage(named: "imgGenerica")
        secuenciaHeader.append(imagen!)
        
        imgHeader.animationImages = secuenciaHeader
        imgHeader.animationDuration = 1.5
        imgHeader.startAnimating()
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
        
        for i in 1...5{
            let imagen = UIImage(named: "Station_simple\(i)")
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
            let url = Bundle.main.url(forResource: "ship", withExtension: "mp3")
            reproductor = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductor?.volume = 1
            reproductor?.play()
            secuenciaHeader = []
            for i in 1...15{
                let imagen = UIImage(named: "NaveB\(i)")
                secuenciaHeader.append(imagen!)
            }
            imgHeader.animationImages = secuenciaHeader
            imgHeader.animationDuration = 1.5
            imgHeader.startAnimating()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    @IBAction func doTapOutpost(_ sender: Any) {
        lblElementoActivo.text = "Outpost"
        do{
            let url = Bundle.main.url(forResource: "Outpost", withExtension: "mp3")
            reproductor = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductor?.volume = 1
            reproductor?.play()
            secuenciaHeader = []
            for i in 1...9{
                let imagen = UIImage(named: "outpostB\(i)")
                secuenciaHeader.append(imagen!)
            }
            imgHeader.animationImages = secuenciaHeader
            imgHeader.animationDuration = 1.0
            imgHeader.startAnimating()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    @IBAction func doTapStation(_ sender: Any) {
        lblElementoActivo.text = "Station"
        do{
            let url = Bundle.main.url(forResource: "station", withExtension: "mp3")
            reproductor = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.mp3.rawValue)
            reproductor?.volume = 1
            reproductor?.play()
            secuenciaHeader = []
            for i in 1...7{
                let imagen = UIImage(named: "Station\(i)")
                secuenciaHeader.append(imagen!)
            }
            imgHeader.animationImages = secuenciaHeader
            imgHeader.animationDuration = 0.9
            imgHeader.startAnimating()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    
}

