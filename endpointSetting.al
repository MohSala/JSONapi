page 50111 EndpointPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ALIssue;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(EndPoint; EndPoint)
                {
                    ApplicationArea = All;

                }
                field(Username; Username)
                {
                    ApplicationArea = All;

                }
                field(Password; Password)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            
        }
    }

    var
        myInt: Integer;
}
