
/*******************************************************************
 *                                                                 *
 *   Basico.asp  -  Fun??es B?sicas em JavaScript para uso Geral   *
 *                                                                 *
 *                  V1.5  -  Jan/2000                              *
 *                                                                 *
 *******************************************************************/

/*-----------------------------------------------------------------*
 | ContidoNoDominio    Retorna True se a String dada s? contiver   |
 |                     caracteres do dom?nio dado                  |
 *-----------------------------------------------------------------*/
function ContidoNoDominio(StrDado, Dominio)
	{
	var i, j;
	
	if (StrDado == "") return false;
	
	for (i=0; i<StrDado.length; i++)
		{
		for (j=0; j<Dominio.length; j++)
			{
			if (StrDado.substr(i,1) == Dominio.substr(j,1)) break;
			}
		if (j >= Dominio.length) return false;
		}
	return true
	}
			
/*-----------------------------------------------------------------*
 | ContemDominio    Retorna True se a String dada contiver algum   |
 |                  caractere do dom?nio dado                      |
 *-----------------------------------------------------------------*/
function ContemDominio(StrDado, Dominio)
	{
	var i, j;
	
	if (StrDado != "")
		{
		for (i=0; i<StrDado.length; i++)
			{
			for (j=0; j<Dominio.length; j++)
				{
				if (StrDado.substr(i,1) == Dominio.substr(j,1)) return true;
				}
			}
		}
		
	return false;
	}
			
/*-----------------------------------------------------------------*
 | IsStrNum     Retorna True se a String dada s? contiver n?meros  |
 |                                                                 |
 *-----------------------------------------------------------------*/
function IsStrNum(Dado)
	{
	return ContidoNoDominio(Dado, " 0123456789");
	}
	
/*-----------------------------------------------------------------*
 | IsStrInt	    Retorna True se a String dada s? contiver          |
 |              Caracteres para N?mero inteiro                     |
 *-----------------------------------------------------------------*/
function IsStrInt(Dado)
	{
	return ContidoNoDominio(Dado, " +-0123456789");
	}
			
/*-----------------------------------------------------------------*
 | IsStrFloat   Retorna True se a String dada s? contiver          |
 |              Caracteres para N?mero em Ponto-Flutuante          |
 *-----------------------------------------------------------------*/
function IsStrFloat(Dado)
	{
	return ContidoNoDominio(Dado, " +-0123456789Ee,.");
	}

/*-----------------------------------------------------------------*
 | IsStrCurr    Retorna True se a String dada s? contiver          |
 |              Caracteres para N?mero Currency                    |
 *-----------------------------------------------------------------*/
function IsStrCurr(Dado)
	{
	return ContidoNoDominio(Dado, " +-0123456789,.");
	}

/*-----------------------------------------------------------------*
 | IsStrData    Retorna True se a String dada for uma data v?lida  |
 |              no formato DD/MM/AAAA                              |
 *-----------------------------------------------------------------*/
function IsStrData(Dado)
	{
    var DiasMes = new Array(31,29,31,30,31,30,31,31,30,31,30,31);
    var Dia, Mes, Ano;
    var Result = false;

	// Pr?-analisa o String:
	if (Dado != "")
		{
		if ((Dado.length == 10) && (Dado.substr(2,1) == "/") && (Dado.substr(5,1) == "/"))
			{
			// Levanta Campos:
			if (IsStrNum(Dado.substr(0,2))) Dia = Dado.substr(0,2);
			if (IsStrNum(Dado.substr(3,2))) Mes = Dado.substr(3,2);
			if (IsStrNum(Dado.substr(6,4))) Ano = Dado.substr(6,4);

			// Analisa Ano e M?s:
			if ((Ano > 0) && (Mes >= 1) && (Mes <= 12))
				{
				// Analisa Dia:
				if ((Dia >= 1) && (Dia <= DiasMes[Mes - 1]))
					{
					// Analisa os casos n?o-bissextos:
					if ((Mes == 2) && ((Ano%4 != 0) || (Ano%100 == 0) && (Ano%400 != 0)))
						{
						if (Dia <= 28) Result = true;
						}
					else
						{
						Result = true;
						}
					}
				}
			}
		}		
	return Result;
	}	

/*-----------------------------------------------------------------*
 | IsStrHora    Retorna True se a String dada for uma data v?lida  |
 |              no formato HH:MM ou HH:MM:SS                       |
 *-----------------------------------------------------------------*/
 function IsStrHora(Dado)
	{
    var Hor, Min, Seg;
    var Result = false;

	// Pr?-analisa o String:
	if (Dado != "")
		{
		if (((Dado.length == 5) || (Dado.length == 8)) && (Dado.substr(2,1) == ":"))
			{
			// Levanta Campos:
			if (IsStrNum(Dado.substr(0,2))) Hor = Dado.substr(0,2); else Hor = -1;
			if (IsStrNum(Dado.substr(3,2))) Min = Dado.substr(3,2); else Min = -1;

			// Analisa a Hora:
			if ((Hor >= 0) && (Hor <= 23))
				{
				// Analisa o Minuto:
				if ((Min >= 0) && (Min <= 59))
					{
					// Verifica se tem segundo:
					if (Dado.length == 8)
						{
						// Pr?-analisa:
						if (Dado.substr(5,1) == ":")
							{
							// Levanta e verifica segundos:
							if (IsStrNum(Dado.substr(6,2))) Seg = Dado.substr(6,2); else Seg = -1;
							if ((Seg >= 0) && (Seg <= 59))
								{
								Result = true;
								}
							}
						}
					else
						{
						Result = true;
						}				
					}
				}
			}
		}
		//alert("ressultado " + Result );
	return Result;
	}

/*-----------------------------------------------------------------*
 | SeparaNomeArq       Separa o Nome de Arquivo do Path completo   |
 |                                                                 |
 *-----------------------------------------------------------------*/
function SeparaNomeArq(PathDado)
	{
	var i
	
	if (PathDado.length == 0) return "";
	
	for (i=PathDado.length-1; i>=0; i--)
		{
		if (PathDado.substr(i,1) == "\\" || PathDado.substr(i,1) == ":")
			{
			return PathDado.substr(i + 1);
			}
		}
	return PathDado;				
	}

