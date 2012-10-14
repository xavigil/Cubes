//
//  ViewController.m
//  Cubes
//
//  Created by Xavi Gil on 9/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown || interfaceOrientation == UIInterfaceOrientationPortrait );
}


-(IBAction) onStepperTouched:(id)sender
{
    UIStepper *stepper = (UIStepper *) sender;
    NSString *value = [NSString stringWithFormat:@"%d", (int)stepper.value];
    switch (stepper.tag) {
        case 0:
            [lblCube1X setText:value];
            break;
        case 1:
            [lblCube1Y setText:value];
            break;
        case 2:
            [lblCube1Z setText:value];
            break;
        case 3:
            if( stepper.value >= 0.0 )
                [lblCube1Size setText:value];
            else 
                stepper.value = 0.0;
            break;
        case 4:
            [lblCube2X setText:value];
            break;
        case 5:
            [lblCube2Y setText:value];
            break;
        case 6:
            [lblCube2Z setText:value];
            break;
        case 7:
            if( stepper.value >= 0.0 )
                [lblCube2Size setText:value];
            else
                stepper.value = 0.0;
            break;
        default:
            break;
    }
}

-(IBAction)onButtonTouched:(id)sender
{
    Point3D center1;
    center1.x = [lblCube1X.text floatValue];
    center1.y = [lblCube1Y.text floatValue];
    center1.z = [lblCube1Z.text floatValue];
    CGFloat size1 = [lblCube1Size.text floatValue];
    Cube *cube1 = [[Cube alloc] initWithCenterAtPoint:center1 Size:size1];
    
    Point3D center2;
    center2.x = [lblCube2X.text floatValue];
    center2.y = [lblCube2Y.text floatValue];
    center2.z = [lblCube2Z.text floatValue];
    CGFloat size2 = [lblCube2Size.text floatValue];
    Cube *cube2 = [[Cube alloc] initWithCenterAtPoint:center2 Size:size2];
    
    NSString *message = nil;
    if( [cube1 intersectsWithCube:cube2] )
    {
        CGFloat volume = [cube1 volumeOfIntersectionWithCube:cube2];
        message = [NSString stringWithFormat:@"The cubes intersect and the volume of the intersection is %0.2f", volume];
    }
    else 
    {
        message = [NSString stringWithString:@"The cubes do not intersect."];
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cubes" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
}

@end
