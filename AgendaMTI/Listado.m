//
//  Listado.m
//  AgendaMTI
//
//  Created by TRON on 04/02/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "Listado.h"

NSMutableArray *datos;
NSString *idTemp =nil;
int indice = nil;

@interface Listado ()

@end

@implementation Listado

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController{
    
    datos = [[DBManager getSharedInstance]listDB:@"select agendaid, nombre, estado, youtube, foto from agenda"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)accionRegresar:(id)sender {
    [self performSegueWithIdentifier:@"sagaListadoHome" sender:self];
}

- (IBAction)accionEditar:(id)sender {
    [self performSegueWithIdentifier:@"sagaListadoNuevo" sender:self];
}

- (IBAction)accionEliminar:(id)sender {
}
@end
