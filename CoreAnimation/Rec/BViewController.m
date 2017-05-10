//
//  BViewController.m
//  Rec
//
//  Created by Wicky on 2016/12/17.
//  Copyright © 2016年 Wicky. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()
@property (nonatomic ,strong) UIView * containerView;

@property (nonatomic, strong) CALayer * cube2;

@property (nonatomic ,assign) CGPoint lastPoint;
@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [self.containerView.layer addSublayer:cube2];
    self.cube2 = cube2;
}

- (CALayer *)faceWithTransform:(CATransform3D)transform
{
    //create cube face layer
    CALayer *face = [CALayer layer];
    face.bounds = CGRectMake(0, 0, 100, 100);
    //apply a random color
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    face.transform = transform;
    return face;
}

- (CALayer *)cubeWithTransform:(CATransform3D)transform
{
    //create cube layer
    CATransformLayer *cube = [CATransformLayer layer];
    
    //add cube face 1
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 2
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 3
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 4
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 5
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //add cube face 6
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    //center the cube layer within the container
    CGSize containerSize = self.containerView.bounds.size;
    cube.position = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    
    //apply the transform and return
    cube.sublayerTransform = transform;
    return cube;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (CGPointEqualToPoint(self.lastPoint, CGPointZero)) {
        self.lastPoint = point;
        return;
    }
    if (CGPointEqualToPoint(self.lastPoint, point)) {
        return;
    }
    CGPoint offset = CGPointMake(point.x - self.lastPoint.x, point.y - self.lastPoint.y);
    CATransform3D trans = [self transform:self.cube2.transform rotateWithOffsetPoint:offset];
    self.cube2.transform = trans;
    
    self.lastPoint = point;
}

-(CATransform3D)transform:(CATransform3D)transform rotateWithOffsetPoint:(CGPoint)offset
{
    CGFloat angleX = [self convertOffsetToAngle:offset.x];
    CGFloat angleY = [self convertOffsetToAngle:offset.y];
    transform = CATransform3DRotate(transform, angleX, 0, 1, 0);
    transform = CATransform3DRotate(transform, -angleY, 1, 0, 0);
    return transform;
}

-(CGFloat)convertOffsetToAngle:(CGFloat)offset
{
    if (offset > 100) {
        offset = 100;
    } else if (offset < -100)
    {
        offset = -100;
    }
    
    return M_PI / 400 * offset;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.lastPoint = CGPointZero;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_containerView];
    }
    return _containerView;
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
