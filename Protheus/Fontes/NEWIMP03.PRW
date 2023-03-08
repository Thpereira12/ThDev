#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

/*/{Protheus.doc} NEWFAT03

Importação de Vendedores

@author Thierry Pereira
@since 23/12/2022

/*/

User Function NEWIMP03()

	Local aRet			:= {}
	Local aArea         := GetArea()

	SaveInter()

	If ParamBox({	{6,"Selecione Arquivo",PadR("",150),"",,"", 90 ,.T.,"Importação vendedores","",GETF_LOCALHARD+GETF_LOCALFLOPPY+GETF_NETWORKDRIVE}},;
			"Importação Vendedores New Aço",@aRet)

		MsgRun("Lendo vendedores arquivo csv...", "Título", {|| NewVenImp01( lEnd, aRet[1] ) })

	EndIf

	RestInter()

	RestArea(aArea)

Return

//--------------------------------------------------
	/*/{Protheus.doc} NewVenImp01
	Importa registros e grava vendedores

	@author Thierry Pereira
	@since 23/12/2022

	@return
	/*/
//--------------------------------------------------

Static Function NewVenImp01(lEnd, cArq)

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

		cCodigo := GetSXENum( "SA3", "A3_COD" )
		ConfirmSx8("SA3", "A3_COD")

		If empty(aDados[nx][5])
			dDtEmissao := dDataBase
		Else
			dDtEmissao := Stod(aDados[nx][5]) 
		Endif

		aAdd(aAuto,{'A3_COD'     ,aDados[nx][1]                                                                               ,Nil})
		aAdd(aAuto,{'A3_FILIAL'  ,xFilial("SA3")                                                                              ,Nil})
		aAdd(aAuto,{'A3_NOME'    ,Alltrim(aDados[nx][2])                                                                      ,Nil})
        aAdd(aAuto,{'A3_CGC'     ,Alltrim(aDados[nx][3])                                                                      ,Nil})
		aAdd(aAuto,{'A3_END'     ,Alltrim(aDados[nx][4])                                                                      ,Nil})
		aAdd(aAuto,{'A3_ADMISS'  ,dDtEmissao                                                                                  ,Nil})
		aAdd(aAuto,{'A3_CEP'     ,Alltrim(aDados[nx][6])                                                                      ,Nil})
		aAdd(aAuto,{'A3_MUN'     ,Alltrim(aDados[nx][7])                                                                      ,Nil})
		aAdd(aAuto,{'A3_DDDTEL'  ,Alltrim(aDados[nx][8])                                                                      ,Nil})
        aAdd(aAuto,{'A3_TEL'     ,Alltrim(aDados[nx][9])                                                                      ,Nil})
        aAdd(aAuto,{'A3_FAX'     ,Alltrim(aDados[nx][10])                                                                     ,Nil})
        aAdd(aAuto,{'A3_EST'     ,Alltrim(aDados[nx][11])                                                                     ,Nil})
        aAdd(aAuto,{'A3_EMAIL'   ,Alltrim(aDados[nx][12])                                                                     ,Nil})
        aAdd(aAuto,{'A3_CEL'     ,Alltrim(aDados[nx][13])                                                                     ,Nil})
        aAdd(aAuto,{'A3_BAIRRO'  ,Alltrim(aDados[nx][14])                                                                     ,Nil})
        aAdd(aAuto,{'A3_ZZOBS'   ,aDados[nx][15]                                                                              ,Nil})
		
		/*Alltrim pula as linhas para identar os caracteres;
		Val para valores numéricos que serão usados para cálculos;
		*/
		MSExecAuto({|a,b,c| MATA040(a,b,c)}, aAuto, 3, aAI0Auto)

		If lMsErroAuto

			lRet := lMsErroAuto

			If lMsErroAuto
				DisarmTransaction()
			EndIf

			Conout("Vendedor não cadastrado!")

            aErrPCAuto	:= GETAUTOGRLOG()
            cMsgErro	:= ""

            For nLoop := 1 To Len(aErrPCAuto)
                cMsgErro += EncodeUTF8(StrTran(Alltrim(aErrPCAuto[nLoop]),CRLF,''))
            Next
            Conout(cMsgErro)

           FWAlertError(cMsgErro, "Erro")
            
        Else

            ConfirmSx8()

            Conout("Vendedor incluído com sucesso!")

            nConta ++
            
        EndIf

        aAuto := {}

    Next

	RestArea(aArea)

     FWAlertSuccess("Total de vendedores inclusos: " + cValTochar(nConta) , "Vendedores")

Return lRetorno