/*-----------------------------------------------------------------*
 | replaceAll  	pega todas as String e muda para o que desejar 	   |
 |                                                                 |
 *-----------------------------------------------------------------*/

function replaceAll(texto, valorAntes, valorDepois){
	var idx = texto.indexOf(valorAntes);
    	while(idx > -1){
        	texto = texto.replace(valorAntes, valorDepois);
            idx = texto.indexOf(valorAntes);
        }
        
	return texto;
}


/*-----------------------------------------------------------------*
 | StrD      Acerta a String na Largura dada com                   |
 |           Alinhamento ? Direita:                                |
 *-----------------------------------------------------------------*/
function StrD(Dado, Larg)
	{    
    var Result;
	var i;

    if (Dado.length >= Larg)             
        {
        Result = Dado.substr(Dado.length - Larg,Larg);             
		}
    else
		{
		Result = "";
		for (i=Larg-Dado.length; i>0; i--)
			{
			Result = Result + " ";
			}
        Result = Result + Dado;
		}
	return Result;
	}

/*-----------------------------------------------------------------*
 | StrE      Acerta a String na Largura dada com                   |
 |           Alinhamento ? Esquerda:                               |
 *-----------------------------------------------------------------*/
function StrE(Dado, Larg)
	{    
    var Result;
	var i;

    if (Dado.length >= Larg)             
        {
        Result = Dado.substr(0,Larg);             
		}
    else
		{
		Result = Dado;
		for (i=Larg-Dado.length; i>0; i--)
			{
			Result = Result + " ";
			}
		}
	return Result;
	}

/*-----------------------------------------------------------------*
 | StrNum    Retorna o valor Num?rico em String Dado,              |
 |           formatado na Largura dada:                            |
 *-----------------------------------------------------------------*/
function StrNum(Dado, Larg)
  {
  var Result, sDado, i;

  sDado = Dado.toString();
  if (sDado.length >= Larg)       
    {
    Result = sDado.substr(sDado.length - Larg,Larg);       
    }
  else
    {
    Result = "";
    for (i=Larg-sDado.length; i>0; i--)
      {
      Result = Result + "0";
      }
    Result = Result + sDado.toString();
    }
  return Result;
  }

/*-----------------------------------------------------------------*
 | PassaDominio        Retorna a String dada, somente com os       |
 |                     caracteres do dom?nio dado                  |
 *-----------------------------------------------------------------*/
function PassaDominio(StrDado, Dominio)
	{
	var i, j, c;
	var Result;
	
	Result = "";
	for (i=0; i<StrDado.length; i++)
		{
		c = StrDado.substr(i,1);
		for (j=0; j<Dominio.length; j++)
			{
			if (c == Dominio.substr(j,1)) break;
			}
		if (j < Dominio.length)
			{
			Result = Result + c;
			}
		}
	return Result;
}

			
/*-----------------------------------------------------------------*
 | BloqueiaDominio     Retorna a String dada retirando os          |
 |                     caracteres do dom?nio dado                  |
 *-----------------------------------------------------------------*/
function BloqueiaDominio(StrDado, Dominio)
	{
	var i, j;
	
	Result = "";
	for (i=0; i<StrDado.length; i++)
		{
		c = StrDado.substr(i,1);
		for (j=0; j<Dominio.length; j++)
			{
			if (c == Dominio.substr(j,1)) break;
			}
		if (j >= Dominio.length)
			{
			Result = Result + c;
			}
		}
	return Result;
	}

/*******************************************************************
 *  Fun??es de Filtro para uso com Text-Boxes:                     *
 *  Utilize-as sob os eventos OnKeyUp e OnChange simultaneamente.  *
 *******************************************************************/

function FiltroNum(Objeto)
	{
	Objeto.value = PassaDominio(Objeto.value, "0123456789");
	}
	
function FiltroInt(Objeto)
	{
	Objeto.value = PassaDominio(Objeto.value, "0123456789+-");
	}
			
function FiltroCurr(Objeto)
	{
	Objeto.value = PassaDominio(Objeto.value, "0123456789+-,.");
	}

function FiltroFloat(Objeto)
	{
	Objeto.value = PassaDominio(Objeto.value, "0123456789+-Ee,.");
	}

function FiltroData(Objeto)
	{
	Objeto.value = PassaDominio(Objeto.value, "0123456789/");
	}

function FiltroHora(Objeto)
	{
	Objeto.value = PassaDominio(Objeto.value, "0123456789:");
	}

function FiltroUp(Objeto)
	{
	Objeto.value = Objeto.value.toUpperCase();
	}



//limita tamanho para textarea
//-----------------------------------------------------------------------
function fMaxTamCampo(TamMax,ValCampo)
{	
	Campo = ValCampo.value
	TamanhoCampo = Campo.length
	if (TamanhoCampo > TamMax)
		{ 	
		ValorCampo = Campo.substring(0,TamMax)	
		ValCampo.value = ValorCampo		
		alert("O limite m?ximo do campo ? de " +TamMax+ " caracteres.")
	}	
}
//-----------------------------------------------------------------------


function ValidaEMail(EMail)
  {
  if (EMail.indexOf("@") < 0) return false;
  if (EMail.indexOf(".") < 0) return false;
  if (ContemDominio(EMail, " ;,:/$!#%^&*()+[]{}|\\~`'\"")) return false;
  return true;
  }

/*-----------------------------------------------------------------*
 | isNumber		  Retorna True se o String dada for um n?mero      |
 |                com casas decimais dadas.                        |
 *-----------------------------------------------------------------*/
function isNumber(sNumero, iDecimais)
  {
  var bRet
  var i
  bRet = true
  if (iDecimais > 0)
    {
    if (sNumero.length < iDecimais + 2 || (sNumero.indexOf(".", 0) == -1 && sNumero.indexOf(",", 0) == -1))
      bRet = false
    }
  if (bRet)
    {
    i = 0
    while(i < sNumero.length && bRet)
      {
      if (iDecimais > 0)
        {
        if (i == sNumero.length - (iDecimais + 1))
          {
          if (sNumero.charAt(i) != "." && sNumero.charAt(i) != ",")
            bRet = false
          }
        else
          {
          if (sNumero.charAt(i) < "0" || sNumero.charAt(i) > "9")
            bRet = false
          }
        }
      else
        {
        if (sNumero.charAt(i) < "0" || sNumero.charAt(i) > "9")
          bRet = false
        }
      i++
      }
    }
  return bRet
  }

