//
//  ViewController.h
//  Cubes
//
//  Created by Xavi Gil on 9/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cube.h"

@interface ViewController : UIViewController
{
    IBOutlet UILabel *lblCube1X;
    IBOutlet UILabel *lblCube1Y;
    IBOutlet UILabel *lblCube1Z;
    IBOutlet UILabel *lblCube1Size;

    IBOutlet UILabel *lblCube2X;
    IBOutlet UILabel *lblCube2Y;
    IBOutlet UILabel *lblCube2Z;
    IBOutlet UILabel *lblCube2Size;
    
}


-(IBAction) onStepperTouched:(id)sender;
-(IBAction) onButtonTouched:(id)sender;


@end
