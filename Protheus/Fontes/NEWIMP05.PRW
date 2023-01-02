#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

/*/{Protheus.doc} NEWFIN01

Importação de Contas a Pagar

@author Thierry Pereira
@since 27/12/2022

/*/

User Function NEWIMP05()

	Local aRet			:= {}
	Local aArea         := GetArea()

	SaveInter()

	If ParamBox({	{6,"Selecione Arquivo",PadR("",150),"",,"", 90 ,.T.,"Importação Contas a Pagar","",GETF_LOCALHARD+GETF_LOCALFLOPPY+GETF_NETWORKDRIVE}},;
			"Importação Contas a Pagar New Aço",@aRet)

		MsgRun("Lendo vendedores arquivo csv...", "Título", {|| NewCtaPaImp01( lEnd, aRet[1] ) })

	EndIf

	RestInter()

	RestArea(aArea)

Return

//--------------------------------------------------
	/*/{Protheus.doc} NewCtaPaImp01
	Importa registros e grava contas a pagar

	@author Thierry Pereira
	@since 27/12/2022

	@return
	/*/
//--------------------------------------------------

Static Function NewCtaPaImp01(lEnd, cArq)

	Local aArea       := GetArea()
	Local aCampos     := {}
	Local aDados      := {}
	Local aAuto       := {}
	Local lPrim       := .T.
	Local cLinha      := ""
	Local nTotal      := 0
	Local nTot2       := 0
	Local nNumCob     := 0
	Local nx          := 0
	Local lRet        := .T.
	Local aAI0Auto    := {}
	Local lRetorno    := .F.
	Local nConta      := 0
	Local dDtEmissao
	Local dDtVencto
	Local nLoop 

	Private lMsErroAuto     as logical
	Private lMsHelpAuto	    as logical
	Private lAutoErrNoFile  as logical
	Private aErro     := {}
	Private HrIn      := Time()
	Private HrFin
	Private aErros    := {}

	lMsErroAuto 	:= .F.
	lMsHelpAuto		:= .T.
	lAutoErrNoFile	:= .T.


	If !File(cArq)
		MsgStop("O arquivo "  + cArq + " não foi encontrado. A importação será abortada!","ATENCAO")
		Return
	EndIf

	FT_FUSE(cArq)
	FT_FGOTOP()

	nTot2 := FT_FLASTREC()

	While !FT_FEOF()

		nNumCob := nNumCob + 1

		cLinha := FT_FREADLN()

		If lPrim
			aCampos := Separa(cLinha,";",.T.)
			lPrim := .F.
		Else
			AADD(aDados,Separa(cLinha,";",.T.))
		EndIf

		FT_FSKIP()
	EndDo

	nTotal := Len(aDados)

	For nx := 1 To Len(aDados)

		//cCodigo := GetSXENum( "SE2", "E2_COD" )
		ConfirmSx8("SE2", "E2_COD")

		If empty(aDados[nx][7])
			dDtEmissao := dDataBase
		Else
			dDtEmissao := Stod(aDados[nx][7]) 
		Endif

		If empty(aDados[nx][8])
			dDtVencto := dDataBase
		Else
			dDtVencto := Stod(aDados[nx][8]) 
		Endif


		aAdd(aAuto,{'E2_PREFIXO'     ,alltrim(aDados[nx][1])                                                                  ,Nil})
		aAdd(aAuto,{'E2_NUM'         ,Alltrim(aDados[nx][2])                                                                  ,Nil})
        aAdd(aAuto,{'E2_TIPO'        ,Alltrim(aDados[nx][3])                                                                  ,Nil})
		aAdd(aAuto,{'E2_NATUREZ'     ,Alltrim(aDados[nx][4])                                                                  ,Nil})
		aAdd(aAuto,{'E2_FORNECE'     ,Alltrim(aDados[nx][5])                                                                  ,Nil})
		aAdd(aAuto,{'E2_LOJA'        ,Alltrim(aDados[nx][6])                                                                  ,Nil})
		aAdd(aAuto,{'E2_EMISSAO'     ,dDtEmissao                                                                              ,Nil})
        aAdd(aAuto,{'E2_VENCTO'      ,dDtVencto                                                                               ,Nil})
        aAdd(aAuto,{'E2_VALOR'       ,Alltrim(aDados[nx][9])                                                                  ,Nil})
        aAdd(aAuto,{'E2_HIST'        ,Alltrim(aDados[nx][10])                                                                 ,Nil})
        

		MSExecAuto({|a,b,c| FINA050(a,b,c)}, aAuto, 3, aAI0Auto)

		If lMsErroAuto

			lRet := lMsErroAuto

			If lMsErroAuto
				DisarmTransaction()
			EndIf
			
			Conout("Conta a Pagar não cadastrada!")

             aErrPCAuto	:= GETAUTOGRLOG()
            cMsgErro	:= ""

            For nLoop := 1 To Len(aErrPCAuto)
                cMsgErro += EncodeUTF8(StrTran(Alltrim(aErrPCAuto[nLoop]),CRLF,''))
            Next
            Conout(cMsgErro) 

           FWAlertError(cMsgErro, "Erro")
            
        Else

            ConfirmSx8()

            Conout("Conta a Pagar incluída com sucesso!")

            nConta ++
            
        EndIf

        aAuto := {}

    Next

	RestArea(aArea)

     FWAlertSuccess("Total de Contas a pagar inclusas: " + cValTochar(nConta) , "Contas a Pagar")

Return lRetorno
