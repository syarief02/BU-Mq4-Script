//+------------------------------------------------------------------+
//|                                                   arraytohex.mq4 |
//|                        Copyright 2023, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

extern string inputString = "1.61";
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   string encodedName = EncodeString(inputString);
   Print("Encoded Name: " + encodedName);
  }
//+------------------------------------------------------------------+
string EncodeString(string inputString)
  {
   uchar inData[], outData[], keyData[];
// Set the key
   StringToCharArray("H+#eF_He", keyData);
// Convert the input string to a character array
   StringToCharArray(inputString, inData, 0, StringLen(inputString));
// Encrypt the data using DES
   CryptEncode(CRYPT_DES, inData, keyData, outData);
// Convert the encrypted data to a hexadecimal string
   string encodedString = ArrayToHex(outData);
   return encodedString;
  }

// Function to convert uchar array to hexadecimal string
string ArrayToHex(uchar &arr[], int count = -1)
  {
   string res = "";
   if(count < 0 || count > ArraySize(arr))
      count = ArraySize(arr);
   for(int i = 0; i < count; i++)
      res += StringFormat("%.2X", arr[i]);
   return res;
  }

// Example usage
