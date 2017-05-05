#import <Foundation/Foundation.h>

@interface GPUBundleSettings : NSObject

+ (instancetype)sharedInstance NS_SWIFT_NAME(shared());
@property (nonatomic, weak) NSBundle *bundle;

@end
