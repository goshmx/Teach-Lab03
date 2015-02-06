//
//  Nuevo.m
//  AgendaMTI
//
//  Created by TRON on 04/02/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "Nuevo.h"

UIAlertView *alert;

@interface Nuevo ()

@end

@implementation Nuevo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(idTemp != nil){
        
        self.buttonRegresarListado.hidden =NO;
        self.buttonRegresar.hidden = YES;
        self.buttonGuardar.hidden = YES;
        self.accionActualizar.hidden = NO;
        
        NSMutableArray *dato;
        dato = [[DBManager getSharedInstance]consultaDB:[NSString stringWithFormat: @"select agendaid, nombre, estado, youtube, foto FROM agenda WHERE agendaid=%@;", idTemp]];
        self.inputNombre.text = [dato objectAtIndex:1];
        self.inputEstado.text = [dato objectAtIndex:2];
        self.inputYoutube.text = [dato objectAtIndex:3];
        self.inputFoto.image = [UIImage imageWithData:[dato objectAtIndex:4]];
    }
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

- (IBAction)accionGuardar:(id)sender {
    NSString *nombre  = self.inputNombre.text;
    NSString *estado  = self.inputEstado.text;
    NSString *youtube = self.inputYoutube.text;
    NSData *imageData = UIImagePNGRepresentation([self.inputFoto image]);
    if((nombre.length == 0)||(estado == 0)||(youtube == 0)){
        alert = [[UIAlertView alloc] initWithTitle:@"Faltan campos!"
                                           message:@"Oops! Parece que no haz llenado todos los campos!"
                                          delegate:self
                                 cancelButtonTitle:@"Ok"
                                 otherButtonTitles: nil];
        [alert show];
    }
    else{
        if([[DBManager getSharedInstance]insertaDB:nombre estado:estado youtube:youtube foto:imageData]){
            [self performSegueWithIdentifier:@"sagaNuevoHome" sender:self];
        }
    }
}

- (IBAction)accionRegresar:(id)sender {
    [self performSegueWithIdentifier:@"sagaNuevoHome" sender:self];
}

- (IBAction)accionFoto:(id)sender {
    alert = [[UIAlertView alloc] initWithTitle:@"Fotografia"
                                       message:@"Que desea hacer?"
                                      delegate:self
                             cancelButtonTitle:@"Cancelar"
                             otherButtonTitles:@"Camara", @"Carrete", nil];
    [alert show];
}

- (IBAction)accionRegresarListado:(id)sender {
    [self performSegueWithIdentifier:@"sagaNuevoListado" sender:self];
}

- (IBAction)accionActualizar:(id)sender {
    NSString *nombre  = self.inputNombre.text;
    NSString *estado  = self.inputEstado.text;
    NSString *youtube = self.inputYoutube.text;
    NSData *imageData = UIImagePNGRepresentation([self.inputFoto image]);
    if((nombre.length == 0)||(estado == 0)||(youtube == 0)){
        alert = [[UIAlertView alloc] initWithTitle:@"Faltan campos!"
                                           message:@"Oops! Parece que no haz llenado todos los campos!"
                                          delegate:self
                                 cancelButtonTitle:@"Ok"
                                 otherButtonTitles: nil];
        [alert show];
    }
    else{
        if([[DBManager getSharedInstance]actualizaDB:nombre estado:estado youtube:youtube foto:imageData idagenda:idTemp]){
            [self performSegueWithIdentifier:@"sagaNuevoHome" sender:self];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        NSLog(@"Cancelar");
    }
    else if(buttonIndex == 1)
    {
        NSLog(@"Camara");
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
    else if(buttonIndex == 2)
    {
        NSLog(@"Carrete");
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.inputFoto.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


@end
