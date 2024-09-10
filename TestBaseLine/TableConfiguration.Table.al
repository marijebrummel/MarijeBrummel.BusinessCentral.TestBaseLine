table 67500 "PTE Table Configuration"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Table ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Table Name"; Text[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(AllObj."Object Name" where("Object ID" = field("Table ID"), "Object Type" = const(Table)));
        }
        field(3; Type; Option)
        {
            OptionMembers = Unkonwn,Setup,Suplemental,Subsidiary,"Master Data";
        }
    }

    keys
    {
        key(PK; "Table ID") { Clustered = true; }
    }
}