/*
 Nome........: FmtData
 Descricao...: Insere a m?scara de data no campo
 Paramentros.: Dado
 Retorno.....: Retorna o conte?do formatado em dd/mm/yyyy, n?o permitindo a digita??o
               de caracteres alfa 
*/

function FmtData_old(Dado)
  {
   	var Result = Dado;

	 	for (i=1; i<=Dado.length; i++)
		{			
			if (i == 2)
			{	
				Result = Dado.substr(0, 2) + "/" + Dado.substr(2, i);
			}
			if (i >= 4)
			{
				Result = Dado.substr(0, 2) + "/" + Dado.substr(2, 2) + "/" + Dado.substr(4, 4);
			}
		}
   return Result;
  }

function FmtData(Dado)
  {
  var Result = Dado;
  var l = Dado.length;

  if((l > 2) && (l < 5))
    {
	Result = Dado.substr(0, 2) + "/" + Dado.substr(2, 2);
    }
  if(l >= 5)
    {
	Result = Dado.substr(0, 2) + "/" + Dado.substr(2, 2) + "/" + Dado.substr(4, 4);
	}
  return Result;
  }


/*
 Nome........: FmtDataMesAno
 Descricao...: Insere a m?scara de data no campo
 Paramentros.: Dado
 Retorno.....: Retorna o conte?do formatado em mm/yyyy, n?o permitindo a digita??o
               de caracteres alfa 
*/
function FmtDataMesAno(Dado)
  {
   	var Result = Dado;

	 	for (i=1; i<=Dado.length; i++)
		{			
			if (i == 2)
			{	
				Result = Dado.substr(0, 2) + "/" + Dado.substr(2, i);
			}
			if (i > 2)
			{
				Result = Dado.substr(0, 2) + "/" + Dado.substr(2, 4);
			}
		}
   return Result;
  }
  
  /*
 Nome........: FmtHora
 Descricao...: Insere a m?scara de hora no campo
 Paramentros.: Dado
 Retorno.....: Retorna o conte?do formatado em hh:mm, n?o permitindo a digita??o
               de caracteres alfa 
*/

function FmtHora(Dado)
  {
   	var Result = Dado;

	 	for (i = 1; i <= Dado.length; i++)
		{

			if (i >= 3)
			{
				Result = Dado.substr(0, 2) + ":" + Dado.substr(2, 2);
			}
		}
   return Result;
  }
  
var bPula = true; 
  
function fAtuPulaBlur()
{
	bPula = false;	
}
function fAtuPulaKeyPress()
{
	bPula = true;
	return;
}


function fPulaCampo(campo1,campo2,iTam,tpcampo)
	{
		if(bPula)
		{
			
			if (tpcampo == "data")
				{
			    	Filtro(campo1,'data');
				}
				if (tpcampo == "hora")
				{
			    	Filtro(campo1,'hora');
				}
			if (campo1.value.length >= iTam)
			{ 
				campo2.focus(); 
			}
				
		}
		
		return;
		
	}


/*-----------------------------------------------------------------*
 | CalculaDigitoMod11(Dado, NumDig, LimMult)					   |
 |    Retorna o(s) NumDig D?gitos de Controle M?dulo 11 do	   	   |
 |	  Dado, limitando o Valor de Multiplica??o em LimMult:         |
 |		    													   |
 |		    N?meros Comuns::   			iDigSaida	 iCod          |
 |			  CGC					  	  2			   9		   |
 |   		  CPF					  	  2			  12		   |
 |			  C/C,Age - CAIXA			  1 		   9           |
 |			  habita??o/bloqueto		  1 		   9           |
 *-----------------------------------------------------------------*/
function CalculaDigitoMod11(Dado, NumDig, LimMult)
  {
  var Mult, Soma, i, n;
    
  for(n=1; n<=NumDig; n++)
    {
    Soma = 0;
    Mult = 2;
    for(i=Dado.length-1; i>=0; i--)
      {
      Soma += (Mult * parseInt(Dado.charAt(i)));
      if(++Mult > LimMult) Mult = 2;
      }
    Dado += ((Soma * 10) % 11) % 10;
    }
  return Dado.substr(Dado.length-NumDig, NumDig);
  }

function CalculaDigitoMod10(sValor)
{
 mult = 2
 soma = 0
 str = new String()
 sValor = sZapDummy(sValor)

 for (t=sValor.length;t>=1;t--)
 {
 str = (mult*parseInt(sMid(sValor,t,1))) + str
 mult--
 if (mult<1) mult = 2
 }

 for (t=1;t<=str.length;t++)
 soma = soma + parseInt(sMid(str,t,1))
 soma = soma % 10
 if (soma != 0)
   soma = 10 - soma
 str = soma   //casting
 return str
}


function Mod10(valor)
{
  val = valor.substring( 0 , valor.length - 1 )
  dig = valor.substring( valor.length - 1 , valor.length )
  str = new String
  fator = 2
  soma = 0
  for(i = val.length; i > 0; i--)
  {
  str = fator * parseInt(val.substring(i, i - 1)) + str
  fator--
  if(fator < 1) fator = 2
  }
  for(i = 0; i < str.length; i++) soma = soma + parseInt(str.charAt(i))
  soma = soma % 10
  if(soma != 0) soma = 10 - soma
  str = soma //aqui existe uma esp?cie de "casting" (convers?o)
  return str == dig
}



function isBissexto(iAno)
{
  var bRet
  bRet = false
  if (iAno % 4 == 0 && (iAno % 100 !=0 || iAno % 400 ==0 ))
    bRet = true
  return bRet
}


