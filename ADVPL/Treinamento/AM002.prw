
#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

//--------------------------------------------------
	/*/{Protheus.doc} Estudo de l�gica, Fatorial e For

	@author Thierry Pereira
	@since 10/01/2023

	@return
	/*/
//--------------------------------------------------

User Function CalcFator()
Local nCnt
Local nResultado := 1  //Resultado Fatorial 
Local Nfator := 5      //N�mero para o c�lculo 

// C�lculo do Fatorial 
For nCnt := Nfator to step -1
    nResultado *= nCnt
next nCnt

// Exibe o resultado na tela, atrav�s da fun��o alert 
MsgAlert("O Fatorial de " +  cValToChar(nFator) + ; // Salto de linha usando o ; 
" � " +  CValToChar(nResultado))                       // Uso de Caractere concatenado com n�mero convertido em caractere 


// Termina o programa
Return (NIL)
