#import "GPUImageMissEtikateFilter.h"
#import "GPUImagePicture.h"
#import "GPUImageLookupFilter.h"
#import "GPUBundleSettings.h"

@implementation GPUImageMissEtikateFilter

- (id)init;
{
    if (!(self = [super init]))
    {
		return nil;
    }

#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
    #if __has_include(<UIKit/UITraitCollection.h>)
        NSBundle *bundle = [NSBundle bundleForClass:[GPUImageMissEtikateFilter class]];
        UIImage *image = [UIImage imageNamed:@"lookup_miss_etikate.png" inBundle:bundle compatibleWithTraitCollection:nil];
    #else
        UIImage *image = [UIImage imageNamed:@"lookup_miss_etikate.png"];
    #endif
#else
    NSImage *image = [NSImage imageNamed:@"lookup_miss_etikate.png"];
#endif

    NSAssert(image, @"To use GPUImageMissEtikateFilter you need to add lookup_miss_etikate.png from GPUImage/framework/Resources to your application bundle.");

    lookupImageSource = [[GPUImagePicture alloc] initWithImage:image];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [self addFilter:lookupFilter];

    [lookupImageSource addTarget:lookupFilter atTextureLocation:1];
    [lookupImageSource processImage];

    self.initialFilters = [NSArray arrayWithObjects:lookupFilter, nil];
    self.terminalFilter = lookupFilter;

    return self;
}

#pragma mark -
#pragma mark Accessors

@end