function isDate(sData)
{
  var bRet
  var i
  bRet = true
  if (sData.length != 10)
    bRet = false
  if (bRet)
  {
    i = 0
    while (i < sData.length && bRet)
    {
      if (i == 2 || i == 5)
      {
        if (sData.charAt(i) != "/")
          bRet = false
      }
      else
      {
        if (!isNumber(sData.charAt(i), 0))
          bRet = false
      }
      i++
    }
  }
  if (bRet)
  {
    iDia = parseInt(sData.substring(0, 2), 10)
    iMes = parseInt(sData.substring(3, 5), 10)
    iAno = parseInt(sData.substring(6, 10), 10)
    if (iMes < 1 || iMes > 12)
      bRet = false
    if (iAno < 1)
      bRet = false
  }
  if (bRet)
  {
    if (iMes == 1 || iMes == 3 || iMes == 5 || iMes == 7 || iMes == 8 || iMes == 10 || iMes == 12)
    {
      if (iDia < 1 || iDia > 31)
        bRet = false
    }
    if (iMes == 2)
    {
      if (isBissexto(iAno))
      {
        if (iDia < 1 || iDia > 29)
          bRet = false
      }
      else
      {
        if (iDia < 1 || iDia > 28)
          bRet = false
      }
    }
    if (iMes == 4 || iMes == 6 || iMes == 9 || iMes == 11)
    {
      if (iDia < 1 || iDia > 30)
        bRet = false
    }
  }
  return bRet
}

function isDateMes(sData)
{
  var bRet
  var i
  bRet = true
  if (sData.length != 7)
      bRet = false
  if (bRet)  {
    i = 0
    while (i < sData.length && bRet)  {
      if (i == 2 ){
        if (sData.charAt(i) != "/")
          bRet = false
      } else  {
        if (!isNumber(sData.charAt(i), 0)){
          bRet = false
        }  
      }
      i++
    }
  }
  if (bRet)  {
  
    //iDia = parseInt(sData.substring(0, 2), 10)
    iMes = parseInt(sData.substring(0,2), 10)
    iAno = parseInt(sData.substring(3,7), 10)
    
    if (iMes < 01 || iMes > 12)
      bRet = false
    if (iAno < 1)
      bRet = false
  }
  if (bRet)
  {
    if (iMes == 1 || iMes == 3 || iMes == 5 || iMes == 7 || iMes == 8 || iMes == 10 || iMes == 12)
    {
      //if (iDia < 1 || iDia > 31)
        //bRet = false
    }
    if (iMes == 2)
    {
      if (isBissexto(iAno))
      {
        //if (iDia < 1 || iDia > 29)
          //bRet = false
      }
      else
      {
        //if (iDia < 1 || iDia > 28)
          //bRet = false
      }
    }
    if (iMes == 4 || iMes == 6 || iMes == 9 || iMes == 11)
    {
      //if (iDia < 1 || iDia > 30)
        //bRet = false
    }
  }
  return bRet
}


function sRight(sExpressao,iNumeros)
{
  if (sExpressao.length >= iNumeros ) return sExpressao.substring(sExpressao.length - iNumeros,sExpressao.length)
}

function sLeft(sExpressao,iNumeros)
{
  if (sExpressao.length >= iNumeros ) return sExpressao.substring(0,iNumeros)
}

function sMid(sExpressao,iNumeros,iTamanho)
{
  var aux = new String()
  if ((sExpressao.length >= iNumeros) && (iNumeros >=0) && (iTamanho > 0))
  {
    iNumeros--
    aux = sExpressao.substring(iNumeros,iNumeros+iTamanho)
  }
    return aux
}

function sZapDummy(sStringNum)
{
  var sAux = new String()
  for (t=1;t<=sStringNum.length;t++)
  if (!isNaN(parseInt(sMid(sStringNum,t,1))))
    sAux = sAux + sMid(sStringNum,t,1)
  return sAux
}

function Filtro(Objeto,tpCampo) {
    if (navigator.appName.substr(0,9) != "Microsoft") {
        return;
    }

    if (window.event.keyCode == 37 || window.event.keyCode == 8
            || window.event.keyCode == 36 || window.event.keyCode == 46
            || window.event.keyCode == 16 || window.event.keyCode == 9)
        return;

    if (window.event.keyCode == 111 || window.event.keyCode == 191) {
	    if (tpCampo == "data") {
		    if (Objeto.value.length == 3 || Objeto.value.length == 6) {
			    return;
		    }
		    if (Objeto.value.length == 4 || Objeto.value.length == 7) {
			    var newpos = Objeto.value.length - 1;
			    Objeto.value = Objeto.value.substring(0,newpos);
			    return;
		    }
	    }
    }

    if (window.event.keyCode == 39) {
	    if (tpCampo == "data") {
            if (Objeto.value.length == 2 || Objeto.value.length == 5) {
			    Objeto.value = Objeto.value + "/";
            }
        }
        return;
    }

	if (tpCampo == "orgaoEmissor") {
    	Objeto.value = PassaDominio(Objeto.value, "0123456789ABCDEFGHIJLMNOPQRSTUVXZabcdefghijlmnopqrstuvxz");
		Objeto.value = FmtLacre(Objeto.value);
		return;
	}

	Objeto.value = PassaDominio(Objeto.value, "0123456789");
	if (tpCampo == "data") {
		Objeto.value = FmtData(Objeto.value);
	}
	if (tpCampo == "DataMesAno") {
		Objeto.value = FmtDataMesAno(Objeto.value);
	}
	if (tpCampo == "valor") {	
		Objeto.value = FmtCurr(Objeto.value);
	}
	if (tpCampo == "hora") {	
		Objeto.value = FmtHora(Objeto.value);
	}
	if (tpCampo == "lacre") {	
		Objeto.value = FmtLacre(Objeto.value);
	}
}

function FmtLacre(Dado)
{
	var Result, i;

	Dado = TiraTracos(Dado);

	if (Dado.length > 2)
	{
		Result = "-" + Dado.substr(Dado.length-2, 2);
		Result = Dado.substr(0, Dado.length-2) + Result;
	}
	else
	{
		Result = Dado;
	}
	return Result;
}
  
function FmtCurr(Dado)
  {
  var Result, i;
  
  if (Dado.length > 2)
    {
    Result = "," + Dado.substr(Dado.length-2, 2);
    for (i=5; i<=Dado.length; i+=3)
      {
      Result = Dado.substr(Dado.length-i, 3) + Result;
      if (Dado.length > i) Result = "." + Result;
      }
    Result = Dado.substr(0, Dado.length-i+3) + Result;
    }
  else
    {
    Result = Dado;
    }
  return Result;
}

