
#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'



/*/{Protheus.doc} FA070TIT




@author Thierry
@since 15/12/2022



/*/

User Function FA070TIT ()

Local aArea       := GetArea()
Local lRet := .T.

If MsgYesNo( 'Confirma a baixa do titulo?', 'Baixa de titulo a receber' )
    Alert(" Titulo baixado ")
Else
    lRet := .F.
Endif

RestArea(aArea)

Return lRet
