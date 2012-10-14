//
//  Cube.h
//  Cubes
//
//  Created by Xavi Gil on 9/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct
{
    CGFloat x;
    CGFloat y;
    CGFloat z;
} Point3D;

typedef struct 
{
    CGFloat minValue;
    CGFloat maxValue;
} Segment;

@interface Cube : NSObject

@property(nonatomic) Point3D center;
@property(nonatomic) CGFloat size;

-(id) initWithCenterAtPoint:(Point3D)aPoint Size:(CGFloat)aSize;

-(NSString *) description;

-(CGFloat) maxX;
-(CGFloat) minX;
-(CGFloat) maxY;
-(CGFloat) minY;
-(CGFloat) maxZ;
-(CGFloat) minZ;

-(CGFloat) volume;
-(BOOL) intersectsWithCube:(Cube *)aCube;
-(CGFloat) volumeOfIntersectionWithCube:(Cube *)aCube;


@end
