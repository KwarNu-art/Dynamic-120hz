#import <UIKit/UIKit.h>  
#import <QuartzCore/QuartzCore.h>  
  
// SDK ဗားရှင်းအမျိုးမျိုးတွင် Compile error မတက်စေရန် Struct သတ်မှတ်ချက်  
#ifndef CAFrameRateRange_DEFINED  
typedef struct CAFrameRateRange {  
    float minimum;  
    float maximum;  
    float preferred;  
} CAFrameRateRange;  
#endif  
  
%hook CADisplayLink  
  
- (void)setPreferredFrameRateRange:(CAFrameRateRange)range {  
    // 80Hz သို့မဟုတ် နိမ့်သော frame rate များကို 120Hz သို့ Force လုပ်ခြင်း  
    CAFrameRateRange highRange;  
    highRange.minimum = 80.0f;  
    highRange.maximum = 120.0f;  
    highRange.preferred = 120.0f;  
    %orig(highRange);  
}  
  
- (void)setPreferredFramesPerSecond:(NSInteger)fps {  
    // Legacy frame rate သတ်မှတ်ချက်ကို 120Hz သို့ ပို့ပေးခြင်း  
    %orig(120);  
}  
  
%end  
  
%hook UIScreen  
  
- (NSInteger)maximumFramesPerSecond {  
    NSInteger origMax = %orig;  
    // မျက်နှာပြင်သည် ProMotion ဖြစ်ပါက 120Hz အပြည့် အတည်ပြုပေးခြင်း  
    if (origMax > 60) {  
        return 120;  
    }  
    return origMax;  
}  
  
%end
