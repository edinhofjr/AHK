#SingleInstance Force

main := Gui()
main.Opt("AlwaysOnTop Border")
main.Add('text', "x140 y50 +Center" , "CONTAGEM DO CAIXA")
main.Add("Text", "x40 y89 w60 h20" , "NOTAS")
main.Add("text", "x100 y89 w50 h20", "QTD")

main.Add("Text", "x40 y119 w60 h20" , 'R$ 2`,00')
main.Add("Text", "x40 y139 w60 h20" , 'R$ 5`,00')
main.Add("Text", "x40 y159 w60 h20" , 'R$ 10`,00')
main.Add("Text", "x40 y179 w60 h20" , 'R$ 20`,00')
main.Add("Text", "x40 y199 w60 h20" , 'R$ 50`,00')
main.Add("Text", "x40 y219 w60 h20" , 'R$ 100`,00')

empty := Format2f(0)

N2 := main.Add("Edit", "x100 y119 w50 h20 vNota2 +Number", 0)
N2.OnEvent('change',submit)
N2PH := main.Add("Text", "x+10  w50",empty)

N5 := main.Add("Edit", "x100 y139 w50 h20 vNota5 +Number" , 0)
N5.OnEvent('change',submit)
N5PH := main.Add("Text", "x+10 w50",empty)

N10 := main.Add("Edit", "x100 y159 w50 h20 vNota10 +Number ", 0)
N10.OnEvent('change',submit)
N10PH := main.AddText('x+10 w50',empty)

N20 := main.Add("Edit", "x100 y179 w50 h20 vNota20 +Number ",0)
N20.OnEvent('change', submit)
N20PH := main.AddText('x+10 w50',empty)

N50 := main.Add("Edit", "x100 y199 w50 h20 vNota50 +Number",0)
N50.OnEvent('Change',submit)
N50PH := main.AddText('x+10 w50',empty)

N100 := main.Add("Edit", "x100 y219 w50 h20 vNota100 +Number",0)
N100.OnEvent('change', submit)
N100PH := main.AddText('x+10 w50',empty)

main.Add("Text", "x232 y88 w50 h20" , "MOEDAS:")
main.Add("Text", "x282 y89 w50 h20 +Center", "QTD")

main.Add("Text", "x232 y119 w60 h20" , "R$ 0`,05")
main.Add("Text", "x232 y139 w50 h20" , "R$ 0`,10")
main.Add("Text", "x232 y159 w50 h20" , "R$ 0`,25")
main.Add("Text", "x232 y179 w50 h20" , "R$ 0`,50")
main.Add("Text", "x232 y199 w50 h20" , "R$ 1`,00")

M005 := main.Add("Edit", "x282 y119 w50 h20 vMoeda005 +Number",0)
M005.OnEvent('change',submit)
M005PH := main.AddText('x+10 w50',empty)

M010 := main.Add("Edit", "x282 y139 w50 h20 vMoeda010 +Number",0)
M010.OnEvent('change',submit)
M010PH := main.AddText('x+10 w50',empty)

M025 := main.Add("Edit", "x282 y159 w50 h20 vMoeda025 +Number",0)
M025.OnEvent('Change',submit)
M025PH := main.AddText('x+10 w50', empty)

M050 := main.Add("Edit", "x282 y179 w50 h20 vMoeda050 +Number",0)
M050.OnEvent('change', submit)
M050PH := main.AddText('x+10 w50', empty)

M1 := main.Add("Edit", "x282 y199 w50 h20 vMoeda1 +Number ",0)
M1.OnEvent('Change',submit)
M1PH := main.AddText('x+10 w50',empty)

TOTALGUI := main.AddText('x232 y230 w120 h20',"TOTAL:")
RES := main.AddText("w50 x+-10",empty)
TOTALGUI.SetFont("s12 cREd","Verdana")

main.AddButton("x305 w75 h30","SALVAR").OnEvent('Click',Log)
main.Show("w400 h400")

main.AddButton("w75 h30","IMPRIMIR").OnEvent("Click",print)
submit(*) {

    getMain := main.Submit(false)
    final:=0
    input := [getMain.nota2,getMain.nota5,getMain.nota10,getMain.nota20,getMain.nota50,getMain.nota100,getMain.moeda005,getMain.moeda010,getMain.moeda025,getMain.moeda050,getMain.moeda1]
    times := [2,5,10,20,50,100,0.05,0.1,0.25,0.5,1]
    output := [N2PH,N5PH,N10PH,N20PH,N50PH,N100PH,M005PH,M010PH,M025PH,M050PH,M1PH]
    
    for i, value in input {
        if value != "" {
            output[i].Text := Format2f(value * times[i])
        }
        if value = "" {
            output[i].Text := Format2f(0)
        }
    }
    x:=0
    for i, value in input {
        if value != ""{
        x += value * times[i]
        RES.Text := Format2f(x)
        }
    }
}
LogWasCreated := 0
Log(*) {
    getMain := main.Submit(false)
    final:=0
    input := [getMain.nota2,getMain.nota5,getMain.nota10,getMain.nota20,getMain.nota50,getMain.nota100,getMain.moeda005,getMain.moeda010,getMain.moeda025,getMain.moeda050,getMain.moeda1]
    times := [2,5,10,20,50,100,0.05,0.1,0.25,0.5,1]
    output := [N2PH,N5PH,N10PH,N20PH,N50PH,N100PH,M005PH,M010PH,M025PH,M050PH,M1PH]

    DirCreate(A_Desktop "\LOG\" A_Year "\" A_MM)

    FilePathTxt := (A_Desktop "\LOG\" A_Year "\" A_MM "\" A_DD ".txt")

    ;text

        for i, value in input {
            text := Format("{:-7}" ,Format2f(value)) "x "  Format("{:-6}",format2fsemr(times[i])) "=" Format2f(value*times[i]) "`n"
            FileAppend(text,FilePathTxt,)
        }

        text := Format("{:-16}","TOTAL:") res.Text "`n"
        FileAppend(text,FilePathTxt,)
    global LogWasCreated := 1
}

print(*) {
    if (LogWasCreated = 1) {
        FilePathTxt := (A_Desktop "\LOG\" A_Year "\" A_MM "\" A_DD ".txt")
        Run 'notepad /p' FilePathTxt
    }

}

Format2f(value) {
    return "R$" Format("{:.2f}",value)
}

Format2fsemR(value) {
    return Format("{:.2f}",value)
}

