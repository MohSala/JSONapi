codeunit 50104 RefreshALIssueCode
{
    procedure Refresh();
    var
        ALIssue: Record ALIssue;
        HttpClient: HttpClient;
        ResponseMessage: HttpResponseMessage;
        JsonToken: JsonToken;
        JsonValue: JsonValue;
        JsonObject: JsonObject;
        JsonArray: JsonArray;
        JsonText: text;
        i: Integer;
    begin
        ALIssue.DeleteAll;

        // HttpClient.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
        if not HttpClient.Get('http://www.json-generator.com/api/json/get/bTYhxEiWeW?indent=2',
        ResponseMessage)
        then
            Error('Failed Call Service');
        if not ResponseMessage.IsSuccessStatusCode then
            Error('Web Service Returned an error:\\' + 'Status code: %1\' + 'Description %2',
            ResponseMessage.HttpStatusCode,
            ResponseMessage.ReasonPhrase);

        ResponseMessage.Content.ReadAs(JsonText);

        //Process JSON response
        if not JsonArray.ReadFrom(JsonText) then
            Error('invalid response expected a json object as root object');
        for i := 0 to JsonArray.Count - 1 do begin
            JsonArray.Get(i, JsonToken);
            JsonObject := JsonToken.AsObject;

            ALIssue.init;
            if not JsonObject.Get('age', JsonToken) then
                Error('could not find token with key %1');

            ALIssue.id := JsonToken.AsValue.AsInteger;
            ALIssue.Name := GetJsonToken(JsonObject, 'name').AsValue.AsText;
            ALIssue.Email := GetJsonToken(JsonObject, 'email').AsValue.AsText;
            ALIssue.Phone := GetJsonToken(JsonObject, 'phone').AsValue.AsCode;
            ALIssue.Address := GetJsonToken(JsonObject, 'address').AsValue.AsText;

            // Message('Test %1', GetJsonToken(JsonObject, 'latitude').AsValue.AsText);
            ALIssue.Insert;
        end;
    end;

    procedure GetJsonToken(JsonObject: JsonObject; TokenKey: text) JsonToken: JsonToken;
    begin
        if not JsonObject.Get(TokenKey, JsonToken) then
            Error('Could not find a token with key %1', TokenKey);
    end;

    procedure SelectJsonToken(JsonObject: JsonObject; Path: text) JsonToken: JsonToken;
    begin
        if not JsonObject.SelectToken(Path, JsonToken) then
            Error('could not find token with path %1', Path);
    end;
}