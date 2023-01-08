#SingleInstance Force
filter:=""
fruits := ["Apple", "Banana", "Orange", "Strawberry", "Lemon", "Mango", "Pineapple", "Grapes", "Peach", "Watermelon", "Kiwi", "Cantaloupe", "Blueberries", "Raspberries", "Blackberries", "Cranberries", "Plums", "Apricots", "Pears", "Cherries"]
newFruits := []

main := Gui()

main.Add("Edit","vSearchBar w280","").OnEvent('Change', submit)

LBGUI := main.Add("ListBox","vList w280 h270",fruits)


submit(*) 
{
    getMain := main.Submit(false)
    filter := getMain.SearchBar
    newFruits:= []
    for i, value in fruits {
        if (filter = "") 
            break
        if (InStr(value, filter, 0,)) {
            if "not value in newFruits" {
                newFruits.Push(value)
            }
        }
    }
    LBGUI.Delete()
    LBGUI.Add(newfruits)
    
    if (filter = ""){
        resetLB
    }


    resetLB(*) {
    LBGUI.Delete()
    LBGUI.Add(fruits)
}  

}
main.Show("w300 h300" )

