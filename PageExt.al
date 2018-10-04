pageextension 50110 ExtendNavigationArea extends "Team Member Role Center"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(Finance)
        {
            group("Payroll")
            {
                action("API Call")
                {
                    RunObject = page "ALIssueList";
                    ApplicationArea = All;

                }
                action("Endpoint Settings")
                {
                    RunObject = page "EndPointPage";
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}