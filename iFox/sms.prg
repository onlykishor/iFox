*!* SMS Application using VFP via IrDA
*!* Created by : Handi Rusli
*!* Member Of http://www.fox-id.com
*!* Komunitas Programmer FoxPro Indonesia
 
LOCAL oForm as Form
 
oForm = CREATEOBJECT("FormSMS")
oForm.Show(1)
 
RETURN
 
DEFINE CLASS FormSMS AS form
 
 DataSession = 2
 Height = 440
 Width = 527
 AutoCenter = .T.
 Caption = "SMS Application using Visual FoxPro"
 
 ADD OBJECT sms as mysms WITH Visible = .F.
 
 ADD OBJECT pageframe1 as mypageframe1
 
 ADD OBJECT label1 AS myLabel WITH ;
  Caption = "Com Port :", ;
  Height = 17, ;
  Left = 67, ;
  Top = 126, ;
  Width = 60
 
 ADD OBJECT label2 AS myLabel WITH ;
  FontBold = .T., ;
  FontName = "Verdana", ;
  FontSize = 10, ;
  Caption = "http://www.fox-id.com  (Komunitas Programmer FoxPro Indonesia)", ;
  Height = 18, ;
  Left = 7, ;
  Top = 416, ;
  Width = 512
 
 ADD OBJECT label3 AS myLabel WITH ;
  Caption = "Baud Rate Settings :", ;
  Height = 17, ;
  Left = 13, ;
  Top = 153, ;
  Width = 114
 
 ADD OBJECT label4 AS myLabel WITH ;
  Caption = "(9600,N,8,1) - Default Value", ;
  Height = 17, ;
  Left = 225, ;
  Top = 154, ;
  Width = 153
 
 ADD OBJECT label5 AS myLabel WITH ;
  FontBold = .T., ;
  FontSize = 12, ;
  Caption = "Try sending SMS to this number, ", ;
  Height = 22, ;
  Left = 158, ;
  Top = 378, ;
  Visible = .F., ;
  Width = 211, ;
  ForeColor = RGB(255,0,0)
 
 ADD OBJECT label6 AS myLabel WITH ;
  FontBold = .T., ;
  FontSize = 12, ;
  Caption = "OnComm Event will tell you that Incoming SMS received :-D", ;
  Height = 22, ;
  Left = 4, ;
  Top = 398, ;
  Visible = .F., ;
  Width = 518, ;
  ForeColor = RGB(255,0,0)
 
 ADD OBJECT label7 AS myLabel WITH ;
  FontBold = .T., ;
  Caption = "* Tested using Nokia 6510 & Nokia 8310 Mobile Phone via IrDA with Windows XP", ;
  Height = 17, ;
  Left = 3, ;
  Top = 99, ;
  Width = 454, ;
  ForeColor = RGB(0,0,255)
 
 ADD OBJECT edit1 AS editbox WITH ;
  FontSize = 7, ;
  Height = 94, ;
  Left = 3, ;
  ReadOnly = .T., ;
  Top = 3, ;
  Width = 521
 
 ADD OBJECT command1 AS commandbutton WITH ;
  Top = 138, ;
  Left = 396, ;
  Height = 27, ;
  Width = 108, ;
  Caption = "Connect"
 
 ADD OBJECT text1 AS textbox WITH ;
  Height = 23, ;
  InputMask = "#", ;
  Left = 133, ;
  Top = 124, ;
  Width = 30
 
 ADD OBJECT text2 AS textbox WITH ;
  Height = 23, ;
  Left = 133, ;
  Top = 150, ;
  Width = 87
 
  
 PROCEDURE Init
 
  SET TALK OFF
  SET BELL OFF
  SET CENTURY ON
 
  thisform.edit1.Value="This demo is only show how this technology interact with VFP"+CHR(013)+CHR(013)+;
  "For further information, you can visit http://www.forum.nokia.com "+CHR(013)+CHR(013)+;
  "Best Regards, "+CHR(013)+CHR(013)+;
  "Handi Rusli"
 
  thisform.text1.Value = thisform.sms.CommPort
  thisform.text2.Value = thisform.sms.settings
 
 ENDPROC
 
 PROCEDURE command1.Click
 
  IF this.Caption="Connect"
   =MESSAGEBOX("If you are using IrDA, make sure that IrDA Module has been activated in your Mobile Phone"+CHR(013)+;
   " and Virtual Infrared COM Port has been installed in your PC."+CHR(013)+CHR(013)+;
   "Press 'OK' if you are ready",48,"Warning")
   thisform.sms.PortOpen = .t.
   WITH thisform.pageframe1.page3
    .text1.value = thisform.sms.ManufacturerInfo()
    .text2.value = thisform.sms.ModelInfo()
    .text3.value = thisform.sms.IMEIInfo()
    .edit1.value = thisform.sms.FirmwareInfo()
   ENDWITH
   thisform.pageframe1.page1.Activate
   this.Caption="Disconnect"
   WITH this.Parent
    STORE .f. to .text1.Enabled, .text2.enabled
   ENDWITH
   WITH thisform
    STORE .t. to .label5.visible,.label6.visible
   ENDWITH
  ELSE
   thisform.sms.PortOpen = .f.
   this.Caption="Connect"
   WITH this.Parent
    STORE .t. to .text1.Enabled, .text2.enabled
   ENDWITH
   WITH thisform.pageframe1.page3
    STORE "" TO .text1.value,.text2.value,.text3.value,.edit1.value
   ENDWITH
   WITH thisform
    STORE .f. to .label5.visible,.label6.visible
   ENDWITH
  ENDIF
 
 ENDPROC
 

 PROCEDURE text1.LostFocus
 
  thisform.sms.CommPort=this.Value
 
 ENDPROC
 

 PROCEDURE text2.LostFocus
 
  thisform.sms.Settings=ALLTRIM(this.Value)
 
 ENDPROC
 

