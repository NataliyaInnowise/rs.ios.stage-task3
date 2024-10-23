//
//  TreeNode.m
//  ios.stage-task
//
//  Created by Nataliya Lazouskaya on 21/10/2024.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

@implementation TreeNode

- (instancetype)initWithValue:(NSNumber *)value {
    self = [super init];
    if (self) {
        self.value = value;
        self.left = nil;
        self.right = nil;
    }
    return self;
}

@end
