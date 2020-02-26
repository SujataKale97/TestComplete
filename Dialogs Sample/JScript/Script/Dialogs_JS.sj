// Before running the test, make sure to configure your web browsers
// as explained in the "Preparing  Web Browsers" section.

function AlertTest()
{
  var page;
  Log.AppendFolder("Alert Test");
  page = Aliases.browser.Page;
  page.panelPage.panelDialogbox.link.Click();
  page.Alert.buttonOk.ClickButton();
  page.Wait();
  Log.PopLogFolder();
}

function PromptTest()
{
  var page, prompt;
  Log.AppendFolder("Prompt Test");
  page = Aliases.browser.Page;
  page.panelPage.panelDialogbox.link1.Click();
  prompt = page.Prompt;
  prompt.textboxValue.Keys("tester");
  prompt.buttonOk.ClickButton();
  aqObject.CheckProperty(page.panelPage.panelDialogbox.promptLog, "contentText", cmpEqual, "Hello tester!", false);  
  page.Wait();
  Log.PopLogFolder();
}

function ConfirmTest()
{
  var page;
  Log.AppendFolder("Confirm Test");
  page = Aliases.browser.Page;
  page.panelPage.panelDialogbox.link2.Click();
  page.Confirm.buttonOk.ClickButton();
  aqObject.CheckProperty(page.panelPage.panelDialogbox.confirmLog, "contentText", cmpEqual, "You pressed OK!", false);
  page.Wait();
  Log.PopLogFolder();
}

function OnBeforeUnloadTest()
{
  var processId = Aliases.browser.Id;
  var page;
  Log.AppendFolder("OnBeforeUnload Test");
  page = Aliases.browser.Page;
  page.panelPage.panelDialogbox.link3.Click();
  page.Confirm.buttonCancel.ClickButton();
  Aliases.browser.BrowserWindow.Close();
  page.Confirm.buttonOk.ClickButton();
  Log.PopLogFolder();
  // cache process id because Edge restarts after closing
  while (Aliases.browser.Exists && (processId == Aliases.browser.Id))
    Delay(1000);    
}

function Main()
{
  var i;
  Log.Message("Found " + aqConvert.IntToStr(Browsers.Count) + " browsers:"); 
  for(i = 0; i < Browsers.Count; i++)
  {
    Log.AppendFolder(Browsers.Item(i).Description);
    Browsers.Item(i).Run("http://downloads.smartbear.com/samples/testcomplete12/dialogs/");
    AlertTest();
    PromptTest();
    ConfirmTest();
    OnBeforeUnloadTest(); 
    Log.PopLogFolder();
  }
}