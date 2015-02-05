//
//  Nuevo.h
//  AgendaMTI
//
//  Created by TRON on 04/02/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface Nuevo : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate>

//Fields
@property (strong, nonatomic) IBOutlet UITextField *inputNombre;
@property (strong, nonatomic) IBOutlet UITextField *inputEstado;
@property (strong, nonatomic) IBOutlet UITextField *inputYoutube;

//ImageView
@property (strong, nonatomic) IBOutlet UIImageView *inputFoto;

//Acciones
- (IBAction)accionGuardar:(id)sender;
- (IBAction)accionRegresar:(id)sender;
- (IBAction)accionFoto:(id)sender;




@end
