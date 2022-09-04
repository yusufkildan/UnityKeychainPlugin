#import "KeychainWrapper.h"
#import <UIKit/UIKit.h>
#import "KeychainStore.h"

@implementation KeychainWrapper

NSString *appStoreTeamID = @"replace_with_your_appstore_team_id";
NSString *accessGroup = @"replace_with_your_appstore_team_id.SHARED";

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self)
    {
    }
    
    return self;
}

+ (instancetype)keychainWrapper
{
    return  [[self alloc] init];
}

+ (KeychainStore *) uniqueKeychain
{
    NSString *bundleIdentifier  = [[NSBundle mainBundle] bundleIdentifier];
    KeychainStore *keychain  = [KeychainStore keychainStoreWithService:bundleIdentifier];
    
    keychain.synchronizable     = NO; // Do not sync through iCloud.
    keychain.accessibility      = KeychainStoreAccessibilityAlwaysThisDeviceOnly;// Do not Sync via Backup.
    
    return keychain;
}

+ (KeychainStore *) sharedKeychain
{
    KeychainStore *keychain = [KeychainStore keychainStoreWithService: appStoreTeamID accessGroup: accessGroup];
    keychain.synchronizable     = NO; // Do not sync through iCloud.
    keychain.accessibility      = KeychainStoreAccessibilityAlwaysThisDeviceOnly; // Do not Sync via Backup.
    
    return keychain;
}

+ (NSString *) stringForKey: (NSString *)key
{
    KeychainStore *uniqueKeychain  = [KeychainWrapper uniqueKeychain];
    NSString *value = [uniqueKeychain stringForKey:key];
    return value;
}

+ (void) removeItemForKey: (NSString *)key
{
    KeychainStore *uniqueKeychain  = [KeychainWrapper uniqueKeychain];
    [uniqueKeychain removeItemForKey:key];
}

+ (void) setStringForKey: (NSString *)key value:(NSString *)value
{
    KeychainStore *uniqueKeychain  = [KeychainWrapper uniqueKeychain];
    [uniqueKeychain setString:value forKey:key];
}

+ (nullable NSData *)dataForKey:(NSString *)key
{
    KeychainStore *uniqueKeychain  = [KeychainWrapper uniqueKeychain];
    NSData *value = [uniqueKeychain dataForKey:key];
    return value;
}


+ (void) setDataForKey: (NSString *)key data:(NSData *)data
{
    KeychainStore *uniqueKeychain  = [KeychainWrapper uniqueKeychain];
    [uniqueKeychain setData:data forKey:key];
}

+ (BOOL) isKeyExistes: (NSString *)key {
    KeychainStore *uniqueKeychain  = [KeychainWrapper uniqueKeychain];
    NSArray * allKeys = [uniqueKeychain allKeys];
    BOOL isExists = [allKeys containsObject:key];
    return isExists;
}

+ (void) resetKeychain
{
    [KeychainStore removeAllItems];
    [KeychainStore removeAllItemsForService: appStoreTeamID accessGroup: accessGroup];
}

@end
