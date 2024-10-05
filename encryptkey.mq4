//+------------------------------------------------------------------+
//|                                                      Base64Key.mq4|
//|                        Copyright 2023, Your Name                 |
//|                                       https://www.yourwebsite.com|
//+------------------------------------------------------------------+
#property strict // Enforces strict type checking and prevents certain programming errors
#property script_show_inputs // Allows the script to show input parameters in the script's properties

// Declare external input parameters for the script
extern string input_accountName = "Your Account Name"; // Account name input, default value is a placeholder
extern int input_accountNumber = 123456; // Account number input, default value is a placeholder

// Define the encryption method and key
ENUM_CRYPT_METHOD method = CRYPT_BASE64; // Set the encryption method to Base64; can be adjusted as needed
uchar key[]; // Declare an array to hold the encryption key as unsigned characters

// Function to encode account details
string EncodeAccountDetails(string accountName, int accountNumber) {
    // Convert key string to uchar array
    string keyString = "your_secret_key"; // Define the encryption key as a string; replace with the actual key
    StringToCharArray(keyString, key); // Convert the key string to a uchar array for encryption use

    uchar encodedName[256]; // Declare an array to hold the encoded account name; size can be adjusted as needed
    uchar encodedNumber[256]; // Declare an array to hold the encoded account number; size can be adjusted as needed

    // Convert account name string to uchar array
    uchar nameData[]; // Declare an array to hold the uchar representation of the account name
    StringToCharArray(accountName, nameData); // Convert the account name string to a uchar array

    // Convert account number to string and then to uchar array
    uchar numberData[]; // Declare an array to hold the uchar representation of the account number
    StringToCharArray(IntegerToString(accountNumber), numberData); // Convert the account number to a string and then to a uchar array

    // Encode account name using the specified encryption method
    int nameResult = CryptEncode(method, nameData, key, encodedName); // Perform encryption on the account name

    // Encode account number using the specified encryption method
    int numberResult = CryptEncode(method, numberData, key, encodedNumber); // Perform encryption on the account number

    // Convert encoded uchar arrays back to string for output
    string resultName = CharArrayToString(encodedName); // Convert the encoded account name back to a string
    string resultNumber = CharArrayToString(encodedNumber); // Convert the encoded account number back to a string

    // Return the combined encoded string of account name and number, separated by a colon
    return resultName + ":" + resultNumber; // Return the final encoded result
}

//+------------------------------------------------------------------+
//| Main function                                                    |
//+------------------------------------------------------------------+
void OnStart() // Entry point of the script
{
    // Call the EncodeAccountDetails function with the provided account name and number
    string encodedDetails = EncodeAccountDetails(input_accountName, input_accountNumber); // Store the encoded result
    Print("Encoded Account Details: ", encodedDetails); // Print the encoded account details to the output
}