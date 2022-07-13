import win32com.client
import pythoncom
import pyacadcom  # module for resolving busy errors of COM during a lot of transactions

acad = pyacadcom.AutoCAD()
adoc = acad.ActiveDocument
amsp = adoc.ModelSpace


def coords(x, y, z):  # function for converting coords in "understandable" AutoCAD format
    return win32com.client.VARIANT(pythoncom.VT_ARRAY | pythoncom.VT_R8, (x, y, z))


aa = "Hello World!"
adoc.Utility.Prompt(aa)
adoc.Utility.Prompt("\003\003")  ## emulate Esc button

adoc.SendCommand("_regenall ")

pt1 = coords(100, 100, 0)
amsp.AddCircle(pt1, 100)

pt2 = adoc.Utility.GetPoint(pythoncom.Empty,"Choose point:")
amsp.AddCircle(coords(*pt2),100)    # asterisk used for unwrap list items as arguments for function coords


