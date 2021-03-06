﻿function Test()
{
  var notepad_proc = Sys.Process("notepad");
  var notepad_wnd = notepad_proc.Window("Notepad", "*");

  var help_browser, help_wnd;
  if (aqEnvironment.GetWinMajorVersion() > 5)  
  {
    notepad_wnd.MainMenu.Click("Help|View Help");
  
    var help_proc = Sys.Process("helppane");
    help_wnd = help_proc.Window("HelpPane", "Windows Help and Support")
    help_browser = help_wnd.FindChildEx("WndClass", "Internet Explorer_Server", 4, false, 10000)
  }
  else
  {
    notepad_wnd.MainMenu.Click("Help|Help Topics");

    help_wnd = notepad_proc.Window("HH Parent", "Notepad");
    var navigator = help_wnd.Window("HH Child", "", 2).Window("SysTabControl32");
    navigator.ClickTab("&Contents");
    navigator.Window("SysTreeView32").ClickItem("|Notepad|Create a header or footer");
    help_browser = help_wnd.Window("HH Child", "", 1).Window("Shell Embedding", "", 1).Window("Shell DocObject View", "", 1).Window("Internet Explorer_Server", "", 1);
  }

  help_browser.Page("*").Wait();     
  WebTesting.WebAccessibility1.Check(help_browser.Page("*"));
  
  help_wnd.Close();
}

function Main()
{
  if (aqEnvironment.GetWinMajorVersion() >= 10)
  {
    try
    {
      Browsers.Item(btEdge).Run("http://support.smartbear.com/samples/testcomplete12/WebOrders/");
    }
    catch(e)
    {
      Browsers.Item(btIExplorer).Run("http://support.smartbear.com/samples/testcomplete12/WebOrders/");
    }
    Sys.Browser().Page("*/WebOrders*").Wait();
    WebTesting.WebAccessibility1.Check(Sys.Browser().Page("*/WebOrders*"));
    Sys.Browser().Close();
  }
  else
  {
    TestedApps.notepad.Run();
    Test();
    Delay(1000);
    TestedApps.notepad.Close();
  }
}