//
//  Created by Rene Dohan on 11/2/12.
//



#import "Response.h"

@implementation Response

+ (Response *)wrap:(Response *)response {
		Response *responseWrapper = [Response new];
		response.onSuccess = ^(id data) {
				runWith(responseWrapper.onSuccess, data);
		};
		response.onFailed = ^(NSString *message) {
				runWith(responseWrapper.onFailed, message);
		};
		response.onDone = ^{
				run(responseWrapper.onDone);
		};
		return responseWrapper;
}

- (void)success:(id)data {
		runWith(_onSuccess, data);
		run(_onDone);
}

- (void)failed:(NSString *)message {
		runWith(_onFailed, message);
		run(_onDone);
}
@end