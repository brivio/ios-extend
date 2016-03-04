#import <objc/runtime.h>

#define PROPERTY_STRING(CLS, val) PROPERTY(CLS,NSString*,val)
#define PROPERTY(CLS, TYPE, VAL) \
    @interface CLS (Extend_private_##VAL) \
        @property(strong, nonatomic) TYPE VAL;\
    @end\
    @implementation CLS (Extend_private_##VAL)\
        static const void *VAL##Key = "##VAL##Key";\
        - (TYPE)VAL {\
            return (TYPE) objc_getAssociatedObject(self, VAL##Key);\
        }\
        - (void)set##VAL:(TYPE)VAL {\
            objc_setAssociatedObject(self, VAL##Key,(id) VAL, OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
        }\
    @end

typedef void (^SimpleCallback)();