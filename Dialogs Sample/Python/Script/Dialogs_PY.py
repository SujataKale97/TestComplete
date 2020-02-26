# Before running the test, make sure to configure your web browsers
# as explained in the "Preparing  Web Browsers" section.

def alertTest():
  Log.AppendFolder("Alert Test")
  page = Aliases.browser.Page
  page.panelPage.panelDialogbox.link.Click()
  page.Alert.buttonOk.ClickButton()
  page.Wait()
  Log.PopLogFolder()

def promptTest():
  Log.AppendFolder("Prompt Test")
  page = Aliases.browser.Page
  page.panelPage.panelDialogbox.link1.Click()
  prompt = page.Prompt
  prompt.textboxValue.Keys("tester")
  prompt.buttonOk.ClickButton()
  aqObject.CheckProperty(page.panelPage.panelDialogbox.promptLog, "contentText", cmpEqual, "Hello tester!", False)  
  page.Wait()
  Log.PopLogFolder()

def confirmTest():
  Log.AppendFolder("Confirm Test")
  page = Aliases.browser.Page
  page.panelPage.panelDialogbox.link2.Click()
  page.Confirm.buttonOk.ClickButton()
  aqObject.CheckProperty(page.panelPage.panelDialogbox.confirmLog, "contentText", cmpEqual, "You pressed OK!", False)
  page.Wait()
  Log.PopLogFolder()

def onBeforeUnloadTest():
  processId = Aliases.browser.Id
  Log.AppendFolder("OnBeforeUnload Test")
  page = Aliases.browser.Page
  page.panelPage.panelDialogbox.link3.Click()
  page.Confirm.buttonCancel.ClickButton()
  Aliases.browser.BrowserWindow.Close()
  page.Confirm.buttonOk.ClickButton()
  Log.PopLogFolder()
  # cache process id because Edge restarts after closing
  while Aliases.browser.Exists and (processId == Aliases.browser.Id):
    Delay(1000)    

def main():
  Log.Message("Found {0} browsers:".format(Browsers.Count)) 
  for i in range(Browsers.Count):
    Log.AppendFolder(Browsers.Item[i].Description)
    Browsers.Item[i].Run("http://downloads.smartbear.com/samples/testcomplete12/dialogs/")
    alertTest()
    promptTest()
    confirmTest()
    onBeforeUnloadTest() 
    Log.PopLogFolder()