function TiraPontos (NumeroFormatado)
{
    var s
    s  = NumeroFormatado.split (".");
    return s.join("");
}

function TiraVirgula (NumeroFormatado)
{
    var s
    s  = NumeroFormatado.split (",");
    return s.join("");
}

function TiraTracos (NumeroFormatado)
{
    var s
    s  = NumeroFormatado.split ("-");
    return s.join("");
}

function printit()
{  
	window.print();
}

function FiltraTexto(Dado) {
	var r = ''
	var asc1 = new String()
	var asc2 = new String()
	asc1 = '??????????????????????????????????????????????????'
	asc2 = 'AAAAAAAAAAEEEEEEEEIIIIIIIIOOOOOOOOOOUUUUUUUUYYCCNN'
	for(i=0;i<=Dado.length-1;i++)
	    {
		c = Dado.charAt(i)
		for(j=0;j<=asc1.length-1;j++)
		if(Dado.charAt(i) == asc1.charAt(j))
			c = asc2.charAt(j)
			if((c<'0' || c>'9') && (c<'A' || c>'Z') && (c<'a' || c>'z') && (c != ' ') && (c != ',') && (c != '.') && (c != '/'))
			{
			return "";
			}
			r = r + c
		}
	return r.toUpperCase();
}

/* --------------------------------------------------------
	Nome: gfunCalcCEI
	Descricao: Verifica se o nro do CEI eh valido
	Parametros: Numero do CEI sem Formatacao
-------------------------------------------------------- */ 

function gfunCalcCEI(strCei) 
{
	var numLen;
	var strChar;
	var numSomat;
	var strAux;
	var strCharAux;
	var strSomat;
	var numLenumSomat;
	var numAux;
	var numDigit;

	numLen = strCei.length;

	//Verifica se o tamanho do CEI eh de 12 posicoes
	if	(numLen != 12) 
	{
		return false;
	}

	// Calcula o digito verificador
	strAux = "74185216374"
	numSomat = 0;
	for (i = 0; i < 11; i++) 
	{
		strChar = strCei.charAt(i)
		strCharAux = strAux.charAt(i)
		numSomat += (eval(strChar)) * (eval(strCharAux));
	}
	strSomat = numSomat + "";
	numLenumSomat = strSomat.length;
	numAux = parseInt(strSomat.charAt(numLenumSomat - 1)) + parseInt(strSomat.charAt(numLenumSomat - 2));
	
	if	((numAux >= 11) && (numAux <= 18))
		numDigit = 20 - numAux;
	else
		if	(numAux == 10)
			numDigit = 1;
		else
			numDigit = 10 - numAux;
	
	if (numDigit == 10) 
	{
	   numDigit = 1
	}

	//	Condicao para atender ao SFG. Aceitar o digito informado (0 ou 1), mesmo que o
	//	resultado do calculo seja igual a 1
	
	if ((strCei.charAt(11) < "2")) 
	{
	 if ((numDigit == 0) || (numDigit == 1)) 
	 {
		numDigit = eval(strCei.charAt(11));
		return true;
	 }
	}
	
	// Fim-condicao
	if	(eval(strCei.charAt(11)) != numDigit) 
	{
		return false;
	}

	return true;
}

/*--------------------------------------------
'nome...: Recarrega combo com valor informado
----------------------------------------------*/
function recCombo(campo,valor)
{
	for (i=0;i < eval(campo + '.options.length') ;i++)
	{
		if (eval(campo + '[i].value') == valor)
		{
			eval(campo + '.options[i].selected = true');
			break;
		}
	}
	return;
}

/*-----------------------------------------------------------------*
'nome...: RTRIM
 *-----------------------------------------------------------------*/
function RTrim(StrDado) {
    TemEspaco = true;

    sCampo = StrDado
	if (sCampo != "") {
        while (TemEspaco) {

            if (sCampo.substr(sCampo.length - 1,1) == ' ') {
                sCampo = sCampo.substr(0,sCampo.length - 1);
            }
            else {
                TemEspaco = false;
            }
        }
    }
	return sCampo;
}

var iTimerOtico;
var oldServOtico;
function SaibaMaisOtico() {
    oldServOtico = document.FormMenu.serv.value;
    document.FormMenu.serv.value = "LeituraOptica";
    TelaAjuda();
    iTimerOtico = window.setTimeout("atualizaSaibaMais()", 2000);
    document.FormMenu.serv.value = oldServOtico;
}

function atualizaSaibaMais() {
    document.FormMenu.serv.value = oldServOtico;
    window.clearTimeout(iTimerOtico);
}

function fPulaCampoOtico(nomeform,campo1,campo2,tam,tpcampo) {
    if (!eval('document.' + nomeform + '.chkLeitorOptico.checked')) {
        campo1 = eval('document.' + nomeform + '.' + campo1);
        campo2 = eval('document.' + nomeform + '.' + campo2);
        fPulaCampo(campo1,campo2,tam,tpcampo);
    }
    return;
}

function verificaAgend(nomeForm,dataAgend) {
    if (dataAgend != "") {
        nomeForm.rdoAgendamento[1].checked = true;
    }
}

function alteraAgend(nomeForm, dataAgend) {
    if (nomeForm.rdoAgendamento[1].checked) {
        dataAgend.disabled = false;
        dataAgend.focus();
    } else {
        dataAgend.value = "";
        dataAgend.disabled = true;
    }
}

function verificaBrowserImpressao() {
    if (navigator.appName.substr(0,9) != "Microsoft") {
	    window.print();
	    history.back();
    }
}

function imprimeDireto(nomeForm, uri) {
	if (navigator.appName.substr(0,9) == "Microsoft") {
		printHidden(uri);
    } else {
	    nomeForm.action=uri;
		nomeForm.submit();
	}
}

function imprimeTeste(nomeForm, uri) {
    nomeForm.action=uri;
	nomeForm.submit();
}

