def test(page):
  page.Table(0).Cell(0, 0).Textbox("input1").Text = "test1"
  page.Table(0).Cell(2, 0).Panel(0).Textbox("Input2").Text = "test2"
  page.Table(0).Cell(0, 1).Textarea(0).value = "test3"
  page.Table(0).Cell(1, 0).Label(1).Checkbox("checkbox2").Click()
  page.Table(0).Cell(0, 2).Label(2).RadioButton("radiogroup1").Click()
  page.Table(0).Cell(1, 1).Panel(0).Select(0).ClickItem(2)
  page.Table(0).Cell(1, 2).Panel(0).Select(0).SelectItem(2)

def main():
  Browsers.Item[btIExplorer].Run("file:///{0}..\\MainPage.htm".format(Project.Path))
  page = Aliases.browser.pageMainpageHtm
  test(page)
  WebTesting.WebComparison1.Check() 
  Aliases.browser.Close()
