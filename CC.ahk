#SingleInstance Force
#warn
g := Gui()
msg := Gui()
g.Title := "CONTADOR DE CAIXA V2"
g.Add('text',"x62 y29 w320 h50 +Center" , "CONTAGEM DO CAIXA")
g.Add("Text", "x62 y89 w60 h20" , "NOTAS")
g.Add("text", "x122 y89 w50 h20 +Center", "QTD")

g.Add("Text", "x62 y119 w60 h20" , 'R$ 2`,00')
g.Add("Text", "x62 y139 w60 h20" , 'R$ 5`,00')
g.Add("Text", "x62 y159 w60 h20" , 'R$ 10`,00')
g.Add("Text", "x62 y179 w60 h20" , 'R$ 20`,00')
g.Add("Text", "x62 y199 w60 h20" , 'R$ 50`,00')
g.Add("Text", "x62 y219 w60 h20" , 'R$ 100`,00')
g.Add("Edit", "x122 y119 w50 h20 vNota2 +Number", 0)
g.Add("Edit", "x122 y139 w50 h20 vNota5 +Number" , 0)
g.Add("Edit", "x122 y159 w50 h20 vNota10 +Number ", 0)
g.Add("Edit", "x122 y179 w50 h20 vNota20 +Number ",0)
g.Add("Edit", "x122 y199 w50 h20 vNota50 +Number",0)
g.Add("Edit", "x122 y219 w50 h20 vNota100 +Number",0)

g.Add("Text", "x232 y89 w50 h20" , "MOEDAS:")
g.Add("Text", "x282 y89 w50 h20 +Center", "QTD")
g.Add("Text", "x232 y119 w60 h20" , "R$ 0`,05")
g.Add("Text", "x232 y139 w50 h20" , "R$ 0`,10")
g.Add("Text", "x232 y159 w50 h20" , "R$ 0`,25")
g.Add("Text", "x232 y179 w50 h20" , "R$ 0`,50")
g.Add("Text", "x232 y199 w50 h20" , "R$ 1`,00")
g.Add("Edit", "x282 y119 w50 h20 vMoeda005 +Number",0)
g.Add("Edit", "x282 y139 w50 h20 vMoeda010 +Number",0)
g.Add("Edit", "x282 y159 w50 h20 vMoeda025 +Number",0)
g.Add("Edit", "x282 y179 w50 h20 vMoeda050 +Number",0)
g.Add("Edit", "x282 y199 w50 h20 vMoeda1 +Number ",0)

g.add("radio", "x232 y225 vAbertura" , "ABERTURA")
g.add("radio", "x232 y245 vFechamento" , "FECHAMENTO")

g.Add("Button", 'x232 y270 w120 h70', "RESULTADOS").OnEvent('click',submit)