ENDDEFINE
 
DEFINE CLASS mypageframe1 as PageFrame
 
 TabStyle = 1
 Top = 179
 Left = 0
 Width = 528
 Height = 196
 
 ADD OBJECT page1 as mypage1
 ADD OBJECT page2 as mypage2
 ADD OBJECT page3 as mypage3
 
ENDDEFINE
 
DEFINE CLASS mypage1 as Page
 
 FontBold = .T.
 Caption = "Read SMS"
 
 ADD OBJECT label1 AS myLabel WITH ;
  Caption = "Inbox No :", ;
  Height = 17, ;
  Left = 60, ;
  Top = 20, ;
  Width = 56
 
 ADD OBJECT label2 AS myLabel WITH ;
  Caption = "Pengirim (Sender) :", ;
  Height = 17, ;
  Left = 8, ;
  Top = 46, ;
  Width = 109
 
 ADD OBJECT label3 AS myLabel WITH ;
  Caption = "Sent Date :", ;
  Height = 17, ;
  Left = 60, ;
  Top = 69, ;
  Width = 57
 
 ADD OBJECT label4 AS myLabel WITH ;
  Caption = "Sent Time :", ;
  Height = 17, ;
  Left = 53, ;
  Top = 92, ;
  Width = 64
 
 ADD OBJECT label5 AS myLabel WITH ;
  Caption = "Pesan (Message) :", ;
  Height = 17, ;
  Left = 262, ;
  Top = 18, ;
  Width = 106
 
 ADD OBJECT spinner1 AS spinner WITH ;
  Height = 24, ;
  InputMask = "##", ;
  KeyboardHighValue = 15, ;
  KeyboardLowValue = 1, ;
  Left = 119, ;
  SpinnerHighValue =  15.00, ;
  SpinnerLowValue =   1.00, ;
  Top = 19, ;
  Width = 43, ;
  Value = 1
 
 ADD OBJECT text1 AS textbox WITH ;
  Height = 23, ;
  Left = 119, ;
  ReadOnly = .T., ;
  Top = 43, ;
  Width = 134
 

 ADD OBJECT text2 AS textbox WITH ;
  Height = 23, ;
  Left = 119, ;
  ReadOnly = .T., ;
  Top = 66, ;
  Width = 134
 
 ADD OBJECT text3 AS textbox WITH ;
  Height = 23, ;
  Left = 119, ;
  ReadOnly = .T., ;
  Top = 89, ;
  Width = 134
 
 ADD OBJECT edit1 AS editbox WITH ;
  Height = 109, ;
  Left = 262, ;
  ReadOnly = .T., ;
  Top = 38, ;
  Width = 254
 
 ADD OBJECT command1 AS commandbutton WITH ;
  Top = 116, ;
  Left = 138, ;
  Height = 27, ;
  Width = 84, ;
  Caption = "Delete"
 
 PROCEDURE Activate
 
  this.spinner1.InteractiveChange
 
 ENDPROC
 
 PROCEDURE spinner1.InteractiveChange
 
  IF thisform.sms.readsms(this.Value)
   WITH this.Parent
    .text1.Value = thisform.sms.pengirim
    .text2.Value = thisform.sms.tglkirim
    .text3.value = thisform.sms.jamkirim
    .edit1.value = thisform.sms.pesan
   ENDWITH
   this.Parent.command1.Enabled= .t.
  ELSE
   WITH this.Parent
    STORE "(Empty)" TO .text1.value,.text2.value,.text3.value,.edit1.value
   ENDWITH
   this.Parent.command1.Enabled= .F.
  ENDIF
 
 ENDPROC
 
 PROCEDURE command1.Click
 
  thisform.sms.deletesms(this.Parent.spinner1.Value)
  this.Parent.spinner1.InteractiveChange
 
 ENDPROC
 
