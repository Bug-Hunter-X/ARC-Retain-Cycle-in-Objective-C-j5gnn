#import <Foundation/Foundation.h>

@interface MyClass : NSObject
@property (nonatomic, weak) id <MyDelegate> delegate; // Weak reference
- (void)doSomething;
@end

@protocol MyDelegate <NSObject>
- (void)methodCalledFromMyClass; // Delegate method
@end

@implementation MyClass
- (void)doSomething {
    if (self.delegate) {
        [self.delegate methodCalledFromMyClass];
    }
}
@end

// Implementation of the delegate
@interface MyDelegateClass : NSObject <MyDelegate>
@end
@implementation MyDelegateClass
- (void)methodCalledFromMyClass {
    // Do something
}
@end
int main() {
    MyClass *myClass = [[MyClass alloc] init];
    MyDelegateClass *myDelegate = [[MyDelegateClass alloc] init];
    myClass.delegate = myDelegate; // Assign the delegate
    [myClass doSomething];
    myClass = nil; // After assigning the delegate to weak, it should be deallocated
    myDelegate = nil;
    return 0;
}