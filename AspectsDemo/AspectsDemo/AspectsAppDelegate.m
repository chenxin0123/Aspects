//
//  AspectsAppDelegate.m
//  AspectsDemo
//
//  Created by Peter Steinberger on 03/05/14.
//  Copyright (c) 2014 PSPDFKit GmbH. All rights reserved.
//

#import "AspectsAppDelegate.h"
#import "AspectsViewController.h"
#import "Aspects.h"

@interface xx : UIViewController
@end
@implementation xx

- (void)buttonPressed:(id)sender {
    NSLog(@"hshs");
}
@end

@implementation AspectsAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    AspectsViewController *aspectsController = [AspectsViewController new];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:aspectsController];
    [self.window makeKeyAndVisible];

    // Ignore hooks when we are testing.
    if (!NSClassFromString(@"XCTestCase")) {
        [AspectsViewController aspect_hookSelector:@selector(buttonPressed:) withOptions:0 usingBlock:^(id info, id sender) {
            NSLog(@"Button was pressed by: %@", sender);
        } error:NULL];
        [xx aspect_hookSelector:@selector(buttonPressed:) withOptions:0 usingBlock:^(id info, id sender) {
            NSLog(@"Button was pressed by2: %@", sender);
        } error:NULL];

        [aspectsController aspect_hookSelector:@selector(viewWillLayoutSubviews) withOptions:0 usingBlock:^{
            NSLog(@"Controller is layouting!");
        } error:NULL];
    }

    return YES;
}

@end
