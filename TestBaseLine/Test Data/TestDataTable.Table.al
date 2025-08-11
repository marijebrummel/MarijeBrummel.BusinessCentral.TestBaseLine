table 92736 "PTE Test Data Table"
{
    LookupPageId = "Test Data Tables";

    fields
    {
        field(1; "Test Data Package Code"; Code[10])
        {
            TableRelation = "PTE Test Data Package";
        }
        field(5; "Table ID"; Integer)
        {

        }
    }

    keys
    {
        key(Key1; "Test Data Package Code", "Table ID")
        {
            Clustered = true;
        }
    }
}