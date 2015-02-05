//
//  Detalle.m
//  AgendaMTI
//
//  Created by TRON on 04/02/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "Detalle.h"
#import "AgendaList.h"

NSMutableArray *datos;
NSString *idTemp =nil;
int indice = nil;

@interface Detalle ()

@end

@implementation Detalle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the
    [self initController];
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
    [self performSegueWithIdentifier:@"sagaDetalleHome" sender:self];
}

- (IBAction)accionVerMas:(id)sender {
    [self performSegueWithIdentifier:@"sagaDetalleVerMas" sender:self];
}

- (IBAction)accionCompartir:(id)sender {
    if(idTemp != nil){
        NSMutableArray *dato = datos[indice];
        
        NSString                    *strMsg;
        NSArray                     *activityItems;
        UIImage                     *imgShare;
        UIActivityViewController    *actVC;
        
        imgShare =  [UIImage imageWithData:[dato objectAtIndex:4]];
        strMsg = [NSString stringWithFormat: @"Comparti un contacto, se llama %@ y su estado es: %@", [dato objectAtIndex:1], [dato objectAtIndex:2]];
        
        activityItems = @[imgShare, strMsg];
        
        //Init activity view controller
        actVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
        actVC.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
        
        [self presentViewController:actVC animated:YES completion:nil];
    }
}







/**********************************************************************************************
 Table Functions
 **********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [datos count];
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AgendaList";
    AgendaList *cell = (AgendaList *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[AgendaList alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSMutableArray *dato = datos[indexPath.row];
    cell.labelNombre.text = [dato objectAtIndex:1];
    cell.labelEstado.text = [dato objectAtIndex:2];
    cell.foto.image = [UIImage imageWithData:[dato objectAtIndex:4]];
    CALayer * l = [cell.foto layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:30.0];
    return cell;
}


//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *dato = datos[indexPath.row];
    indice = indexPath.row;
    idTemp = [dato objectAtIndex:0];
    self.labelTitulo.text = [dato objectAtIndex:1];
    
    
    
}


@end
