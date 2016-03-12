//
//  AIMTableViewIndexBar.m
//  AIMTableViewIndexBar
//
//  Created by Marek Kotewicz on 07.09.2013.
//  Copyright (c) 2013 AllInMobile. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import <QuartzCore/QuartzCore.h>
#import "AIMTableViewIndexBar.h"

#if !__has_feature(objc_arc)
#error AIMTableViewIndexBar must be built with ARC.
// You can turn on ARC for only AIMTableViewIndexBar files by adding -fobjc-arc to the build phase for each of its files.
#endif

#define RGB(r,g,b,a)  [UIColor colorWithRed:(double)r/255.0f green:(double)g/255.0f blue:(double)b/255.0f alpha:a]

@interface AIMTableViewIndexBar (){
    BOOL isLayedOut;
    NSArray *letters;
    CAShapeLayer *shapeLayer;
    CGFloat letterHeight;
}

@end


@implementation AIMTableViewIndexBar
@synthesize indexes, delegate;

- (id)init{
    if (self = [super init]){
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        [self setup];
    }
    return self;
}

- (void)setup{
//    letters = @[@"#",@"热", @"A", @"B", @"C",
//                @"D", @"F", @"G",
//                @"H", @"J", @"K",
//                @"L", @"M", @"N", @"O",
//                @"P", @"Q", @"R", @"S",
//                @"T", @"W",
//                @"X", @"Y", @"Z"];
    
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = 1.0f;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineJoin = kCALineCapSquare;
    shapeLayer.strokeColor = [RGB(218, 218, 218, 1) CGColor];
    shapeLayer.strokeEnd = 0.0f;
    self.layer.masksToBounds = NO;
}

- (void)setIndexes:(NSArray *)idxs{
    indexes = idxs;
    isLayedOut = NO;
    [self layoutSubviews];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    if (!isLayedOut){
        
        [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
        
        shapeLayer.frame = (CGRect) {.origin = CGPointZero, .size = self.layer.frame.size};
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint:CGPointZero];
        [bezierPath addLineToPoint:CGPointMake(0, self.frame.size.height)];
        letterHeight = self.frame.size.height / [indexes count];
        CGFloat fontSize = 14;
        if (letterHeight < 14){
            fontSize = 11;
        }
        
        [indexes enumerateObjectsUsingBlock:^(NSString *letter, NSUInteger idx, BOOL *stop) {
            CGFloat originY = idx * letterHeight;
            CATextLayer *ctl = [self textLayerWithSize:fontSize
                                                string:letter
                                              andFrame:CGRectMake(0, originY, self.frame.size.width, letterHeight)];
            [self.layer addSublayer:ctl];
            [bezierPath moveToPoint:CGPointMake(0, originY)];
            [bezierPath addLineToPoint:CGPointMake(ctl.frame.size.width, originY)];
        }];
        
        shapeLayer.path = bezierPath.CGPath;
        [self.layer addSublayer:shapeLayer];
        
        isLayedOut = YES;
    }
}

- (CATextLayer*)textLayerWithSize:(CGFloat)size string:(NSString*)string andFrame:(CGRect)frame{
    CATextLayer *tl = [CATextLayer layer];
    [tl setFont:@"ArialMT"];
    [tl setFontSize:size];
    [tl setFrame:frame];
    [tl setAlignmentMode:kCAAlignmentCenter];
    [tl setContentsScale:[[UIScreen mainScreen] scale]];
    [tl setForegroundColor:RGB(168, 168, 168, 1).CGColor];
    [tl setString:string];
    return tl;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
	[self sendEventToDelegate:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
	[self sendEventToDelegate:event];
}
- (void)sendEventToDelegate:(UIEvent*)event{
    UITouch *touch = [[event allTouches] anyObject];
	CGPoint point = [touch locationInView:self];
    NSInteger indx = (NSInteger) floorf(fabs(point.y) / letterHeight);
    indx = indx < [indexes count] ? indx : [indexes count] - 1;
    
    [self animateLayerAtIndex:indx];
    
    __block NSInteger scrollIndex;
    NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, indx+1)];
    [indexes enumerateObjectsAtIndexes:indexSet options:NSEnumerationReverse usingBlock:^(NSString *letter, NSUInteger idx, BOOL *stop) {
        scrollIndex = [indexes indexOfObject:letter];
        *stop = scrollIndex != NSNotFound;
    }];
    
    [delegate tableViewIndexBar:self didSelectSectionAtIndex:scrollIndex];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self goback];
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self goback];
}
- (void)animateLayerAtIndex:(NSUInteger)index{
    if ([self.layer.sublayers count] - 1 > index)
    {
        
        [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
//             NSUInteger a = ABS(index - idx);
             NSUInteger a =  abs(index - idx);
//             NSLog(@"%ld",a);
             
             if (a < 4)
             {
                 
                 obj.transform = CATransform3DMakeScale(1 *(4 -a) *1 , 1 *(4 -a)*1, 1);
                 
                 obj.position = CGPointMake(-letterHeight * 4 * sin(M_PI/180*90*((4 - a)/4.0)),letterHeight*idx );
                 
             }
             else
             {
                 obj.transform = CATransform3DMakeScale(1  , 1 , 1);
                 obj.position = CGPointMake( 10,letterHeight*idx );
                 
             }
         }];

    }
}
-(void)goback
{
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
         obj.transform = CATransform3DMakeScale(1  , 1 , 1);
         obj.position = CGPointMake( 10,letterHeight*idx );
         
         
     }];
    
}

@end