function focoProximoElemento(nomeForm, nomeCampo) {    
    for (i = 0; i < nomeForm.length-1; i++) {        
        if (nomeForm.elements[i].name == nomeCampo) {                        
            if ((nomeForm.elements[i+1].type != "hidden") 
                    && (nomeForm.elements[i+1].name != nomeCampo)) {                
                nomeForm.elements[i+1].focus();
                break;
            } else {
                nomeCampo = nomeForm.elements[i+1].name;
            }
        }
    }
}

function limpaCamposTxt(nomeForm) {
    for (i = 0; i < nomeForm.length; i++) {
        if (nomeForm.elements[i].type == "text") {
            nomeForm.elements[i].value = "";
        }
    }
}

/* Retorna o DV do IPTU (tipo="1") / ISS (tipo="0") */
function calculaDAC11A(numero, tipo) {
    var intPeso = 2;
    var intCalcula = 0;

    for (var intPosicao = (numero.length-1); intPosicao >= 0; intPosicao --) {
        // soma o produto das multiplica??es do d?gito pelo peso
        intCalcula += (intPeso * parseInt(numero.charAt(intPosicao), 10));
        intPeso ++;
        if (intPeso == 11) {
            intPeso = 1;
        }
    }
    
    // divide a soma dos produtos por 11
    intCalcula = intCalcula % 11;
    
    // monta retorno a partir de intCalcula
    if (intCalcula == 0) {
        return "0";
    } else if (intCalcula == 1) {
        return tipo;
    } else {
        return 11 - intCalcula;
    }
}

function CalculaDigitoMod1129(valor) {
    mult = 2;
    somaTotal = 0;
    for (j=valor.length;j>0;j--) {
        soma = (mult * parseInt(valor.substring(j,j-1),10));
        if (parseInt(soma,10) > 9) {
            soma = soma.toString();
            soma = parseInt(soma.substring(0,1),10)
                    + parseInt(soma.substring(1,2),10);
        }
        somaTotal = somaTotal + soma;
        mult++;
        if (mult > 9) mult = 2;
    }
    resto = somaTotal % 11;

    if (resto == 0 || resto == 1) {
        dig = 1;
    } else {
        dig = 11 - resto;
    }
    return dig;
}

function obtemTipoCampo(texto) {
    var alfa = false;
    var numerico = false;

    for (i=0; i<texto.length; i++) {
        if (isNumber(texto.charAt(i))) {
            numerico = true;
        } else {
            alfa = true;
        }
        if (numerico && alfa) {
            break;
        }
    }

    if (numerico && alfa) {
        return "alfanumerico";
    } else if (numerico && !alfa) {
        return "numerico";
    } else {
        return "alfa";
    }
}

function AlertaUsoTeclado() {
    alert("Para maior seguran?a, favor utilizar o Teclado Virtual."); 
}

function CalculaDigitoMod11_v4(valor) {
    mult = 2;
    somaTotal = 0;
    for (j=valor.length;j>0;j--) {
        soma = (mult * parseInt(valor.substring(j,j-1),10));
        somaTotal = somaTotal + soma;
        mult++;
        if (mult > 9) mult = 2;
    }
    resto = somaTotal % 11;

    if (resto == 0 || resto == 1) {
        dig = 0;
    } else {
        dig = 11 - resto;
    }
   
    return dig;
}

/*-----------------------------------------------------------------------------
 Nome:      fPassaAlfaNumerico(strTipo)
 Data:      07/05/2004
 Autor:     F?brica de Software - Renato C. Castelo
 Descri??o: N?o deixa o usu?rio digitar caracteres especiais, somente letras,
            n?meros e espa?o, e n?o tira a funcionalidade das demais teclas
            (Caps Lock, Shift, Tab, ...).
            Teclas: 33 - 47    ! " # $ % & ' ( ) * + , - . /
                    58 - 64    : ; < = > ? @
                    91 - 96    [ \ ] ^ _ `
                    123 ...    { | } ~ ...
            A fun??o deve estar no evento OnKeyPress.
 Par?metro: strTipo
            "a" => letras e espa?os
            "n" => n?meros
            diferente de "a" e "n"  => letras, n?meros e espa?os
 Atualiza??es: 
   Data:      11/05/2004
   Autor:     F?brica de Software - Renato C. Castelo
   Descri??o: Inclu?do par?metro strTipo. Valida de acordo com o tipo 
              informado.
-----------------------------------------------------------------------------*/
function fPassaAlfaNumerico(strTipo) {
    if ( ( (event.keyCode >= 33 ) && (event.keyCode <= 47 ) ) ||
         ( (event.keyCode >= 58 ) && (event.keyCode <= 64 ) ) ||
         ( (event.keyCode >= 91 ) && (event.keyCode <= 96 ) ) ||
         ( (event.keyCode >= 123)                           ) ) {
        event.returnValue = 0;
    }
    //-- Letras
    if( (strTipo == "a") || (strTipo == "A") ) {
        if ( (event.keyCode >= 48 ) && (event.keyCode <= 57 ) ) {
            event.returnValue = 0;
        }
    }
    //-- N?meros
    if( (strTipo == "n") || (strTipo == "N") ) {
        if ( ( (event.keyCode >= 65 ) && (event.keyCode <= 90 ) ) ||
             ( (event.keyCode >= 97 ) && (event.keyCode <= 122) ) ||
             ( (event.keyCode == 32 )                           ) ) {
            event.returnValue = 0;
        }
    }
}
/*-----------------------------------------------------------------------------
Valida??o de Incri??o Estadual no formato: MMMSSSSSDNND
-----------------------------------------------------------------------------*/
function validaIE1(numero) {
        if (numero.length != 12) {
            return false;
        }
        
        var MMM = sLeft(numero,3);
        var SSSSS = sMid(numero,4,5);
        var D1 = sMid(numero,9,1);
        var NN = sMid(numero,10,2);
        var D2 = sRight(numero,1);

        if ((MMM < 100) || (MMM > 794 && MMM < 801) || (MMM > 899 && MMM != 999) 
            || (!isNumber(SSSSS,0)) || (!isNumber(NN,0))) {
            return false;
        }
        
        var DV1 = 0;
        var DV2 = 0;
        var pesos1 = [1,3,4,5,6,7,8,10];
        var pesos2 = [3,2,10,9,8,7,6,5,4,3,2];
        
        for (i = 0; i < 8; i++) {
            DV1 = parseInt(DV1,10) + (parseInt(numero.charAt(i),10) * pesos1[i]);
        }
        DV1 = DV1 % 11;
        if (parseInt(DV1,10) == 10) {
            DV1 = 0;
        }
        
        if (parseInt(DV1,10) != parseInt(D1,10)) {
            return false
        }
        
        for (i = 0; i < 11; i++) {
            DV2 = parseInt(DV2,10) + (parseInt(numero.charAt(i),10) * pesos2[i]);
        }
        DV2 = DV2 % 11;
        if (parseInt(DV2,10) == 10) {
            DV2 = 0;
        }

        if (parseInt(DV2,10) != parseInt(D2,10)) {
            return false
        }
        
        return true;
}

