//
//  ViewController.swift
//  Tarea.U3
//
//  Created by herman vargas on 16-09-15.
//  Copyright (c) 2015 herman vargas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
   
    @IBOutlet weak var lblUsuario: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // cuando se carga la vista  se valida si está logeado o no (contra la caché)
    
    override func viewDidAppear(animated: Bool) {
       
        // creamos un objeto de tipo NSUserDefaults prefs (caché) que guardará si el usuario está logueado o no
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        // generamos una constante de tipo int leyendo de NSUserDefaults ISLOGGEDIN
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        
        // si no está logeado, envía a la vista de login, sino muestra el nombre de usuario, leido de la caché
        if (isLoggedIn != 1) {
            self.performSegueWithIdentifier("irAlogin", sender: self)
        } else {
            self.lblUsuario.text = prefs.valueForKey("USERNAME") as? String
        }
        
    }
    // La función cerrar borrar todos los datos de la caché y devuelve al login
   
    @IBAction func cerrar(sender: UIButton) {
        
        
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
         self.performSegueWithIdentifier("irAlogin", sender: self)
        
    }

}

