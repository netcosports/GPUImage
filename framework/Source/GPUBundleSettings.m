#import "GPUBundleSettings.h"

@interface GPUBundleSettings ()
@end

@implementation GPUBundleSettings

+ (instancetype)sharedInstance {
    static GPUBundleSettings *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[GPUBundleSettings alloc] init];
    });
    return instance;
}

@end
