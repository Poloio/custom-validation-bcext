codeunit 50100 Validations
{
    local procedure CheckForPlusSign(TextToVerify: Text)
    begin
        if StrPos(TextToVerify, '+') > 0 then begin
            Error('This field cannot contain a plus sign.');
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnAfterValidateEvent', 'Address', false, false)]
    local procedure OnBeforeValidationAddress(Rec: Record Customer; xRec: Record Customer)
    begin
        CheckForPlusSign(Rec.Address);
    end;
}
