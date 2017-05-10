//
//  ViewController.m
//  Rec
//
//  Created by Wicky on 2016/12/15.
//  Copyright © 2016年 Wicky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
 
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer * staticLayerA = [CALayer layer];
    staticLayerA.bounds = CGRectMake(0, 0, 100, 100);
    staticLayerA.position = CGPointMake(self.view.center.x - 75, self.view.center.y - 100);
    staticLayerA.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:staticLayerA];
    
    CATransform3D transA = CATransform3DIdentity;
    transA.m34 = - 1.0 / 500;
    transA = CATransform3DRotate(transA, M_PI / 3, 1, 0, 0);
    staticLayerA.transform = transA;
    
    CALayer * staticLayeB = [CALayer layer];
    staticLayeB.bounds = CGRectMake(0, 0, 100, 100);
    staticLayeB.position = CGPointMake(self.view.center.x + 75, self.view.center.y - 100);
    staticLayeB.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:staticLayeB];
    
    CATransform3D transB = CATransform3DIdentity;
    transB = CATransform3DRotate(transB, M_PI / 3, 1, 0, 0);
    staticLayeB.transform = transB;
    
    CALayer * animationLayerA = [CALayer layer];
    animationLayerA.bounds = CGRectMake(0, 0, 100, 100);
    animationLayerA.position = CGPointMake(self.view.center.x - 75, self.view.center.y + 100);
    animationLayerA.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:animationLayerA];
    
    CABasicAnimation * animationA = [CABasicAnimation animationWithKeyPath:@"transform"];
    animationA.repeatCount = MAXFLOAT;
    animationA.toValue = [NSValue valueWithCATransform3D:transA];
    animationA.duration = 2;
    animationA.autoreverses = YES;
    [animationLayerA addAnimation:animationA forKey:@"aniA"];
    
    CALayer * animationLayerB = [CALayer layer];
    animationLayerB.bounds = CGRectMake(0, 0, 100, 100);
    animationLayerB.position = CGPointMake(self.view.center.x + 75, self.view.center.y + 100);
    animationLayerB.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:animationLayerB];
    
    CABasicAnimation * animationB = [CABasicAnimation animationWithKeyPath:@"transform"];
    animationB.repeatCount = MAXFLOAT;
    animationB.toValue = [NSValue valueWithCATransform3D:transB];
    animationB.duration = 2;
    animationB.autoreverses = YES;
    [animationLayerB addAnimation:animationB forKey:@"aniB"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
