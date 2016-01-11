/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIImageView+WebCache.h"
#import "objc/runtime.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (YmCache)

- (void)ym_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder{

    __weak UIImageView *imageWeak = self;
    
    [self sd_setImageWithURL:url placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType,NSURL *urlString){
    
        if (image && cacheType == SDImageCacheTypeNone) {
            
            imageWeak.alpha = 0.0;
            [UIView animateWithDuration:0.5
                             animations:^{
                                 imageWeak.alpha = 1.0;
                             }];

            
        }
        
        
    }];
    
}

@end
