//
//  TreeNode.h
//  ios.stage-task
//
//  Created by Nataliya Lazouskaya on 21/10/2024.
//

#ifndef TreeNode_h
#define TreeNode_h

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject

@property (nonatomic, strong) NSNumber *value;
@property (nonatomic, strong) TreeNode *left;
@property (nonatomic, strong) TreeNode *right;

- (instancetype)initWithValue:(NSNumber *)value;

@end

#endif /* TreeNode_h */
