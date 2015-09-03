using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace WEBSITESAVVY.Util
{
    public class JSonObject
    {
        String[] keys;
        public Object[] values;
        String json;
        private Boolean isValid;

        int maxPairIndex;

        readonly static int initialPairsSlotsAmount = 10;
        readonly static int pairsSlotsAmountIncrement = 5;

        //------------------------------------------------------------------------------
        /// Public constructor
        //------------------------------------------------------------------------------
        public JSonObject()
        {
            maxPairIndex = 0;
            keys = new String[initialPairsSlotsAmount];
            values = new Object[initialPairsSlotsAmount];
            isValid = true;
        }

        //------------------------------------------------------------------------------
        /// Public constructor. Creates JSonObject from specified string
        /// @param json - input string to create JSonObject from
        //------------------------------------------------------------------------------
        public JSonObject(String json)
        {
            if (json != null)
            {
                maxPairIndex = 0;
                keys = new String[initialPairsSlotsAmount];
                values = new Object[initialPairsSlotsAmount];

                if (json.StartsWith("["))
                {
                    json = "{\"json\":" + json + "}";
                }
                this.json = json;

                isValid = IsValidJSonString(json);
                if (isValid)
                {
                    ParseJsonString(json, 0, json.Length);
                }
            }
        }

        //------------------------------------------------------------------------------
        /// Check if input string is valid json string
        ///
        /// @return True if input string is valid
        //------------------------------------------------------------------------------
        public static Boolean IsValidJSonString(String jsonString)
        {
            int cnt = 0;
            char c;
            for (int i = 0; i < jsonString.Length; i++)
            {
                c = jsonString[i];
                if (c == '{')
                    cnt++;
                else if (c == '}')
                    cnt--;
            }

            return cnt == 0;
        }

        //------------------------------------------------------------------------------
        /// Check if current JSonObject is valid
        ///
        /// @return True if current JSonObject is valid
        //------------------------------------------------------------------------------
        public Boolean IsValid()
        {
            return isValid;
        }

        //------------------------------------------------------------------------------
        /// Parses json string
        /// 
        /// @param jsonString - input string to parse
        /// @param startIndex - index to start from
        /// @param endIndex - 	end index to search to
        //------------------------------------------------------------------------------
        private void ParseJsonString(String jsonString, int startIndex, int endIndex)
        {
            int valueEndIndex;
            try
            {
                while (true)
                {
                    String key = null;
                    Object value = null;

                    key = NextKey(jsonString, startIndex, endIndex);
                    if (key == null)
                        break;

                    // "+ 1" is for " symbols
                    startIndex = jsonString.IndexOf(key, startIndex) + key.Length + 1;

                    valueEndIndex = GetValueEndIndex(jsonString, startIndex, endIndex);
                    value = ParseValue(jsonString, startIndex, valueEndIndex);
                    startIndex = valueEndIndex;

                    Put(key, value);

                    //System.out.print("Key: " + key);
                    // System.out.print(" Val: " + value + "\n");
                }
            }
            catch (Exception e)
            {
                throw (e);
            }
        }

        //------------------------------------------------------------------------------
        /// Find JSon value end index in string
        /// 
        /// @param jsonString - input string to search in
        /// @param startIndex - start index to search from
        /// @param endIndex - end index to search to
        /// 
        /// @return index of symbol in string at which value ends
        //------------------------------------------------------------------------------
        private int GetValueEndIndex(String jsonString, int startIndex, int endIndex)
        {
            char c;
            char startChar = '0';
            int cnt = 0;
            Boolean valueSymbolFound = false;

            for (int i = startIndex; i < endIndex; i++)
            {
                c = jsonString[i];

                if (c != ' ' && c != ':' && c != ',' && c != '}' && c != ']')
                    valueSymbolFound = true;

                switch (c)
                {
                    case '\\':
                        i++;
                        break;
                    case '"':
                    case '\'':
                        if (startChar == 0)
                            startChar = c;
                        else if (c == startChar)
                            return i + 1;
                        break;
                    case '{':
                    case '[':
                        if (startChar == 0 || startChar == c)
                        {
                            startChar = c;
                            cnt++;
                        }
                        break;
                    case '}':
                        if (startChar == '{')
                            cnt--;

                        if (cnt == 0 && valueSymbolFound && startChar != '"')
                            return i + 1;
                        break;
                    case ']':
                        if (startChar == '[')
                            cnt--;

                        if (cnt == 0 && valueSymbolFound && startChar != '"')
                            return i + 1;
                        break;
                    case ',':
                        if (startChar == 0 && valueSymbolFound)
                            return i + 1;
                        break;

                    default:
                        break;
                }
            }
            return -1;
        }

        //------------------------------------------------------------------------------
        /// Determines the type of value(String, another JSon, array) and parses it
        ///
        /// @param jsonString - input string to search in
        /// @param startIndex - value start index
        /// @param endIndex - value end index
        ///
        /// @return value as Object
        //------------------------------------------------------------------------------
        private Object ParseValue(String jsonString, int startIndex, int endIndex)
        {
            char c = ' ';
            int i;
            for (i = startIndex; i < endIndex; i++)
            {
                c = jsonString[i];

                //			if (c != ' ' && c != ':' && c != '"' && c != '\'' && c != ',')
                if (c != ' ' && c != ':' && c != ',')
                    break;
            }

            switch (c)
            {
                case '"':
                case '\'':
                    return NextString(jsonString, i + 1, endIndex);
                case '{':
                    return new JSonObject(jsonString.Substring(i, endIndex));
                case '[':
                    return ParseArray(jsonString, i + 1, endIndex);

                default:
                    return NextString(jsonString, i, endIndex);
            }
        }

        //------------------------------------------------------------------------------
        /// Parses Substring from startIndex to endIndex as array
        ///
        /// @param jsonString - input string to parse
        /// @param startIndex - array start index
        /// @param endIndex - array end index
        ///
        /// @return array of objects
        //------------------------------------------------------------------------------
        private Object ParseArray(String jsonString, int startIndex, int endIndex)
        {
            int valueEndIndex = startIndex;
            int valueStartIndex;
            int arraySize = -1;
            int index = 0;
            Object[] array = null;
            do
            {
                valueEndIndex = GetValueEndIndex(jsonString, valueEndIndex, endIndex);
                arraySize++;
            }
            while (valueEndIndex != -1);

            if (arraySize >= 0)
            {
                array = new Object[arraySize];
                valueStartIndex = startIndex;
                valueEndIndex = GetValueEndIndex(jsonString, startIndex, endIndex);

                while (valueEndIndex >= 0)
                {
                    array[index++] = ParseValue(jsonString, valueStartIndex, valueEndIndex);
                    valueStartIndex = valueEndIndex;
                    valueEndIndex = GetValueEndIndex(jsonString, valueEndIndex, endIndex);
                }
            }

            return array;
        }

        //------------------------------------------------------------------------------
        /// Returns next key from pair key : value
        ///
        /// @param jsonString - input string to parse
        /// @param startIndex - start index to process
        /// @param endIndex - 	end index to process
        ///
        /// @return key string
        //------------------------------------------------------------------------------
        private String NextKey(String jsonString, int startIndex, int endIndex)
        {
            return GetStringBetweenQuotes(jsonString, startIndex, endIndex);
        }

        //------------------------------------------------------------------------------
        /// Returns string between quotes
        ///
        /// @param jsonString - input string to process
        /// @param startIndex - start index to process
        /// @param endIndex - 	end index to process
        ///
        /// @return string between quotes
        //------------------------------------------------------------------------------
        private String GetStringBetweenQuotes(String jsonString, int startIndex, int endIndex)
        {
            char c;
            Boolean addChar = false;
            Boolean addSpecialChar = false;
            StringBuilder tmpSB = new StringBuilder();

            for (int i = startIndex; i < endIndex; i++)
            {
                c = jsonString[i];

                if (addSpecialChar)
                {
                    AddSpecialChar(tmpSB, c);
                    continue;
                }

                switch (c)
                {
                    case '"':
                    case '\'':
                        addChar = !addChar;

                        if (!addChar)
                            return tmpSB.ToString();
                        break;
                    case '\\':
                        addSpecialChar = true;
                        break;
                    default:
                        if (addChar)
                            tmpSB.Append(c);
                        break;
                }
            }
            return null;
        }

        //------------------------------------------------------------------------------
        /// Returns Substring from startIndex to endIndex
        ///
        /// @param jsonString - input string to process
        /// @param startIndex - start index to process
        /// @param endIndex - 	end index to process
        ///
        /// @return Substring in specified bounds
        //------------------------------------------------------------------------------
        private String NextString(String jsonString, int startIndex, int endIndex)
        {
            if (endIndex <= startIndex)
                return "";
            return jsonString.Substring(startIndex, endIndex - 1).Trim();
        }

        //------------------------------------------------------------------------------
        /// Adds special char to string buffer
        ///
        /// @param tmpSB - string buffer to add to
        /// @param c - char to add
        ///
        //------------------------------------------------------------------------------
        private void AddSpecialChar(StringBuilder tmpSB, char c)
        {
            switch (c)
            {
                case 'b':
                    tmpSB.Append('\b');
                    break;
                case 't':
                    tmpSB.Append('\t');
                    break;
                case 'n':
                    tmpSB.Append('\n');
                    break;
                case 'f':
                    tmpSB.Append('\f');
                    break;
                case 'r':
                    tmpSB.Append('\r');
                    break;
                //            case 'u':
                //            	tmpSB.Append((char)Integer.parseInt(Next(4), 16));
                //                break;
                //            case 'x' :
                //            	tmpSB.Append((char) Integer.parseInt(Next(2), 16));
                //                break;
                default:
                    tmpSB.Append(c);
                    break;
            }
        }

        //------------------------------------------------------------------------------
        /// Associates the specified value with the specified key in this JSonObject
        ///
        /// @param key - key with which the specified value is to be associated
        /// @param value - value to be associated with the specified key
        //------------------------------------------------------------------------------
        public void Put(String key, Object value)
        {
            int index = GetIndex(key);
            if (index != -1)
            {
                values[index] = value;
            }
            else
            {
                keys[maxPairIndex] = key;
                values[maxPairIndex] = value;
                maxPairIndex++;
                if (maxPairIndex == keys.Length)
                    IncreaseSlotsAmount(pairsSlotsAmountIncrement);
            }
        }

        //------------------------------------------------------------------------------
        /// Increases slot amounts to store key:value pairs
        ///
        /// @param size - amount of slots to add
        //------------------------------------------------------------------------------
        private void IncreaseSlotsAmount(int size)
        {
            String[] newKeys = new String[maxPairIndex + size];
            Object[] newValues = new Object[maxPairIndex + size];

            Array.Copy(keys, 0, newKeys, 0, maxPairIndex);
            Array.Copy(values, 0, newValues, 0, maxPairIndex);

            keys = newKeys;
            values = newValues;
        }

        //------------------------------------------------------------------------------
        /// Associates the specified value with the specified key in this JSonObject
        ///
        /// @param key - key with which the specified value is to be associated
        /// @param value - value to be associated with the specified key
        //------------------------------------------------------------------------------
        public void Put(String key, int value)
        {
            Put(key, value.ToString());
        }

        //------------------------------------------------------------------------------
        /// Associates the specified value with the specified array of values in this JSonObject
        ///
        /// @param key - key with which the specified value is to be associated
        /// @param values - array of values to be associated with the specified key
        //------------------------------------------------------------------------------
        public void Put(String key, int[] values)
        {
            String[] s = new String[values.Length];
            for (int i = 0; i < s.Length; i++)
            {
                s[i] = values[i].ToString();
            }
            Put(key, s);
        }

        //------------------------------------------------------------------------------
        /// Returns the index of specified key in "map"
        ///
        /// @param key - key to search for
        //------------------------------------------------------------------------------
        private int GetIndex(String key)
        {
            if (key == null)
                return -1;
            for (int i = 0; i < maxPairIndex; i++)
            {
                if (keys[i] == key)
                {
                    return i;
                }
            }
            return -1;
        }

        //------------------------------------------------------------------------------
        /// Returns the value with the corresponding key or null if no value is associated with this key.
        ///
        /// @param key - key to search for
        ///
        /// @return Object value
        //------------------------------------------------------------------------------
        public Object GetValue(String key)
        {

            int index = GetIndex(key);
            if (index != -1)
            {
                return values[index];
            }
            return null;
        }

        //------------------------------------------------------------------------------
        /// Returns the value with the corresponding key
        ///
        /// @param key - key to search for
        ///
        /// @return int value
        //------------------------------------------------------------------------------
        public int GetInt(String key)
        {
            Object o = GetValue(key);
            if (o == null)
                throw new Exception("Key not found: " + key);
            String valueStr = (String)o;

            if (valueStr.IndexOf('.') != -1)
                valueStr = valueStr.Substring(0, valueStr.IndexOf('.'));

            return int.Parse(valueStr);
        }

        //------------------------------------------------------------------------------
        /// Returns the array associated with the key
        ///
        /// @param key - key to search for
        ///
        /// @return int array
        //------------------------------------------------------------------------------
        public int[] GetIntArray(String key)
        {
            Object o = GetValue(key);
            if (o == null)
                throw new Exception("Key not found: " + key);
            String[] s = (String[])o;
            int[] arr = new int[s.Length];
            for (int i = 0; i < s.Length; i++)
            {
                arr[i] = int.Parse(s[i]);
            }
            return arr;
        }

        //------------------------------------------------------------------------------
        /// Returns the string associated with the key
        ///
        /// @param key - key to search for
        ///
        /// @return String value
        //------------------------------------------------------------------------------
        public String GetString(String key)
        {
            Object o = GetValue(key);
            if (o == null)
                throw new Exception("Key not found: " + key);
            return o.ToString();
        }

        //------------------------------------------------------------------------------
        /// Returns the array associated with the key
        ///
        /// @param key - key to search for
        ///
        /// @return String array
        //------------------------------------------------------------------------------
        public String[] GetStringArray(String key)
        {
            Object o = GetValue(key);
            if (o == null)
                throw new Exception("Key not found: " + key);
            Object[] s = (Object[])o;
            String[] arr = new String[s.Length];
            for (int i = 0; i < s.Length; i++)
            {
                arr[i] = (String)s[i];
            }
            return arr;
        }

        //------------------------------------------------------------------------------
        /// Returns the array associated with the key
        ///
        /// @param key - key to search for
        ///
        /// @return JSonObject array
        //------------------------------------------------------------------------------
        public JSonObject[] GetJSonArray(String key)
        {
            Object o = GetValue(key);
            if (o == null)
                throw new Exception("Key not found: " + key);

            Object[] s = (Object[])o;
            JSonObject[] arr = new JSonObject[s.Length];
            for (int i = 0; i < s.Length; i++)
            {
                arr[i] = (JSonObject)s[i];
            }
            return arr;
        }

        //------------------------------------------------------------------------------
        /// Returns the value associated with the key
        ///
        /// @param key - key to search for
        ///
        /// @return Boolean value
        //------------------------------------------------------------------------------
        public Boolean GetBoolean(String key)
        {
            Object o = GetValue(key);
            if (o == null)
                throw new Exception("Key not found: " + key);
            return ParseBoolean((String)o);
        }

        //------------------------------------------------------------------------------
        /// Parses input String as Boolean value
        ///
        /// @param s - string to parse
        ///
        /// @return true if string equals "true". Letter case is ignored.
        //------------------------------------------------------------------------------
        private Boolean ParseBoolean(String s)
        {
            return "true" == s.ToLower();
        }

        //------------------------------------------------------------------------------
        /// Returns the array associated with the key
        ///
        /// @param key - key to search for
        ///
        /// @return Boolean array
        //------------------------------------------------------------------------------
        public Boolean[] GetBooleanArray(String key)
        {
            Object o = GetValue(key);
            if (o == null)
                throw new Exception("Key not found: " + key);
            String[] s = (String[])o;
            Boolean[] arr = new Boolean[s.Length];
            for (int i = 0; i < s.Length; i++)
            {
                arr[i] = ParseBoolean(s[i]);
            }
            return arr;
        }

        //------------------------------------------------------------------------------
        /// Check if specified Object is digit
        ///
        /// @param key - key to search for
        ///
        /// @return true if Object.ToString() is digit
        //------------------------------------------------------------------------------
        private static Boolean IsDigit(Object o)
        {
            Boolean res = true;
            String str = o.ToString();
            for (int i = 0; i < str.Length; i++)
            {
                if (!Char.IsDigit(str[i]))
                {
                    res = false;
                    break;
                }
            }

            return res;
        }

        //------------------------------------------------------------------------------
        /// Appends specified object to StringBuilder taking into account JSon syntax
        ///
        /// @param sb - string buffer to Append to
        /// @param o - object buffer to Append
        //------------------------------------------------------------------------------
        private void SBAppendObject(StringBuilder sb, Object o)
        {
            Boolean AppendQuotes = (o.ToString() == o) && !IsDigit(o);

            if (AppendQuotes)
                sb.Append("\"");
            sb.Append(o);
            if (AppendQuotes)
                sb.Append("\"");
        }


        private static readonly Boolean k_isDebug = false;
        //------------------------------------------------------------------------------
        /// Creates JSon string from current JSonObject
        //------------------------------------------------------------------------------
        public String ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("{");
            if (k_isDebug)
                sb.Append("\n");
            for (int i = 0; i < maxPairIndex; i++)
            {
                SBAppendObject(sb, keys[i]);
                sb.Append(": ");
                Object o = values[i];
                if (o.GetType().IsArray)
                {
                    Object[] arr = (Object[])o;
                    sb.Append("[");
                    for (int j = 0; j < arr.Length; j++)
                    {
                        SBAppendObject(sb, arr[j]);
                        if (j < arr.Length - 1)
                            sb.Append(", ");
                    }
                    sb.Append("]");
                }
                else
                {
                    SBAppendObject(sb, o);
                }
                if (i < maxPairIndex - 1)
                    sb.Append(", ");
                if (k_isDebug)
                    sb.Append("\n");
            }
            sb.Append("}");
            return sb.ToString();
        }
    }
}