<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <script type="text/javascript">
        function Run(strPath) {
            //debugger;
            exe.value = strPath;
            try {
                var objShell = new ActiveXObject("wscript.shell");
                objShell.Run(strPath);
                objShell = null;
            }
            catch (e) {
                alert('找不到文件"' + strPath + '"(或它的组件之一)。请确定路径和文件名是否正确，而且所需的库文件均可用。')

            }
        }

    </script>
</head>
<body>
请输入要运行的程序：<br>
<input name="exe" type="text" size="20" value="regedit">
<button type="button" onclick="Run(exe.value)">
    确定</button>
<button type="button" onclick="exe.value=''">
    重新输入</button><br>
<button type="button" onclick="Run('C:\\WINDOWS\\system32\\notepad.exe')">
    记事本</button><br>
<button type="button" onclick="Run('C:\\WINDOWS\\system32\\mspaint.exe')">
    画图板</button><br>
<button type="button" onclick="Run('C:\\WINDOWS\\system32\\calc.exe')">
    计算器</button><br>
<button type="button" onclick="Run('C:\\WINDOWS\\system32\\cmd.exe')">
    cmd</button><br>
<button type="button" onclick="Run('C:\\WINDOWS\\regedit.exe')">
    注册表</button><br>
<button type="button" onclick="Run('C:\\WINDOWS\\PCHealth\\HelpCtr\\Binaries\\msconfig.exe')">
    Msconfig</button><br>
</body>
</html>