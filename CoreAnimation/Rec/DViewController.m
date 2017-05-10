//
//  DViewController.m
//  Rec
//
//  Created by Wicky on 2016/12/18.
//  Copyright © 2016年 Wicky. All rights reserved.
//

#import "DViewController.h"

@interface DViewController ()

@end

@implementation DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view.
        CALayer * layer = [CALayer layer];
        layer.bounds = CGRectMake(0, 0, 30, 30);
        layer.position = CGPointMake(self.view.center.x - 50, self.view.center.y - 50);
        layer.backgroundColor = [UIColor redColor].CGColor;
        layer.cornerRadius = 15;
        [self.view.layer addSublayer:layer];
    
        CABasicAnimation * animation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
        animation1.fromValue = @(0);
        animation1.toValue = @(1);
        animation1.duration = 1.5;
    //    animation1.autoreverses = YES;
    
        CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation2.toValue = @(1.5);
        animation2.fromValue = @(0.5);
        animation2.duration = 1.5;
    //    animation2.autoreverses = YES;
    
        CAAnimationGroup * ani = [CAAnimationGroup animation];
        ani.animations = @[animation1,animation2];
        ani.duration = 1.5;
        ani.repeatCount = MAXFLOAT;
        ani.autoreverses = YES;
    
        [layer addAnimation:ani forKey:nil];
    
        CAReplicatorLayer * rec = [CAReplicatorLayer layer];
        [rec addSublayer:layer];
        rec.instanceCount = 3;
        rec.instanceDelay = 0.5;
        rec.instanceTransform = CATransform3DMakeTranslation(50, 0, 0);
        [self.view.layer addSublayer:rec];
    
        CAReplicatorLayer * rec2 = [CAReplicatorLayer layer];
        [rec2 addSublayer:rec];
        rec2.instanceCount = 3;
        rec2.instanceDelay = 0.5;
        rec2.instanceTransform = CATransform3DMakeTranslation(0, 50, 0);
        [self.view.layer addSublayer:rec2];
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
