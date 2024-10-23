#import "LevelOrderTraversal.h"
#import "TreeNode.h"

TreeNode *buildTreeFromPreorder(NSArray *preorder, NSInteger *index) {
    if (*index >= preorder.count || preorder[*index] == [NSNull null]) {
        (*index)++;
        return nil;
    }
    
    TreeNode *node = [[TreeNode alloc] initWithValue:preorder[*index]];
    (*index)++;
    node.left = buildTreeFromPreorder(preorder, index);
    node.right = buildTreeFromPreorder(preorder, index);
    
    return node;
}

NSArray *levelOrderTraversal(TreeNode *root) {
    if (root == nil) {
        return @[];
    }
    
    NSMutableArray *result = [NSMutableArray array];
    NSMutableArray *queue = [NSMutableArray arrayWithObject:root];
    
    while (queue.count > 0) {
        NSMutableArray *level = [NSMutableArray array];
        NSInteger size = queue.count;
        
        for (NSInteger i = 0; i < size; i++) {
            TreeNode *node = queue[0];
            [queue removeObjectAtIndex:0];
            [level addObject:node.value];
            
            if (node.left != nil) {
                [queue addObject:node.left];
            }
            if (node.right != nil) {
                [queue addObject:node.right];
            }
        }
        
        [result addObject:level];
    }
    
    return result;
}

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSInteger index = 0;
    TreeNode *root = buildTreeFromPreorder(tree, &index);
    return levelOrderTraversal(root);
}
