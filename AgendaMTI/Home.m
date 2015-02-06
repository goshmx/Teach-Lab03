//
//  ViewController.m
//  AgendaMTI
//
//  Created by TRON on 03/02/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "Home.h"


@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    idTemp = nil;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)accionNuevo:(id)sender {
    [self performSegueWithIdentifier:@"sagaHomeNuevo" sender:self];
}

- (IBAction)accionEditar:(id)sender {
    [self performSegueWithIdentifier:@"sagaHomeListado" sender:self];
}

- (IBAction)accionBorrar:(id)sender {
    [self performSegueWithIdentifier:@"sagaHomeListado" sender:self];
}

- (IBAction)accionListado:(id)sender {
    [self performSegueWithIdentifier:@"sagaHomeDetalle" sender:self];
}
@end