/*-----------------------------------------------------------------------------
Valida??o de Inscri??o Estadual no formato: 0MMMSSSSDOOO
-----------------------------------------------------------------------------*/
function validaIE2(numero) {
        if (numero.length != 12) {
            return false;
        }
        
        var MMM = sMid(numero,2,3);
        var SSSS = sMid(numero,5,4);
        var D1 = sMid(numero,9,1);
        var OOO = sRight(numero,3);

        if ((MMM < 100) || (MMM > 794 && MMM < 801) || (MMM > 899 && MMM != 999) 
            || (!isNumber(SSSS,0)) || (!isNumber(OOO,0))) {
            return false;
        }
        
        var DV1 = 0;
        var pesos1 = [1,3,4,5,6,7,8,10];
        
        for (i = 0; i < 8; i++) {
            DV1 = parseInt(DV1,10) + (parseInt(numero.charAt(i),10) * pesos1[i]);
        }
        DV1 = DV1 % 11;
        if (parseInt(DV1,10) == 10) {
            DV1 = 0;
        }
        
        if (parseInt(DV1,10) != parseInt(D1,10)) {
            return false
        }
        
        return true;
}

/*-----------------------------------------------------------------------------
C?lculo de Digito Verificador de C?digod e Munic?pio
-----------------------------------------------------------------------------*/
function calculaDVCodMunicipio(numero) {
    if (numero.length != 4) {
        return false;
    }
    
    var peso = [4,3,2];
    var DV = 0;
    for (i = 0; i < 3; i++) {
        DV = parseInt(DV,10) + (parseInt(numero.charAt(i),10) * peso[i]);
    }
    DV = DV % 11;
    if (parseInt(DV,10) == 10) {
        DV = 0;
    }
    
    if (parseInt(DV,10) != parseInt(sRight(numero,1))) {
        return false;
    }

    return true;
}

/*-----------------------------------------------------------------------------
	C?lculo de D?gito Verificador de Numero de Declara??o
-----------------------------------------------------------------------------*/
function calculaDVDeclaracao(numero) {
    if (numero.length != 9) {
        return false;
    }
    
    var DV = 0;
    var pesos = [1,3,4,5,6,7,8,10];
    
    for (i = 0; i < 8; i++) {
        DV = parseInt(DV,10) + (parseInt(numero.charAt(i),10) * pesos[i]);
    }
    DV = DV % 11;
    if (parseInt(DV,10) == 10) {
        DV = 0;
    }
    
    if (parseInt(DV,10) != parseInt(sRight(numero,1),10)) {
        return false
    }
    
    return true;
}

/*-----------------------------------------------------------------------------
	C?lculo de D?gito Verificador de Numero de Placa
-----------------------------------------------------------------------------*/
function calcularDVPlaca(numero) {
    if (numero.length != 11) {
        return false;
    }
    
    var DV = 0;
    var peso = 2;
    for (i = numero.length - 2; i >= 0; i--) {
        DV = parseInt(DV,10) + (parseInt(numero.charAt(i),10) * peso);
        (--peso == 0 ? peso = 2: "");
    }
    DV = DV % 10;
    
    if (parseInt(sRight(numero,1),10) != parseInt(DV,10)) {
        return false;
    }

    return true;
}

/*-----------------------------------------------------------------------------
	C?lculo de D?gito Verificador de Numero de Etiqueta e D?vida Ativa
-----------------------------------------------------------------------------*/
function validaDVEtiquetaDividaAtiva(numero) {
    if (numero.length != 9 && numero.length != 13) {
        return false;
    }
    
    if (numero.length == 9) { //Divida Ativa
        var pesos = [1,3,4,5,6,7,8,10];
        var soma = 0;
        for (i = 0; i < 8; i++) {
            soma = parseInt(soma,10) + (parseInt(numero.charAt(i),10) * pesos[i]);
        }
        var digito = soma % 11;
        if (digito == 10) digito = 0;
        
        return (parseInt(numero.charAt(8)) == digito);
    } else { //Etiqueta
        var soma = 0;
        for (i = 0; i < 12; i++) {
            soma = parseInt(soma,10) + (parseInt(numero.charAt(i),10) * (i+1));
        }
        var digito = soma % 11;
        if (digito == 10) digito = 0;
    
        return (parseInt(numero.charAt(12)) == digito);
    }
}

/*-----------------------------------------------------------------------------
	C?lculo de D?gito Verificador de Faixa de Ipva
-----------------------------------------------------------------------------*/
function validaDVFaixaIPVA(numero) {
    var peso = 2;
    var soma = 0;
    for (var i = numero.length - 2; i >= 0; i--) {
        soma = parseInt(soma,10) + (parseInt(numero.charAt(i),10) * peso);
        (--peso == 0 ? peso = 2: "");
    }
    var DV = soma % 10;
    return (parseInt(DV,10) == parseInt(sRight(numero,1),10));
}

