//
//  Detalle.m
//  AgendaMTI
//
//  Created by TRON on 04/02/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "Detalle.h"

@interface Detalle ()

@end

@implementation Detalle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [self performSegueWithIdentifier:@"sagaDetalleHome" sender:self];
}

- (IBAction)accionVerMas:(id)sender {
    [self performSegueWithIdentifier:@"sagaDetalleVerMas" sender:self];
}

- (IBAction)accionCompartir:(id)sender {
}
@end