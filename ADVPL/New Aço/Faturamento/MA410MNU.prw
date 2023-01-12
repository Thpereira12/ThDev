
#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

//--------------------------------------------------
	/*/{Protheus.doc} MA410MNU
	Pergunta se deseja imprimir o reltório do pedido de venda, chamando a função U_MRSFAT01

	@author Thierry Pereira
	@since 04/01/2023

	@return
	/*/
//--------------------------------------------------

User Function MA410MNU() 
Local aArea       := GetArea()
Local aRotina     := U_MSRFAT01()
                     
		(aRotina,{"* Teste","Alert", 0 , 4, 0 , Nil})
    

RestArea(aArea)

Return 