ENDDEFINE
 
DEFINE CLASS mypage2 as Page
 
 FontBold = .T.
 Caption = "Send SMS"
 
 ADD OBJECT label1 AS myLabel WITH ;
  Caption = "Recipient Number :", ;
  Height = 17, ;
  Left = 50, ;
  Top = 23, ;
  Width = 128
 
 ADD OBJECT label2 AS myLabel WITH ;
  FontBold = .T., ;
  Caption = "* (Max. 160 Char(s))", ;
  Height = 17, ;
  Left = 167, ;
  Top = 105, ;
  Width = 149
 
 ADD OBJECT label3 AS myLabel WITH ;
  Caption = "Message :", ;
  Height = 17, ;
  Left = 100, ;
  Top = 50, ;
  Width = 44
 
 ADD OBJECT text1 AS textbox WITH ;
  Height = 23, ;
  Left = 167, ;
  Top = 21, ;
  Width = 132
 
 ADD OBJECT edit1 AS editbox WITH ;
  Height = 55, ;
  Left = 167, ;
  MaxLength = 160, ;
  Top = 48, ;
  Width = 321
 
 ADD OBJECT command1 AS commandbutton WITH ;
  Top = 127, ;
  Left = 220, ;
  Height = 27, ;
  Width = 84, ;
  Caption = "Send"
 
 PROCEDURE command1.Click
 
  IF thisform.sms.sendsms(ALLTRIM(this.Parent.teXT1.Value),ALLTRIM(this.Parent.ediT1.Value))
   =MESSAGEBOX("Message has been sent",64,"SMS Application using VFP")
  ELSE
   =MESSAGEBOX("Message has NOT been sent",16,"ERROR")
  ENDIF
 
 ENDPROC
 
ENDDEFINE
 
DEFINE CLASS mypage3 as Page
 
 FontBold = .T.
 Caption = "Mobile Phone Info"
 
 ADD OBJECT label1 AS myLabel WITH ;
  Caption = "Manufacturer Info :", ;
  Height = 17, ;
  Left = 66, ;
  Top = 24, ;
  Width = 102
 
 ADD OBJECT label2 AS myLabel WITH ;
  Caption = "Model Info :", ;
  Height = 17, ;
  Left = 104, ;
  Top = 48, ;
  Width = 64
  
 ADD OBJECT label3 AS myLabel WITH ;
  Caption = "Firmware Info :", ;
  Height = 17, ;
  Left = 85, ;
  Top = 94, ;
  Width = 83
 
 ADD OBJECT label4 AS myLabel WITH ;
  Caption = "Serial Number :", ;
  Height = 17, ;
  Left = 80, ;
  Top = 71, ;
  Width = 88
 
 ADD OBJECT text1 AS textbox WITH ;
  Height = 23, ;
  Left = 171, ;
  ReadOnly = .T., ;
  Top = 22, ;
  Width = 286
 
 ADD OBJECT text2 AS textbox WITH ;
  Height = 23, ;
  Left = 171, ;
  ReadOnly = .T., ;
  Top = 45, ;
  Width = 286
 
 ADD OBJECT edit1 AS editbox WITH ;
  Height = 53, ;
  Left = 171, ;
  ReadOnly = .T., ;
  Top = 91, ;
  Width = 286
 
 ADD OBJECT text3 AS textbox WITH ;
  Height = 23, ;
  Left = 171, ;
  ReadOnly = .T., ;
  Top = 68, ;
  Width = 286
 
