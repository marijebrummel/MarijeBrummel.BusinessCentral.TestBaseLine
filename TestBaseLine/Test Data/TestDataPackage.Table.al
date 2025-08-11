table 92734 "PTE Test Data Package"
{

    fields
    {
        field(1; Code; Code[20]) { }
        field(6; Description; Text[100]) { }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }
}