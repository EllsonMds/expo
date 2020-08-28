#import "ABI39_0_0REASetNode.h"
#import "ABI39_0_0REAUtils.h"
#import <ABI39_0_0React/ABI39_0_0RCTConvert.h>
#import <ABI39_0_0React/ABI39_0_0RCTLog.h>
#import "ABI39_0_0REAValueNode.h"
#import "ABI39_0_0REANodesManager.h"

@implementation ABI39_0_0REASetNode {
  NSNumber *_whatNodeID;
  NSNumber *_valueNodeID;
}

- (instancetype)initWithID:(ABI39_0_0REANodeID)nodeID config:(NSDictionary<NSString *,id> *)config
{
  if ((self = [super initWithID:nodeID config:config])) {
    _whatNodeID = [ABI39_0_0RCTConvert NSNumber:config[@"what"]];
    ABI39_0_0REA_LOG_ERROR_IF_NIL(_whatNodeID, @"Reanimated: First argument passed to set node is either of wrong type or is missing.");
    _valueNodeID = [ABI39_0_0RCTConvert NSNumber:config[@"value"]];
    ABI39_0_0REA_LOG_ERROR_IF_NIL(_valueNodeID, @"Reanimated: Second argument passed to set node is either of wrong type or is missing.");
  }
  return self;
}

- (id)evaluate
{
  NSNumber *newValue = [[self.nodesManager findNodeByID:_valueNodeID] value];
  ABI39_0_0REAValueNode *what = (ABI39_0_0REAValueNode *)[self.nodesManager findNodeByID:_whatNodeID];
  [what setValue:newValue];
  return newValue;
}

@end
