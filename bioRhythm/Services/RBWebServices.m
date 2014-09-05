//
//  TMAWebServices.m
//  ThuisMeetApp
//

#import "RBWebServices.h"

#import "RBAppDelegate.h"
/* Services */

#import "AFHTTPRequestOperationManager.h"
#import "AFURLResponseSerialization.h"

static NSString* LOGIN_CODE_KEY = @"login_code";
static NSString* PASSWORD_KEY = @"password";


@implementation RBWebServices
@synthesize operationTMA;
NSString *CURRENT_URI = @"http://54.255.145.51/vytle";
RBAppDelegate *appdelgateobj;
+ (instancetype)sharedWebService {
    static RBWebServices *__webService = nil;
    
    static dispatch_once_t mmSharedHUDOnceToken;
    dispatch_once(&mmSharedHUDOnceToken, ^{
        __webService = [[RBWebServices alloc] init];
        appdelgateobj=(RBAppDelegate *)[[UIApplication sharedApplication]delegate];
    });
    
    return __webService;
}

- (void)getRecentPost:(NSDictionary*)parameters success:(void (^)(NSArray *arrayPost))success failure:(void(^)(NSString *error)) failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //performRequest
    NSString *URL = [NSString stringWithFormat:@"%@/api/get_recent_posts/",CURRENT_URI];
    operationTMA = [manager GET:URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject[@"status"] isEqualToString:@"ok"]) {
            success(responseObject[@"posts"]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error.localizedDescription);
    }];

    [operationTMA start];

}

- (void)showAlertWithError:(NSError*)error{
    NSString *title = @"Helaas";
    NSString *message = error.localizedDescription;
    if (error.code == -1009 || error.code == -1005 || error.code == -1001) {
        message = @"Er is op dit moment geen internetverbinding. Maak verbinding met Wi-Fi of 3G en probeer het opnieuw.";
    }
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
}

- (void)showAlertTitle:(NSString *)title message:(NSString*)message{
    
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] show];
}

@end
