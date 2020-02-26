"use strict";

function Test(page)
{
  page.Table(0).Cell(0, 0).Textbox("input1").Text = "test1";
  page.Table(0).Cell(2, 0).Panel(0).Textbox("Input2").Text = "test2";
  page.Table(0).Cell(0, 1).Textarea(0).value = "test3";
  page.Table(0).Cell(1, 0).Label(1).Checkbox("checkbox2").Click();
  page.Table(0).Cell(0, 2).Label(2).RadioButton("radiogroup1").Click();
  page.Table(0).Cell(1, 1).Panel(0).Select(0).ClickItem(2);
  page.Table(0).Cell(1, 2).Panel(0).Select(0).SelectItem(2);
}

function Main()
{
  Browsers.Item(btIExplorer).Run("file:///" + Project.Path + "..\\MainPage.htm");
  let page = Aliases.browser.pageMainpageHtm;
  Test(page);
  WebTesting.WebComparison1.Check(); 
  Aliases.browser.Close();
}