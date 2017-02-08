//
//  OGDataServices.m
//  OnGO
//
//  Created by Hanuman Kachwa on 19/12/15.
//  Copyright © 2015 Aryan Ghassemi. All rights reserved.
//

#import "OGDataServices.h"

static NSString * const OGDataServicesAPIBaseURLString = @"http://muktha.tv:8081/";
//static NSString * const OGDataServicesAPIBaseURLString = @"http://52.74.52.134:8081/";


@implementation OGDataServices

+ (instancetype)sharedClient {
    static OGDataServices *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
#if STOREONGO
        
#elif ODNEWS360
        //OGDataServicesAPIBaseURLString = @"http://52.74.52.134:8081/";
#elif MUKTHATV
       // OGDataServicesAPIBaseURLString = @"http://52.74.52.134:8081/";

#else
        
        
#endif
        _sharedClient = [[OGDataServices alloc] initWithBaseURL:[NSURL URLWithString:OGDataServicesAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end