/*-----------------------------------------------------------------------------
	C?lculo de D?gito Verificador de pelo m?dulo 11
		tipoValidacao = 1 (CPF, RENAVAM)
		tipoValidacao = 2 (CGC,CONTA,COD BARRAS, BLOQUETO)
-----------------------------------------------------------------------------*/
function sCalculaDigitoMod11Gare(sValor,iDigSaida,sTipoValidacao) {
        if (sTipoValidacao == 1) iCod = 12  // sTipoValidacao=1 - validacao digito verificador: cpf,renavam 
        if (sTipoValidacao == 2) iCod = 9   // sTipoValidacao=2 - validacao digito verificador: cgc,conta,cod. barra bloqueto 

        for (t=1;t<=iDigSaida;t++) {
            soma = 0;
            mult = 2;
            for (j=sValor.length;j>0;j--) {
                soma = soma + (mult * parseInt(sValor.substring(j,j-1),10));
                mult++;
                if (mult > iCod) mult = 2
            }
            soma = (soma * 10) % 11;
            if (soma == 10) sValor = sValor + "0";
            else sValor = sValor + soma;
        }
        return sValor.substring(sValor.length-iDigSaida,sValor.length);
}

function calculaDigitoVerificador(numero) {
	var pesos;     // Array que cont?m os pesos a serem multiplicados
	var soma = 0;  // Acumula a somat?ria da divis?o dos pesos
	var resto = 0; // Resto da divis?o

    if (numero.length == 6) {
        pesos = new Array(7);
        pesos = "7,6,5,4,3,2".split(",");
    } else if (numero.length == 8) {
        pesos = new Array(9);
        pesos = "9,8,7,6,5,4,3,2".split(",");
    } 
    
    for (j = 0; j < numero.length; j++) {
        // soma = soma + (d?gito do peso * d?gito do n?mero)
        soma += pesos[j] * sMid(numero, j + 1, 1);
    }
    
    // Digito ? o algarismo mais a direita do resto
    resto = (soma % 11);
    if (resto >= 10) 
        resto = sRight(resto.toString(), 1);
    
    return resto;
}

function calculaDigitoVerificadorDI(numero) {
	var pesos;     // Array que cont?m os pesos a serem multiplicados
	var soma = 0;  // Acumula a somat?ria da divis?o dos pesos
	var resto = 0; // Resto da divis?o

    if (numero.length == 10) {
        pesos = new Array(11);
        pesos = "3,2,9,8,7,6,5,4,3,2".split(",");
    }
    
    for (j = 0; j < numero.length; j++) {
        // soma = soma + (d?gito do peso * d?gito do n?mero)
        soma += pesos[j] * sMid(numero, j + 1, 1);
    }
    
    // Digito ? o algarismo mais a direita do resto
    resto = soma % 11;
    resto = parseInt(11 - resto);
    if (resto >= 10) 
        resto = sRight(resto.toString(), 1);
    
    return Math.abs(resto);
}

function calculaDigitoParcelamento(numero) {
	var pesos = new Array(9); // Array que cont?m os pesos a serem multiplicados
	var soma = 0;           // Acumula a somat?ria da divis?o dos pesos
	var resto = 0;          // Resto da divis?o

    pesos = "8,7,6,5,4,3,2,10".split(",");  
    for (j = 0; j < numero.length; j++) {
        // soma = soma + (d?gito do peso * d?gito do n?mero)
        soma += pesos[j] * sMid(numero, j + 1, 1);
    }
    
    resto = soma % 11;
    resto = parseInt(11 - resto);   
    if (resto == 10) 
        resto = 0;
    
    return Math.abs(resto);
}

function calculaDigitoNotificacao(numero) {
	var pesos = new Array(9); // Array que cont?m os pesos a serem multiplicados
	var soma = 0;           // Acumula a somat?ria da divis?o dos pesos
	var resto = 0;          // Resto da divis?o

    pesos = "8,7,6,5,4,3,2,10".split(",");  
    for (j = 0; j < numero.length; j++) {
        // soma = soma + (d?gito do peso * d?gito do n?mero)
        soma += pesos[j] * sMid(numero, j + 1, 1);
    }
    
    resto = soma % 11;
    resto = parseInt(11 - resto);   
    if (resto == 10) 
        resto = 0;
    
    return Math.abs(resto);
}

function calculaDigitoGuia(numero) {
	var pesos = new Array(12); // Array que cont?m os pesos a serem multiplicados
	var soma = 0;              // Acumula a somat?ria da divis?o dos pesos
	var resto = 0;             // Resto da divis?o

    pesos = "3,2,10,9,8,7,6,5,4,3,2".split(",");
    for (j = 0; j < numero.length; j++) {
        // soma = soma + (d?gito do peso * d?gito do n?mero)
        soma += pesos[j] * sMid(numero, j + 1, 1);
    }
    
    // Digito ? o algarismo mais a direita do resto
    resto = (soma % 11);
    if (resto >= 10) 
        resto = sRight(resto.toString(), 1);
    
    return Math.abs(resto);
}

function Trim( strDado ){
    return strDado.replace (/^\s+/,'').replace (/\s+$/,'');
}

/*-----------------------------------------------------------------------------
 Formata valores em formato SQL para o Brasileiro.
-----------------------------------------------------------------------------*/
function FormataValorBRA(pValor)
{
	var i;
	var j;
	var iDecimal;
	var iInteiro;
	var iNovoValor;

	iInteiro = pValor;
	iDecimal = '00';

	// Separa a parte Inteira da parte Decimal
	i = 0;
	for (i = 0; i < pValor.length; i++)
	{
		if (pValor.charAt(i) == ".")
		{
			iInteiro = pValor.substring(0,i);
			iDecimal = pValor.substring(i + 1,pValor.length);
		}
	}

	// Formata a parte decimal para duas casas no m?nimo.
	if (iDecimal.length == 1)
	{
		iDecimal = iDecimal + "0";
	}
    
    // Formata a parte decimal para no m?ximo duas casas.
    if (iDecimal.length > 2) {
        iDecimal = sLeft(iDecimal, 2);
    }
    
	// Formata a parte Inteira.
	iNovoValor = '';
	j = 0;
	for (i = iInteiro.length; i > 0; i--)
	{
		j = j + 1;
		if (j == 4)
		{
			iNovoValor = iInteiro.substring(i,i-1) + '.' + iNovoValor;
			j = 1;
		}
		else
		{
			iNovoValor = iInteiro.substring(i,i-1) + iNovoValor;
		}
	}

	// Agrega a Parte decimal ao novo valor
	iNovoValor = iNovoValor + "," + iDecimal;

	return (iNovoValor);
}