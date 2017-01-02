//
//  ReactTestView.m
//  MySwiftProject
//
//  Created by chen on 2016/12/31.
//  Copyright © 2016年 chen. All rights reserved.
//

#import "ReactTestView.h"

@implementation ReactTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    // NSString *urlString = @"http://192.168.0.203:8081/index.ios.bundle?platform=ios";
    NSString *urlString = @"http://192.168.1.105:8081/index.ios.bundle?platform=ios&dev=true"; // qq
    // NSString *urlString = @"http://10.180.136.2:8081/index.ios.bundle?platform=ios&dev=true"; // comma
    // NSString *urlString = @"http://localhost:8081/index.ios.bundle?platform=ios&dev=true";
    NSLog(@"%@", urlString);
    NSURL *jsCodeLocation = [NSURL URLWithString:urlString];
    //    NSURL *jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName:@"MySwiftProject" initialProperties:nil launchOptions:nil];
    [self addSubview:rootView];
    rootView.frame = self.bounds;
}

@end
