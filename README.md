# MQL4-Encryption

## Overview
The `encryptkey.mq4` script is designed to securely encode account details using the Base64 encryption method. This script takes an account name and an account number as inputs, encrypts them, and outputs the encoded result. The encryption helps protect sensitive information by converting it into a format that is not easily readable.

## How It Works

### 1. Input Parameters
The script defines two external input parameters:
- `input_accountName`: A string representing the account name. The default value is "Your Account Name".
- `input_accountNumber`: An integer representing the account number. The default value is `123456`.

These parameters can be modified in the script's properties when running the script in the MetaTrader 4 platform.

### 2. Encryption Method
The script uses the Base64 encryption method, defined by the `ENUM_CRYPT_METHOD` enumeration. This method is suitable for encoding binary data into ASCII characters, making it easier to handle in text-based systems.

### 3. Key Definition
A secret key is defined within the script as a string (`keyString`). This key is essential for the encryption process and should be kept confidential. The key is converted into an array of unsigned characters (`uchar`) for use in the encryption functions.

### 4. Encoding Function
The core functionality of the script is encapsulated in the `EncodeAccountDetails` function, which performs the following steps:
- Converts the account name and account number into `uchar` arrays.
- Uses the `CryptEncode` function to encrypt both the account name and account number with the specified encryption method and key.
- Converts the encoded `uchar` arrays back into strings for output.

### 5. Main Function
The `OnStart` function serves as the entry point of the script. It:
- Calls the `EncodeAccountDetails` function with the provided account name and number.
- Prints the encoded account details to the output console.

## Usage
To use the `encryptkey.mq4` script:
1. Open the MetaEditor in MetaTrader 4.
2. Create a new script and paste the code from `encryptkey.mq4`.
3. Compile the script.
4. Attach the script to a chart in MetaTrader 4.
5. Modify the input parameters as needed in the script properties.
6. Run the script to see the encoded account details in the output.

## Important Notes
- Ensure that the encryption key (`your_secret_key`) is kept secure and not shared publicly.
- The encoded output can be used for secure storage or transmission of account details.
- Modify the script as necessary to fit your specific requirements or to implement additional encryption methods.

## Conclusion
The `encryptkey.mq4` script provides a straightforward way to encode sensitive account information using Base64 encryption. By following the instructions above, users can easily implement and utilize this script in their trading activities.
