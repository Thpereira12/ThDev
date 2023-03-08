#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

/*/{Protheus.doc} PRAPPI01

Importacao de produtos

@author Thierry Pereira 
@since 07/02/2023

/*/

User Function PRAPPIMP01()

    Local aRet			:= {}
	Local aArea         := GetArea()

	SaveInter()

    If ParamBox({	{6,"Selecione Arquivo",PadR("",150),"",,"", 90 ,.T.,"Importacao Produtos","",GETF_LOCALHARD+GETF_LOCALFLOPPY+GETF_NETWORKDRIVE}},;
            "Importacao Produtos Pratica PPI",@aRet)

        MsgRun("Lendo produtos arquivo csv...", "Titulo", {|| PraPrdImp01( lEnd, aRet[1] ) })

    EndIf

    RestInter()

	RestArea(aArea)

Return

//--------------------------------------------------
	/*/{Protheus.doc} PraPrdImp01
	Importa registros e grava produtos
	
    @author Thierry Pereira
    @since 07/02/2023
	 
	@return 
	/*/
//--------------------------------------------------

Static Function PraPrdImp01(lEnd, cArq)
	
	Local aArea       := GetArea()
	Local aCampos     := {}
	Local aDados      := {}
    //Local aAuto       := {}
	Local lPrim       := .T.
	Local cLinha      := ""
	Local nTotal      := 0
	Local nTot2       := 0
	Local nNumCob     := 0
	Local nx          := 0
    Local lRet        := .T.
    Local nLoop       := 0
    Local cMsgErro    := ''
    Local aErrPCAuto  := {}
    //Local aAI0Auto    := {}
    Local aProd       := {}
    Local lRetorno    := .F.
    Local nConta      := 0
	
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
		MsgStop("O arquivo "  + cArq + " nao foi encontrado. A importacao sera abortada!","ATENCAO")
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

        ConfirmSx8("SB1", "B1_COD")

        aProd :=       {{'B1_FILIAL'    ,xFilial("SB1")                                                                        ,Nil},;
                        {'B1_COD'       ,Alltrim(aDados[nx][1])                                                                ,Nil},;
                        {'B1_DESC'      ,Alltrim(aDados[nx][2])                                                                ,Nil},;
                        {'B1_MODELO'    ,Alltrim(aDados[nx][3])                                                                ,Nil},;
                        {'B1_TIPO'      ,Alltrim(aDados[nx][4])                                                                ,Nil},;
                        {'B1_UM'        ,Alltrim(aDados[nx][5])                                                                ,Nil},;
                        {'B1_POSIPI'    ,IIF(Empty(Alltrim(aDados[nx][6])), "" ,Alltrim(strtran(aDados[nx][6],'N/A','')))      ,Nil},;
                        {'B1_CONV'      ,Val(strtran(aDados[nx][8],"N/A","0"))                                                 ,Nil},;
                        {'B1_CODBAR'    ,Alltrim(strtran(aDados[nx][9],'N/A',""))                                              ,Nil},;
                        {'B1_CODGTIN'   ,Alltrim(strtran(aDados[nx][10],'N/A',""))                                             ,Nil},;
                        {'B1_ORIGEM'    ,Alltrim(strtran(aDados[nx][11],"N/A",""))                                             ,Nil},;
                        {'B1_RASTRO'    ,IIF(Empty(Alltrim(aDados[nx][12])), "N" ,Alltrim(strtran(aDados[nx][12],'N/A','N')))  ,Nil},;
                        {'B1_CODISS'    ,Alltrim(strtran(aDados[nx][13],'N/A',''))                                             ,Nil},;
                        {'B1_LOCALIZ'   ,IIF(Empty(Alltrim(aDados[nx][14])), "N" ,Alltrim(strtran(aDados[nx][14],'N/A','N')))  ,Nil},;
                        {'B1_LOCPAD'    ,IIF(Empty(Alltrim(aDados[nx][16])), "1" ,Alltrim(aDados[nx][16]))                     ,Nil}}
                        
                        //{'B1_CONTA'     ,Alltrim(strtran(aDados[nx][17],'.',''))                                              ,Nil},;
                        //{'B1_CC'        ,Alltrim(strtran(aDados[nx][18],'.',''))                                                    ,Nil}}

        MSExecAuto({|x,y| Mata010(x,y)},aProd,3)
            
        If lMsErroAuto  

            lRet := lMsErroAuto

            If lMsErroAuto
                DisarmTransaction()
            EndIf

            Conout("Produto n�o cadastrado!")

            aErrPCAuto	:= GETAUTOGRLOG()
            cMsgErro	:= ""

            For nLoop := 1 To Len(aErrPCAuto)
                cMsgErro += EncodeUTF8(StrTran(Alltrim(aErrPCAuto[nLoop]),CRLF,''))
            Next
            Conout(cMsgErro)

           FWAlertError(cMsgErro, "Erro")
            
        Else

            nConta ++

            ConfirmSx8()

            Conout("Produto incluido com sucesso!")
            
        EndIf

        aProd := {}

        lMsErroAuto := .F.

    Next

	RestArea(aArea)

    FWAlertSuccess("Total de produtos inclusos: " + cValTochar(nConta) , "Produtos")

Return lRetorno

