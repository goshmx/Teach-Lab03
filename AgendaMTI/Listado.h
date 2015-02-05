//
//  Listado.h
//  AgendaMTI
//
//  Created by TRON on 04/02/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Listado : UIViewController

//TableView
@property (strong, nonatomic) IBOutlet UITableView *tableDatos;

//Acciones
- (IBAction)accionRegresar:(id)sender;
- (IBAction)accionEditar:(id)sender;
- (IBAction)accionEliminar:(id)sender;



@end