ENDDEFINE
 
DEFINE CLASS myLabel as Label
 
 AutoSize = .T.
 BackStyle = 0
 
ENDDEFINE 
 
DEFINE CLASS mySMS as Container
 
 nTimeOut = 10
 CommPort = 4
 PortOpen = .f.
 Settings = "9600,N,8,1"
 myBuffer = ""
 
 Pengirim = ""
 UdahDiBaca = .t.
 TglKirim = ""
 JamKirim = ""
 Pesan = ""
 
 ADD OBJECT oSMS as myOLE
 
 PROCEDURE PortOpen_Assign
 LPARAMETERS newValue
 this.PortOpen = m.newValue
 IF this.PortOpen
  this.oSMS.Settings = this.Settings
  this.oSMS.InputLen = 0
  this.oSMS.CommPort = this.CommPort
  this.oSMS.Handshaking = 3 && Setting Buffer
 ENDIF
 this.oSMS.PortOpen = this.PortOpen
 IF this.PortOpen
  *!* Memerintahkan HP/Modem untuk berjalan di Mode Teks
  this.SendReceiveData("AT+CMGF=1")
  *!* Memerintahkan HP/Modem untuk mem-"ByPass" SMS yg masuk langsung ke PC (tidak disimpan ke SIM Card)
  this.SendReceiveData("AT+CNMI=2,2")
 ENDIF
 ENDPROC
 
 PROCEDURE SendReceiveData
 LPARAMETERS cString,lRemoveATCommand
 IF PCOUNT()=1
  lRemoveATCommand = .t.
 ENDIF
 LOCAL nWaktu as Long, lSendSMS as Boolean
 WITH this.oSMS
  STORE 0 TO .Rthreshold,.Sthreshold
  .InBufferCount = 0
  IF ("AT+CMGS=" $ cString)
   lSendSMS = .t.
  ELSE
   lSendSMS = .f.
  ENDIF
  .Output = cString + CHR(13)
  cString = ""
  nWaktu = SECONDS() + this.nTimeOut
  DO WHILE (nWaktu>SECONDS()) .and. ;
  IIF(lSendSMS,!(">" $ cString),(!("OK" $ cString) .and. !("ERROR" $ cString)))
   IF (.InBufferCount>0)
    cString = cString + .Input
   ENDIF
  ENDDO
  STORE 1 TO .Rthreshold,.Sthreshold
 ENDWITH
 IF lRemoveATCommand
  cString = SUBSTR(cString,AT(CHR(13),cString),RAT(CHR(13),cString,2)-AT(CHR(13),cString))
 ENDIF
 RETURN (cstring)
 ENDPROC
 
 PROCEDURE IMEIInfo
 RETURN STRTRAN(STRTRAN(this.SendReceiveData("AT+CGSN"),CHR(13),""),CHR(10),"")
 ENDPROC
 
 PROCEDURE ModelInfo
 RETURN STRTRAN(STRTRAN(this.SendReceiveData("AT+CGMM"),CHR(13),""),CHR(10),"")
 ENDPROC
 
 PROCEDURE ManufacturerInfo
    RETURN STRTRAN(STRTRAN(this.SendReceiveData("AT+CGMI"),CHR(13),""),CHR(10),"")
    ENDPROC
 
 PROCEDURE FirmwareInfo
 LOCAL cTemp as String
 cTemp = this.SendReceiveData("AT+CGMR")
 DO WHILE LEFT(cTemp,1)=CHR(13)
  cTemp = SUBSTR(cTemp,2)
 ENDDO
 DO WHILE LEFT(cTemp,1)=CHR(10)
  cTemp = SUBSTR(cTemp,2)
 ENDDO
    RETURN (cTemp)
    ENDPROC
    
 PROCEDURE NetworkFieldStrength
    RETURN (this.SendReceiveData("AT+CSQ"))
    ENDPROC
 
 PROCEDURE SendSMS
 LPARAMETERS tSMSNum, tMessage
 LOCAL cString
 cString = this.SendReceiveData("AT+CMGS=" + ["] + tSMSNum + ["],.f.)
 cString = this.SendReceiveData(tMessage + CHR(26),.f.)
    RETURN !("ERROR" $ cString)
    ENDPROC
 
 PROCEDURE DeleteSMS
 LPARAMETERS lSMSNum
    RETURN !("ERROR" $ this.SendReceiveData("AT+CMGD=" + TRANSFORM(lSMSNum) + CHR(13)))
 ENDPROC
 
 PROCEDURE ReadSMS
 LPARAMETERS tSMSNum
    LOCAL tChar, i, tRead, lQuoteNum, tDateTime, tData, balik
   
    TRY 
     tData = "AT+CMGR=" + TRANSFORM(tSMSNum) + CHR(13)
     WITH this.oSMS
      STORE 0 TO .Rthreshold,.Sthreshold
      .InBufferCount = 0
      .Output = tData
     ENDWITH
     tData = ""
     
     i = SECONDS() + this.nTimeOut
     DO WHILE (i > SECONDS()) .and. !("OK" $ tData) .and. !("ERROR" $ tData)
         IF (this.oSMS.InBufferCount > 0)
             tChar = this.oSMS.Input
             tData = tData + tChar
         ENDIF
     ENDDO
     
     STORE 1 TO this.oSMS.Rthreshold, this.oSMS.Sthreshold
        
     IF !EMPTY(tData) .and. !("ERROR" $ tData)
      lQuoteNum = 0
      STORE "" TO tRead, tSender, tDateTime, tMessage
         FOR i = 1 To LEN(tData)
             tChar = SUBSTR(tData, i, 1)
             IF tChar = ["] 
              lQuoteNum = lQuoteNum + 1
             ENDIF
             IF (lQuoteNum = 1) .and. !(tChar=["])
              tRead = tRead + tChar
             ENDIF
             IF (lQuoteNum = 3) .and. !(tChar=["])
              tSender = tSender + tChar
             ENDIF
             IF (lQuoteNum = 5) .and. !(tChar=["])
              tDateTime = tDateTime + tChar
             ENDIF
             IF (lQuoteNum = 6) .and. !(tChar=["])
              tMessage = tMessage + tChar
             ENDIF
         ENDFOR
         this.UdahDiBaca = (tRead = "REC READ")
         this.Pengirim = tSender
         this.TglKirim = LEFT(tDateTime, 8)
         this.JamKirim = SUBSTR(tDateTime,10,8)
         tMessage = RIGHT(tMessage,LEN(tMessage)-2)
         this.Pesan = SUBSTR(tMessage, 1, AT(CHR(13),tMessage) - 1)
         balik = .t.
     ENDIF
    CATCH
     balik = .f.
 ENDTRY
 RETURN (balik)
 ENDPROC
 
ENDDEFINE
 
DEFINE CLASS myOLE as OLEControl
 
 OLEClass = "MSCommLib.MSComm.1"
 
 PROCEDURE OnComm
  IF (this.CommEvent = 2) .and. (this.InBufferCount>0)
   this.parent.myBuffer = this.Input
      IF !EMPTY(this.parent.myBuffer) .and. !("ERROR" $ this.parent.myBuffer)
       lQuoteNum = 0
       STORE "" TO tSender, tDateTime, tMessage
          FOR i = 1 To LEN(this.parent.myBuffer)
              tChar = SUBSTR(this.parent.myBuffer, i, 1)
              IF tChar = ["] 
               lQuoteNum = lQuoteNum + 1
              ENDIF
              IF (lQuoteNum = 1) .and. !(tChar=["])
               tSender = tSender + tChar
              ENDIF
              IF (lQuoteNum = 3) .and. !(tChar=["])
               tDateTime = tDateTime + tChar
              ENDIF
              IF (lQuoteNum = 4) .and. !(tChar=["])
               tMessage = tMessage + tChar
              ENDIF
          ENDFOR
          WITH this.parent
           .UdahDiBaca = .f.
           .Pengirim = tSender
           .TglKirim = LEFT(tDateTime, 8)
           .JamKirim = SUBSTR(tDateTime,10,8)
           .Pesan = ALLTRIM(tMessage)
           =MESSAGEBOX("Sender : "+.Pengirim+CHR(013)+;
           "Date : "+.tglkirim+CHR(013)+;
           "Time : "+.jamkirim+CHR(013)+;
           "Message : "+.pesan,64,"Incoming SMS Received !!",5000)
    ENDWITH
      ENDIF
  ENDIF
 ENDPROC
 
ENDDEFINE