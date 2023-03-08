
#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

/*/{Protheus.doc} M410STTS

@author Thierry
@since 16/12/2022

/*/


User Function M410STTS()

Local aArea       := GetArea()
Local nOper       := 3
Local cNumero     := SC5->C5_NUM

If nOper == 3  
    MsgYesNo( 'Deseja Imprimir o relatorio do pedido?', 'Relatorio' )   
    
    mv_par01:= Cnumero         // Do Pedido                                    
    mv_par02:= cNumero         // Ate o Pedido 
    //pergunte("MTR700",)
                                      

    U_MSRFAT01()  
    
Endif

RestArea(aArea)

Return 
