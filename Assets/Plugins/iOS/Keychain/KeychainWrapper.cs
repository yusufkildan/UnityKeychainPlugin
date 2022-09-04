using UnityEngine;

public sealed class KeychainWrapper : IKeychainWrapper
{
	public string GetStringForKey(string key, string defaultValue = null)
	{
#if UNITY_IOS && !UNITY_EDITOR
		return IOSKeychainBridge.StringForKey(key);
#endif
		
		LogUnsupportedPlatformMessage();
		
		return defaultValue;
	}

	public void SetStringForKey(string key, string value)
	{
#if UNITY_IOS && !UNITY_EDITOR
			IOSKeychainBridge.SetStringForKey(key, value);
			return;
#endif

		LogUnsupportedPlatformMessage();
	}
	
	public bool GetBoolForKey(string key, bool defaultValue = false)
	{
#if UNITY_IOS && !UNITY_EDITOR
		var stringValue = GetStringForKey(key);
		if (stringValue != null)
		{
			var boolValue = stringValue == true.ToString();
			return boolValue;
		}
#endif
		return defaultValue;
	}

	public void SetBoolForKey(string key, bool value)
	{
		var stringValue = value.ToString();
		SetStringForKey(key, stringValue);
	}
	
	public void RemoveItemForKey(string key)
	{
#if UNITY_IOS && !UNITY_EDITOR
			IOSKeychainBridge.RemoveItemForKey(key);
			return;
#endif

		LogUnsupportedPlatformMessage();
	}
	
	public bool IsKeyExists(string key)
	{
#if UNITY_IOS && !UNITY_EDITOR
		return IOSKeychainBridge.IsKeyExists(key);
#endif
		
		LogUnsupportedPlatformMessage();
		
		return false;
	}
	
	public void ResetKeychain() 
	{ 
#if UNITY_IOS && !UNITY_EDITOR
		IOSKeychainBridge.ResetKeychain();
		return;
#endif
		LogUnsupportedPlatformMessage();
	}

	void LogUnsupportedPlatformMessage()
	{
		Debug.LogWarning("Keychain is supported by only Apple platforms!");
	}
}
