//
//  TMAWebServices.h
//  ThuisMeetApp
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
@interface RBWebServices : NSObject{
    BOOL isCanceled;
}

@property (strong, nonatomic) AFHTTPRequestOperation *operationTMA;
+ (instancetype)sharedWebService;
- (void)getRecentPost:(NSDictionary*)parameters success:(void (^)(NSArray *arrayPost))success failure:(void(^)(NSString *error)) failure;
@end
