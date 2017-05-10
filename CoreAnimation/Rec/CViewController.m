//
//  CViewController.m
//  Rec
//
//  Created by Wicky on 2016/12/18.
//  Copyright © 2016年 Wicky. All rights reserved.
//

#import "CViewController.h"

@interface CViewController ()

@property (nonatomic ,strong) CAShapeLayer * mask;

@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:45 startAngle:- 7.0 / 6 * M_PI endAngle:M_PI / 6 clockwise:YES];
    
    [self.view.layer addSublayer:[self createShapeLayerWithPath:path]];
    
    CAGradientLayer * leftL = [self createGradientLayerWithColors:@[(id)[UIColor redColor].CGColor,(id)[UIColor yellowColor].CGColor]];
    leftL.position = CGPointMake(25, 40);
    
    CAGradientLayer * rightL = [self createGradientLayerWithColors:@[(id)[UIColor greenColor].CGColor,(id)[UIColor yellowColor].CGColor]];
    rightL.position = CGPointMake(75, 40);
    
    CALayer * layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 80);
    layer.position = self.view.center;
    [layer addSublayer:leftL];
    [layer addSublayer:rightL];
    [self.view.layer addSublayer:layer];
    
    CAShapeLayer * mask = [self createShapeLayerWithPath:path];
    mask.position = CGPointMake(50, 40);
    layer.mask = mask;
    mask.strokeEnd = 0;
    self.mask = mask;
}

-(CAShapeLayer *)createShapeLayerWithPath:(UIBezierPath *)path
{
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.bounds = CGRectMake(0, 0, 100, 75);
    layer.position = self.view.center;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor colorWithRed:33 / 255.0 green:192 / 255.0 blue:250 / 255.0 alpha:1].CGColor;
    layer.lineCap = @"round";
    layer.lineWidth = 10;
    return layer;
}

-(CAGradientLayer *)createGradientLayerWithColors:(NSArray *)colors
{
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = colors;
    gradientLayer.locations = @[@0,@0.8];
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(0, 0);
    gradientLayer.bounds = CGRectMake(0, 0, 50, 80);
    return gradientLayer;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:2];
    if (self.mask.strokeEnd == 0) {
        self.mask.strokeEnd = 1;
    }
    else
    {
        self.mask.strokeEnd = 0;
    }
    [CATransaction commit];
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

@end