submit(*) {
    saved :=g.Submit()
    nota2:=saved.nota2
    nota5:=saved.nota5
    nota10:=saved.nota10
    nota20:=saved.nota20
    nota50:=saved.nota50
    nota100:=saved.nota100,
    moeda005:=saved.moeda005
    moeda010:=saved.moeda010
    moeda025:=saved.moeda025
    moeda050:=saved.moeda050
    moeda1:=saved.moeda1
    total:= nota2*2 + nota5*5 + nota10*10 + nota20*20 + nota50*50 + nota100*100 + moeda005*.05 + moeda010*.1 + moeda025*.25 + moeda1 + moeda050*.5
    totalf := Format("{:.2f}", total)
    msg.Add("text", "x80 y19 w210 h15",Format("{:-13}", "R$ 2,00")  " x "   nota2  " = "  Format("{:.2f}" , Nota2*2))
    msg.Add("text", "x80 y39 w210 h20",Format("{:-13}", "R$ 5,00")  " x " nota5 " = " Format("{:.2f}" , Nota5*5))
    msg.Add("text", "x80 y59 w220 h20",Format("{:-12}", "R$ 10,00") " x " nota10 " = " Format("{:.2f}" ,nota10*10))
    msg.Add("text", "x80 y79 w220 h20 ",Format("{:-12}", "R$ 20,00") " x " nota20 " = " Format("{:.2f}" ,Nota20*20))
    msg.Add("text", "x80 y99 w220 h20 ",Format("{:-12}", "R$ 50,00") " x " nota50 " = " Format("{:.2f}" ,Nota50*50))
    msg.Add("text", "x80 y119 w220 h20 ",Format("{:-11}", "R$ 100,00") " x " nota100 " = " Format("{:.2f}" ,Nota100*100))
    msg.Add("text", "x80 y139 w210 h20 ",Format("{:-13}", "R$ 0,05") " x " moeda005 " = " Format("{:.2f}", moeda005*.05))
    msg.Add("text", "x80 y159 w210 h20 ",Format("{:-13}", "R$ 0,10") " x " moeda010 " = " Format("{:.2f}" ,moeda010*.10))
    msg.Add("text", "x80 y179 w210 h20 ",Format("{:-13}", "R$ 0,25") " x " moeda025 " = " Format("{:.2f}" ,moeda025*.25))
    msg.Add("text", "x80 y199 w210 h20 ",Format("{:-13}", "R$ 0,50") " x " moeda050 " = " Format("{:.2f}" ,moeda050*.5))
    msg.Add("text", "x80 y219 w210 h20 ",Format("{:-13}", "R$ 1,00") " x " moeda1 " = " Format("{:.2f}" ,moeda1))
    msg.Add("text", "x80 y239 w210 h20  ",Format("{:26}", "TOTAL:  " totalf))    
    msg.Show("w256 h294")
    
    DirCreate ( A_Desktop "\LOG")
    DirCreate ( A_Desktop "\LOG\" A_Mon)

    ;path:= A_Desktop "\LOG" "\" A_DD "-" A_MM "-" A_YYYY  ".txt"
    path := A_Desktop "\LOG\" A_mon "\" A_DD ".txt" 
    text := 
        ( 
        Format("{:-8}" ,"R$2,00") Format("{:-3}" ,"x" nota2) "=" Format("{:.2f}" , Nota2*2) "`n"
        Format("{:-8}" ,"R$5,00")  Format("{:-3}" ,"x" nota5) "="  Format("{:.2f}" , Nota5*5) "`n"
        Format("{:-8}" ,"R$10,00")  Format("{:-3}" ,"x" nota10) "="  Format("{:.2f}" , nota10*10) "`n"
        Format("{:-8}" ,"R$20,00")  Format("{:-3}" ,"x" nota20) "=" Format("{:.2f}" , Nota20*20)  "`n" 
        Format("{:-8}" ,"R$50,00") Format("{:-3}" ,"x" nota50) "="   Format("{:.2f}" , Nota50*50) "`n" 
        Format("{:-8}" ,"R$100,00") Format("{:-3}" ,"x" nota100) "=" Format("{:.2f}" , Nota100*100) "`n" 
        Format("{:-8}" ,"R$0,05")  Format("{:-3}" ,"x" moeda005) "="  Format("{:.2f}" , moeda005*0.05) "`n" 
        Format("{:-8}" ,"R$0,10")  Format("{:-3}" ,"x" moeda010) "="  Format("{:.2f}" , moeda010*0.1) "`n" 
        Format("{:-8}" ,"R$0,25") Format("{:-3}" ,"x" moeda025) "="  Format("{:.2f}" , moeda025*0.25) "`n" 
        Format("{:-8}" ,"R$0,50")  Format("{:-3}" ,"x" moeda050) "="  Format("{:.2f}" , moeda050*0.5) "`n" 
        Format("{:-8}" ,"R$1,00")  Format("{:-3}" ,"x" moeda1) "="  Format("{:.2f}" , moeda1) "`n"
        Format("{:-8}" , "TOTAL:      ") totalf
    )


    if saved.abertura == 1 { 
    FileAppend("Abertura: `n" text "`n" "`n" "`n" ,path,"UTF-8")
    }
    if saved.fechamento == 1 {
        caixa := Format("{:.2f}" , total-200)
        FileAppend("Fechamento `n" text "`n" Format("{:-10}" , "EM CAIXA:  ") caixa "`n" "`n" "`n" ,path,"UTF-8")
        print()
    }
    }

print(*) {
    path := A_Desktop "\LOG\" A_mon "\" A_DD ".txt"
    Run path
    sleep(1500)
    Send "^p"
    Sleep(1000)
    Send "{ENTER}"
}

g.Show("w479 h379")

return