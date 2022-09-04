# UnityKeychainPlugin

## Setup
1. Download the repository and drag and drop the **Keychain** folder to your project.
2. Open the **KeychainWrapper.m** file and set your AppStore Team ID

## Usage

Create **KeychainWrapper** instance and use the methods of it.

```c#
var keychainWrapper = new KeychainWrapper();
keychainWrapper.SetStringForKey("user_id", "123e4567-e89b-12d3-a456-426614174000");
var userID = keychainWrapper.GetStringForKey("user_id");
```
