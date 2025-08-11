page 92734 "PTE Test Data Packages"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "PTE Test Data Package";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code) { }
                field(Description; Rec.Description) { }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Tables)
            {
                ApplicationArea = All;
                Caption = 'Test Data Tables';
                Image = Table;
                RunObject = page "Test Data Tables";
                RunPageLink = "Test Data Package Code" = field(Code);
            }
        }
        area(Processing)
        {
            action(GenerateResourceFile)
            {
                ApplicationArea = All;
                Caption = 'Generate Resource File';
                Image = Export;
                trigger OnAction()
                var
                    GenerateResourceFile: Codeunit "PTE Generate Resource File";
                begin
                    GenerateResourceFile.Run(Rec);
                end;
            }
        }
    }
}