//
//  EViewController.m
//  Rec
//
//  Created by Wicky on 2016/12/20.
//  Copyright © 2016年 Wicky. All rights reserved.
//

#import "EViewController.h"
#import "DWMirrorView.h"

@interface EViewController ()

@property (nonatomic ,strong) DWMirrorView * mirror;

@end

@implementation EViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DWMirrorView * mirror = [[DWMirrorView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    mirror.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
    mirror.mirrorDistant = 50;
    [self.view addSubview:mirror];
    
    UIView * container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [mirror addSubview:container];
    container.backgroundColor = [UIColor lightGrayColor];
    
    UIView * pot = [[UIView alloc] initWithFrame:CGRectMake(90, 50, 20, 20)];
    pot.backgroundColor = [UIColor redColor];
    pot.layer.cornerRadius = 10;
    CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    ani.toValue = @(0.5);
    ani.duration = 2;
    ani.repeatCount = MAXFLOAT;
    ani.autoreverses = YES;
    [pot.layer addAnimation:ani forKey:nil];
    [container addSubview:pot];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 200)];
    view.backgroundColor = [UIColor redColor];
    [container addSubview:view];
    
    self.mirror = mirror;
}

- (IBAction)mirrow:(id)sender {
    self.mirror.mirrored = !self.mirror.mirrored;
}
- (IBAction)dynamic:(id)sender {
    self.mirror.dynamic = YES;
}
- (IBAction)static:(id)sender {
    self.mirror.dynamic = NO;
}
- (IBAction)scale:(UISlider *)sender {
    
    self.mirror.mirrorScale = sender.value;
}
- (IBAction)alpha:(UISlider *)sender {
    self.mirror.mirrorAlpha = sender.value;
}
- (IBAction)distant:(UISlider *)sender {
    self.mirror.mirrorDistant = sender.value * 100;
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
