
#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

/*/{Protheus.doc} M410STTS

@author Thierry
@since 16/12/2022

/*/


User Function M410STTS ()

Local aArea       := GetArea()
Local nOper       := 3

If nOper == 3  
    MsgYesNo( 'Deseja Imprimir o relatorio do pedido?', 'Relatorio' )  
Else
    
Endif

RestArea(aArea)

Return 
