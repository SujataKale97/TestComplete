node("slave2")
{
  stage('Code Clone')
  {
   git 'https://github.com/SujataKale97/TestComplete.git'
  }
  stage('Test')
  {
    testcompletetest suite: 'Checkpoints/Web Accessibility/WebAccessibilityCheckpoints_JavaScript/WebAccessibilityCheckpoints_JavaScript.pjs'
  }
}
