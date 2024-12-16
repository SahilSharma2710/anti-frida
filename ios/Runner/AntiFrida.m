#import <Foundation/Foundation.h>

BOOL isFridaRunning(void) {
    // Example check: Look for known Frida indicators in the file system
    NSString *path = @"/usr/lib/frida";
    
    // Using NSFileManager to check if the file exists
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:path];
    
    // Return whether the Frida file is detected
    return fileExists;
}
