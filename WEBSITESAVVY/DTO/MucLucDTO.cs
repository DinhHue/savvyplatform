using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Json;

namespace WEBSITESAVVY.DTO
{
    public class MucLucDTO
    {
        public string ID_Claim;
        public string ClaimType;
        public string JsonValue;

        public MucLucDTO()
        {
            ID_Claim = "";
            ClaimType = "";
            JsonValue = "";
        }


        public bool getKey(string key)
        {
            try
            {

                JsonTextParser parser = new JsonTextParser();
                JsonObject obj = parser.Parse(JsonValue);

                foreach (JsonObject field in obj as JsonObjectCollection)
                {
                    string name = field.Name;
                    string value = (string)field.GetValue();

                    if (name == key)
                    {
                        return Boolean.Parse(value);
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                return true;
            }

        }
    }
}