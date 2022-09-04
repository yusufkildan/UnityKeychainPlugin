public interface IKeychainWrapper
{
	string GetStringForKey(string key, string defaultValue = null);
	void SetStringForKey(string key, string value);
	bool GetBoolForKey(string key, bool defaultValue = false);
	void SetBoolForKey(string key, bool value);
	void RemoveItemForKey(string key);
	bool IsKeyExists(string key);
	void ResetKeychain();
}