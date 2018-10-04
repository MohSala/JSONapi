table 50102 ALIssue
{

    fields
    {
        field(1; id; Integer)
        {
            CaptionML = ENU = 'ID';
            AutoIncrement = true;


        }
        field(2; number; Integer)
        {
            CaptionML = ENU = 'Number';
        }
        field(3; title; text[250])
        {
            CaptionML = ENU = 'Title';
        }
        field(5; created_at; DateTime)
        {
            CaptionML = ENU = 'Created at';
        }
        field(6; user; text[50])
        {
            CaptionML = ENU = 'User';
        }
        field(7; state; text[30])
        {
            CaptionML = ENU = 'State';
        }
        field(8; html_url; text[250])
        {
            CaptionML = ENU = 'URL';
        }
        field(9; firstname; text[250])
        {
            CaptionML = ENU = 'First Name';
        }
        field(10; Name; text[250])
        {
            CaptionML = ENU = 'Name';
        }
        field(11; Email; text[250])
        {
            CaptionML = ENU = 'Email';
        }
        field(12; Address; text[250])
        {
            CaptionML = ENU = 'Address';
        }
        field(13; Phone; Code[30])
        {
            CaptionML = ENU = 'Phone';
        }
    }

    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
    }

    procedure RefreshIssues();
    var
        RefreshALIssues: Codeunit RefreshALIssueCode;
    begin
        RefreshALIssues.Refresh();
    end;

}