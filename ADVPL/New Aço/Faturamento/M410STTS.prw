
#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

//--------------------------------------------------
	/*/{Protheus.doc} M410STTS
	Pergunta se deseja imprimir o reltório do pedido de venda, chamando a função U_MRSFAT01

	@author Thierry Pereira
	@since 27/12/2022

	@return
	/*/
//--------------------------------------------------

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
