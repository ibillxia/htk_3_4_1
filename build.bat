D:
cd D:\Program Files (x86)\Microsoft Visual Studio 8\Common7\Tools\
vsvars32
pause

E:
cd E:\Code\htk\htk\
mkdir bin.win32
cd HTKLib
nmake /f htk_htklib_nt.mkf all
cd ..
cd HTKTools
nmake /f htk_htktools_nt.mkf all
cd ..
cd HLMLib
nmake /f htk_hlmlib_nt.mkf all
cd ..
cd HLMTools
nmake /f htk_hlmtools_nt.mkf all
cd ..
pause