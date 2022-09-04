#import "KeychainPlugin.h"
#import "KeychainStore.h"
#import "KeychainWrapper.h"

@implementation KeychainPlugin
 
extern "C" {
    void _resetKeychain();
    char* _stringForKey(char* key);
    void _removeItemForKey(char* key);
    void _setStringForKey(char* key, char* value);
    bool _isKeyExists(char* key);
}
 
char* makeStringCopy(const char* str) {
    if (str == NULL) {
        return NULL;
    }
 
    char* res = (char*)malloc(strlen(str) + 1);
    strcpy(res, str);
    return res;
}

void _resetKeychain() {
    [KeychainWrapper resetKeychain];
}

char* _stringForKey(char* key) {
    NSString* objcStringKey = @(key);
    NSString *value = [KeychainWrapper stringForKey:objcStringKey];
    const char *cValue = [value UTF8String];
    return makeStringCopy(cValue);
}

void _removeItemForKey(char* key) {
    NSString* objcStringKey = @(key);
    [KeychainWrapper removeItemForKey:objcStringKey];
}

void _setStringForKey(char* key, char* value) {
    NSString* objcStringKey = @(key);
    NSString* objcStringValue = @(value);
    [KeychainWrapper setStringForKey:objcStringKey value:objcStringValue];
}

bool _isKeyExists(char* key) {
    NSString* objcStringKey = @(key);
    return [KeychainWrapper isKeyExistes:objcStringKey];
}
@end
