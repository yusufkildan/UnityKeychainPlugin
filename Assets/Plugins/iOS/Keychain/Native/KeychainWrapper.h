#import <Foundation/Foundation.h>

@interface KeychainWrapper : NSObject

+ (instancetype)keychainWrapper;

+ (NSString *) stringForKey: (NSString *)key;
+ (void) removeItemForKey: (NSString *)key;
+ (void) setStringForKey: (NSString *)key value:(NSString *)value;
+ (NSData *)dataForKey:(NSString *)key;
+ (void) setDataForKey: (NSString *)key data:(NSData *)data;
+ (BOOL) isKeyExistes: (NSString *)key;
+ (void) resetKeychain;

@end

