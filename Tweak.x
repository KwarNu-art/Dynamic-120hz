#import <UIKit/UIKit.h>  
#import <QuartzCore/QuartzCore.h>  
  
%hook CADisplayLink  
  
- (void)setPreferredFrameRateRange:(CAFrameRateRange)range {  
    CAFrameRateRange newRange = CAFrameRateRangeMake(80.0f, 120.0f, 120.0f);  
    %orig(newRange);  
}  
  
- (CAFrameRateRange)preferredFrameRateRange {  
    return CAFrameRateRangeMake(80.0f, 120.0f, 120.0f);  
}  
  
%end  
  
%hook UIScreen  
  
- (NSInteger)maximumFramesPerSecond {  
    return 120;  
}  
  
%end
