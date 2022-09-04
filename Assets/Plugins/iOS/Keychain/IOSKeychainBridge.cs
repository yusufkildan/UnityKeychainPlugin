#if UNITY_IOS && !UNITY_EDITOR
using UnityEngine;

using System.Runtime.InteropServices;

public static class IOSKeychainBridge
{
	const string DLL_Name = "__Internal";

	#region Native

	[DllImport(DLL_Name)]
	static extern void _resetKeychain();
	
	[DllImport(DLL_Name)]
	static extern string _stringForKey(string key);
	
	[DllImport(DLL_Name)]
	static extern void _removeItemForKey(string key);
	
	[DllImport(DLL_Name)]
	static extern void _setStringForKey(string key, string value);

	[DllImport(DLL_Name)]
	static extern bool _isKeyExists(string key);	

	#endregion

	public static void ResetKeychain()
	{
		if (Application.platform == RuntimePlatform.IPhonePlayer)
		{
			_resetKeychain();
		}
	}

	public static string StringForKey(string key)
	{
		return _stringForKey(key);
	}

	public static void RemoveItemForKey(string key)
	{
		_removeItemForKey(key);
	}

	public static void SetStringForKey(string key, string value)
	{
		_setStringForKey(key, value);
	}

	public static bool IsKeyExists(string key)
	{
		return _isKeyExists(key);
	}
}
#endif
