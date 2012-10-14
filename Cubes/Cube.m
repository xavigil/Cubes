//
//  Cube.m
//  Cubes
//
//  Created by Xavi Gil on 9/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Cube.h"

@interface Cube()

-(CGFloat) intersectionLengthBetweenSegment:(Segment)segment1 AndSegment:(Segment)segment2;    

@end

@implementation Cube

@synthesize center;
@synthesize size;

-(id) initWithCenterAtPoint:(Point3D)aPoint Size:(CGFloat)aSize
{
    self = [super init];
    if( self )
    {
        center = aPoint;
        
        if( aSize < 0 ) aSize = 0;
        size = aSize;
    }
    return self;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"x = %f, y = %f, z = %f, size = %f; volume = %f", self.center.x, self.center.y, self.center.z, self.size, [self volume]];
}

-(CGFloat) maxX
{
    return self.center.x + (size / 2);
}

-(CGFloat) minX
{
    return self.center.x - (size / 2);
}

-(CGFloat) maxY
{
    return self.center.y + (size / 2);
}

-(CGFloat) minY
{
    return self.center.y - (size / 2);
}

-(CGFloat) maxZ
{
    return self.center.z + (size / 2);
}

-(CGFloat) minZ
{
    return self.center.z - (size / 2);
}

-(CGFloat) volume
{
    return size * size * size;
}

-(BOOL) intersectsWithCube:(Cube *)aCube
{
    BOOL intersection = YES;
    if( [self maxX] <= [aCube minX] || [self minX] >= [aCube maxX] ||
        [self maxY] <= [aCube minY] || [self minY] >= [aCube maxY] ||
        [self maxZ] <= [aCube minZ] || [self minZ] >= [aCube maxZ] 
       )
    {
        intersection = NO;
    }
    return intersection;
}

-(CGFloat) volumeOfIntersectionWithCube:(Cube *)aCube
{
    CGFloat volume = 0;
    
    Segment selfSegment, aCubesSegment;
    
    selfSegment.minValue = [self minX];
    selfSegment.maxValue = [self maxX];
    aCubesSegment.minValue = [aCube minX];
    aCubesSegment.maxValue = [aCube maxX];
    CGFloat xValue = [self intersectionLengthBetweenSegment:selfSegment AndSegment:aCubesSegment];
    
    selfSegment.minValue = [self minY];
    selfSegment.maxValue = [self maxY];
    aCubesSegment.minValue = [aCube minY];
    aCubesSegment.maxValue = [aCube maxY];    
    CGFloat yValue = [self intersectionLengthBetweenSegment:selfSegment AndSegment:aCubesSegment];
    
    selfSegment.minValue = [self minZ];
    selfSegment.maxValue = [self maxZ];
    aCubesSegment.minValue = [aCube minZ];
    aCubesSegment.maxValue = [aCube maxZ];
    CGFloat zValue = [self intersectionLengthBetweenSegment:selfSegment AndSegment:aCubesSegment];

    volume = xValue * yValue * zValue;
    
    return volume;
}

#pragma mark - Private Methods
             
-(CGFloat) intersectionLengthBetweenSegment:(Segment)segment1 AndSegment:(Segment)segment2
{
    CGFloat length = 0.0;
    
    CGFloat left = MAX(segment1.minValue, segment2.minValue);
    CGFloat right = MIN(segment1.maxValue, segment2.maxValue);
    if( left < right )
        length = right - left;
    
    return length;
}

@end
