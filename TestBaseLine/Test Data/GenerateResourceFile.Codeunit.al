codeunit 92736 "PTE Generate Resource File"
{
    TableNo = "PTE Test Data Package";
    trigger OnRun()
    begin
        GenerateResourceFile(Rec);
    end;

    procedure GenerateResourceFile(var TestDataPackage: Record "PTE Test Data Package")
    var
        TestDataTable: Record "PTE Test Data Table";
        FileName: Text;
        JsonObj: JsonObject;
        JsonArray: JsonArray;
        TempBlob: Codeunit "Temp Blob";
        OutStream: OutStream;
        InStream: InStream;
    begin
        TestDataTable.SetRange("Test Data Package Code", TestDataPackage.Code);
        TestDataTable.FindSet();
        repeat
            JsonObj := GetTableJson(TestDataTable."Table ID");
            JsonArray.Add(JsonObj);
        until TestDataTable.Next() = 0;

        Clear(JsonObj);

        JsonObj.Add('TestData', JsonArray);
        TempBlob.CreateOutStream(OutStream);
        JsonObj.WriteTo(OutStream);

        TempBlob.CreateInStream(InStream);
        FileName := 'Filename.json';
        DownloadFromStream(InStream, '', '', '', FileName);

    end;

    var
        TempBlob: Codeunit "Temp Blob";

    local procedure GetTableJson(TableId: Integer) JsonObj: JsonObject
    var
        Fld: Record Field;
        RecRef: RecordRef;
        JsonArray: JsonArray;
    begin
        RecRef.Open(TableId);
        RecRef.FindSet();
        repeat
            Clear(JsonObj);
            Fld.SetRange(TableNo, TableId);
            Fld.SetRange(Class, Fld.Class::Normal);
            Fld.SetRange(ObsoleteState, Fld.ObsoleteState::No);
            Fld.SetRange("No.", 1, 2000000000 - 1);
            Fld.FindSet();
            repeat
                if Format(RecRef.Field(Fld."No.").Value) <> '' then begin
                    JsonObj.Add(Format(Fld."No."), Format(RecRef.Field(Fld."No.").Value));
                    JsonObj.Add('Fieldname_' + Format(Fld."No."), Fld.FieldName);
                end;
            until Fld.Next() = 0;
            JsonArray.Add(JsonObj);
        until RecRef.Next() = 0;
        Clear(JsonObj);
        JsonObj.Add(RecRef.Name, JsonArray);
    end;
}