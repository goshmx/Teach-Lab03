//
//  VerMas.h
//  AgendaMTI
//
//  Created by TRON on 04/02/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface VerMas : UIViewController
//Labels
@property (strong, nonatomic) IBOutlet UILabel *labelNombre;
@property (strong, nonatomic) IBOutlet UILabel *labelEstado;

//ImageView
@property (strong, nonatomic) IBOutlet UIImageView *Foto;

//WebView
@property (strong, nonatomic) IBOutlet UIWebView *Video;

//Acciones
- (IBAction)accionRegresar:(id)sender;





@end
