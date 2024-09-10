table 67501 "PTE Field Configuration"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Table ID"; Integer) { DataClassification = ToBeClassified; }
        field(2; "Field ID"; Integer) { DataClassification = ToBeClassified; }
        Field(5; Type; Option)
        {
            OptionMembers = TableFilter,RecordID,OemText,Date,Time,DateFormula,Decimal,Media,MediaSet,Text,Code,Binary,BLOB,Boolean,Integer,OemCode,Option,BigInteger,Duration,GUID,DateTime;
        }
    }

    keys
    {
        key(PK; "Table ID", "Field ID") { Clustered = true; }
    }
}