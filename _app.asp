<%'/*
'**********************************************
'      /\      | (_)
'     /  \   __| |_  __ _ _ __  ___
'    / /\ \ / _` | |/ _` | '_ \/ __|
'   / ____ \ (_| | | (_| | | | \__ \
'  /_/    \_\__,_| |\__,_|_| |_|___/
'               _/ | Digital Agency
'              |__/
'**********************************************
'* Project  : RabbitCMS
'* Developer: <Anthony Burak DURSUN>
'* E-Mail   : badursun@adjans.com.tr
'* Corp     : https://adjans.com.tr
'**********************************************
' LAST UPDATE: 28.10.2022 15:33 @badursun
'**********************************************
'*/
Class Page_Loading_Effect_Plugin
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Variables
	'---------------------------------------------------------------
	'*/
	Private PLUGIN_CODE, PLUGIN_DB_NAME, PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_CREDITS, PLUGIN_GIT, PLUGIN_DEV_URL, PLUGIN_FILES_ROOT, PLUGIN_ICON, PLUGIN_REMOVABLE, PLUGIN_ROOT, PLUGIN_FOLDER_NAME, PLUGIN_AUTOLOAD
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Variables
	'---------------------------------------------------------------
	'*/
	Private ACTIVE, LOGO, COLOR_1, COLOR_2, COLOR_3, COLOR_BG
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Register Class
	'---------------------------------------------------------------
	'*/
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Register Class
	'---------------------------------------------------------------
	'*/
	Public Property Get class_register()
		DebugTimer ""& PLUGIN_CODE &" class_register() Start"
		'/*
		'---------------------------------------------------------------
		' Check Register
		'---------------------------------------------------------------
		'*/
		If CheckSettings("PLUGIN:"& PLUGIN_CODE &"") = True Then 
			DebugTimer ""& PLUGIN_CODE &" class_registered"
			Exit Property
		End If
		'/*
		'---------------------------------------------------------------
		' Plugin Settings
		'---------------------------------------------------------------
		'*/
		a=GetSettings("PLUGIN:"& PLUGIN_CODE &"", PLUGIN_CODE&"_")
		a=GetSettings(""&PLUGIN_CODE&"_PLUGIN_NAME", PLUGIN_NAME)
		a=GetSettings(""&PLUGIN_CODE&"_CLASS", "Page_Loading_Effect_Plugin")
		a=GetSettings(""&PLUGIN_CODE&"_REGISTERED", ""& Now() &"")
		a=GetSettings(""&PLUGIN_CODE&"_CODENO", "0")
		a=GetSettings(""&PLUGIN_CODE&"_FOLDER", PLUGIN_FOLDER_NAME)

	    a=GetSettings(""&PLUGIN_CODE&"_LOGO", "none.jpg")
	    a=GetSettings(""&PLUGIN_CODE&"_COLOR_1", "#1d2949")
	    a=GetSettings(""&PLUGIN_CODE&"_COLOR_2", "#ec642f")
	    a=GetSettings(""&PLUGIN_CODE&"_COLOR_3", "#1d2949")
	    a=GetSettings(""&PLUGIN_CODE&"_COLOR_BG", "#ffffff")
		'/*
		'---------------------------------------------------------------
		' Register Settings
		'---------------------------------------------------------------
		'*/
		DebugTimer ""& PLUGIN_CODE &" class_register() End"
	End Property
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Register Class End
	'---------------------------------------------------------------
	'*/
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Settings Panel
	'---------------------------------------------------------------
	'*/
	Public sub LoadPanel()
		'/*
		'--------------------------------------------------------
		' Sub Page
		'--------------------------------------------------------
		'*/
		If Query.Data("Page") = "SHOW:CachedFiles" Then
			Call PluginPage("Header")

			Call PluginPage("Footer")
			Call SystemTeardown("destroy")
		End If
		'/*
		'--------------------------------------------------------
		' Main Page
		'--------------------------------------------------------
		'*/
		With Response
			'------------------------------------------------------------------------------------------
				PLUGIN_PANEL_MASTER_HEADER This()
			'------------------------------------------------------------------------------------------
			.Write "<link rel=""stylesheet"" href=""/content/plugins/Page-Loading-Effect-Plugin/dist/app.css"" />"
			.Write "<div class=""row"">"
			.Write "    <div class=""col-lg-12 col-sm-12"">"
			.Write 			QuickSettings("fileajax", "PAGE_LOADER_LOGO", "Logo <sup>(400x400 ??nerilen)</sup>", PLUGIN_FILES_ROOT, TO_DB)
			.Write "    </div>"
			.Write "    <div class=""col-lg-6 col-sm-12"">"
			.Write 			QuickSettings("color", ""& PLUGIN_CODE &"_COLOR_1", "Birinci Renk", "", TO_DB)
			.Write "    </div>"
			.Write "    <div class=""col-lg-6 col-sm-12"">"
			.Write 			QuickSettings("color", ""& PLUGIN_CODE &"_COLOR_2", "??kinci Renk", "", TO_DB)
			.Write "    </div>"
			.Write "    <div class=""col-lg-6 col-sm-12"">"
			.Write 			QuickSettings("color", ""& PLUGIN_CODE &"_COLOR_3", "??????nc?? Renk", "", TO_DB)
			.Write "    </div>"
			.Write "    <div class=""col-lg-6 col-sm-12"">"
			.Write 			QuickSettings("color", ""& PLUGIN_CODE &"_COLOR_BG", "Arka Plan Rengi", "", TO_DB)
			.Write "    </div>"
			.Write "</div>"
			.Write "<div class=""row mt-2"">"
			.Write "    <div class=""col-lg-12 col-sm-12 mb-2"">"
			.Write "    	<h5 class=""m-0 p-0"">Haz??r Renk Paletleri</h5>"
			.Write "    </div>"
			.Write "    <div class=""col-lg-12 col-sm-12 color-palette"">"
			.Write "		<a href=""#"" data-color=""6C4AB6|8D72E1|8D9EFF|B9E0FF""></a> "
			.Write "		<a href=""#"" data-color=""404258|474E68|50577A|6B728E""></a> "
			.Write "		<a href=""#"" data-color=""FFE1E1|90A17D|829460|EEEEEE""></a> "
			.Write "		<a href=""#"" data-color=""E14D2A|FD841F|3E6D9C|001253""></a> "
			.Write "		<a href=""#"" data-color=""F0FF42|82CD47|54B435|379237""></a> "
			.Write "		<a href=""#"" data-color=""000000|CF0A0A|DC5F00|EEEEEE""></a> "
			.Write "		<a href=""#"" data-color=""EA047E|FF6D28|FCE700|00F5FF""></a> "
			.Write "		<a href=""#"" data-color=""FFF8EA|9E7676|815B5B|594545""></a> "
			.Write "		<a href=""#"" data-color=""425F57|749F82|A8E890|CFFF8D""></a> "
			.Write "		<a href=""#"" data-color=""3330E4|F637EC|FBB454|FAEA48""></a> "
			.Write "    </div>"
			.Write "</div>"
	    	.Write "<script type=""text/javascript"" src=""/content/plugins/Page-Loading-Effect-Plugin/dist/app.js""></script>"
		End With
	End Sub
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Settings Panel
	'---------------------------------------------------------------
	'*/
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Class Initialize
	'---------------------------------------------------------------
	'*/
	Private Sub class_initialize()
		'/*
		'-----------------------------------------------------------------------------------
		' REQUIRED: PluginTemplate Main Variables
		'-----------------------------------------------------------------------------------
		'*/
    	PLUGIN_CODE  			= "PAGE_LOADER"
    	PLUGIN_NAME 			= "Page Loading Effect Plugin"
    	PLUGIN_VERSION 			= "1.0.0"
    	PLUGIN_GIT 				= "https://github.com/RabbitCMS-Hub/Page-Loading-Effect-Plugin"
    	PLUGIN_DEV_URL 			= "https://adjans.com.tr"
    	PLUGIN_ICON 			= "zmdi-time-interval"
    	PLUGIN_CREDITS 			= "@badursun Anthony Burak DURSUN"
    	PLUGIN_FOLDER_NAME 		= "Page-Loading-Effect-Plugin"
    	PLUGIN_DB_NAME 			= ""
    	PLUGIN_REMOVABLE 		= True
    	PLUGIN_AUTOLOAD 		= True
    	PLUGIN_ROOT 			= PLUGIN_DIST_FOLDER_PATH(This)
    	PLUGIN_FILES_ROOT 		= PLUGIN_VIRTUAL_FOLDER(This)
		'/*
		'-----------------------------------------------------------------------------------
		' REQUIRED: PluginTemplate Main Variables
		'-----------------------------------------------------------------------------------
		'*/
		'/*
    	'-------------------------------------------------------------------------------------
    	' PluginTemplate Main Variables
    	'-------------------------------------------------------------------------------------
		'*/
	    ACTIVE 		= Cint( GetSettings("PAGE_LOADER_ACTIVE", "0") )
	    LOGO 		= GetSettings("PAGE_LOADER_LOGO", "none.jpg")
	    COLOR_1 	= GetSettings("PAGE_LOADER_COLOR_1", "#1d2949")
	    COLOR_2 	= GetSettings("PAGE_LOADER_COLOR_2", "#ec642f")
	    COLOR_3 	= GetSettings("PAGE_LOADER_COLOR_3", "#1d2949")
	    COLOR_BG 	= GetSettings("PAGE_LOADER_COLOR_BG", "#ffffff")
		'/*
		'-----------------------------------------------------------------------------------
		' REQUIRED: Register Plugin to CMS
		'-----------------------------------------------------------------------------------
		'*/
		class_register()
		'/*
		'-----------------------------------------------------------------------------------
		' REQUIRED: Hook Plugin to CMS Auto Load Location WEB|API|PANEL
		'-----------------------------------------------------------------------------------
		'*/
		If ACTIVE = 1 AND PLUGIN_AUTOLOAD_AT("WEB") = True Then 
			Cms.BodyData = Init()
			Cms.FooterData = "<script>setTimeout(()=>{document.body.classList.add('loaded');setTimeout(()=>{document.getElementById('loader-wrapper').remove();document.getElementById('loaderstyle').remove()},1500);},200);</script>"
		End If
	End Sub
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Class Initialize
	'---------------------------------------------------------------
	'*/
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Class Terminate
	'---------------------------------------------------------------
	'*/
	Private sub class_terminate()

	End Sub
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Class Terminate
	'---------------------------------------------------------------
	'*/
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Manager Exports
	'---------------------------------------------------------------
	'*/
	Public Property Get PluginCode() 		: PluginCode = PLUGIN_CODE 					: End Property
	Public Property Get PluginName() 		: PluginName = PLUGIN_NAME 					: End Property
	Public Property Get PluginVersion() 	: PluginVersion = PLUGIN_VERSION 			: End Property
	Public Property Get PluginGit() 		: PluginGit = PLUGIN_GIT 					: End Property
	Public Property Get PluginDevURL() 		: PluginDevURL = PLUGIN_DEV_URL 			: End Property
	Public Property Get PluginFolder() 		: PluginFolder = PLUGIN_FILES_ROOT 			: End Property
	Public Property Get PluginIcon() 		: PluginIcon = PLUGIN_ICON 					: End Property
	Public Property Get PluginRemovable() 	: PluginRemovable = PLUGIN_REMOVABLE 		: End Property
	Public Property Get PluginCredits() 	: PluginCredits = PLUGIN_CREDITS 			: End Property
	Public Property Get PluginRoot() 		: PluginRoot = PLUGIN_ROOT 					: End Property
	Public Property Get PluginFolderName() 	: PluginFolderName = PLUGIN_FOLDER_NAME 	: End Property
	Public Property Get PluginDBTable() 	: PluginDBTable = IIf(Len(PLUGIN_DB_NAME)>2, "tbl_plugin_"&PLUGIN_DB_NAME, "") 	: End Property
	Public Property Get PluginAutoload() 	: PluginAutoload = PLUGIN_AUTOLOAD 			: End Property

	Private Property Get This()
		This = Array(PluginCode, PluginName, PluginVersion, PluginGit, PluginDevURL, PluginFolder, PluginIcon, PluginRemovable, PluginCredits, PluginRoot, PluginFolderName, PluginDBTable, PluginAutoload)
	End Property
	'/*
	'---------------------------------------------------------------
	' REQUIRED: Plugin Manager Exports
	'---------------------------------------------------------------
	'*/
	'/*
	'---------------------------------------------------------------
	'
	'---------------------------------------------------------------
	'*/
	Public Property Get Init()
        With Response
        	.Write "<style id=""loaderstyle"">:root{--loader-renk1:"& COLOR_1 &";--loader-renk2:"& COLOR_2 &";--loader-renk3:"& COLOR_3 &";--loader-bg:"& COLOR_BG &";} #loaderBG{background-image:url('"&PLUGIN_FILES_ROOT & LOGO &"') !important;} #loaderBG {background-image: url(../images/loaderbg.png);border-radius: 50%;background-size: cover;background-repeat: no-repeat;background-position: center center;}#loader-wrapper .loader-section { position: fixed;top: 0;width: 51%;height: 100%;background: var(--loader-bg);-moz-transition: all 0.5s ease-in;-webkit-transition: all 0.5s ease-in;-o-transition: all 0.5s ease-in;transition: all 0.5s ease-in;z-index: 999999999;background-color: var(--loader-bg);} #loader-wrapper .loader-section.section-left {left: 0;}#loader-wrapper .loader-section.section-right {right: 0;}#loader-wrapper { position: fixed;top: 0;left: 0;width: 100%;height: 100%;z-index: 9999999999;} #loaderBG { display: block;position: relative;left: 50%;top: 50%;width: 100px;height: 100px;margin:-125px 0 0 -50px;background-position:center center;background-repeat: no-repeat;z-index: 1000000001;} #loader { display: block;position: relative;left:50%;top:50%;width:150px;height: 150px;margin: -75px 0 0 -75px;border-radius: 50%;border: 3px solid transparent;border-top-color: var(--loader-renk1);-webkit-animation: spin 2s linear infinite;animation: spin 2s linear infinite;z-index: 99999999999;} #loader:before { content:'';position: absolute;top: 5px;left: 5px;right: 5px;bottom: 5px;border-radius: 50%;border: 3px solid transparent;border-top-color: var(--loader-renk2);-webkit-animation: spin 3s linear infinite;animation: spin 3s linear infinite;} #loader:after { content: '';position: absolute;top: 15px;left: 15px;right: 15px;bottom: 15px;border-radius: 50%;border: 3px solid transparent;border-top-color: var(--loader-renk3);-webkit-animation: spin 1.5s linear infinite;animation: spin 1.5s linear infinite;}.loaded #loader-wrapper { visibility: hidden;}.loaded #loader-wrapper .loader-section.section-left{-webkit-transform: translateX(-100%);-ms-transform: translateX(-100%);transform: translateX(-100%);-webkit-transition: all 0.7s 0.3s cubic-bezier(0.645, 0.045, 0.355, 1.000);transition: all 0.7s 0.3s cubic-bezier(0.645, 0.045, 0.355, 1.000);} .loaded #loader-wrapper .loader-section.section-right{-webkit-transform: translateX(100%);-ms-transform: translateX(100%);transform: translateX(100%);-webkit-transition: all 0.7s 0.3s cubic-bezier(0.645, 0.045, 0.355, 1.000);transition: all 0.7s 0.3s cubic-bezier(0.645, 0.045, 0.355, 1.000);} .loaded #loader { opacity: 0;-webkit-transition: all 0.3s ease-out;transition: all 0.3s ease-out;}@-webkit-keyframes spin { 0% { -webkit-transform: rotate(0deg);-ms-transform: rotate(0deg);transform: rotate(0deg);} 100% { -webkit-transform: rotate(360deg);-ms-transform: rotate(360deg);transform: rotate(360deg);}} @keyframes spin{0% { -webkit-transform: rotate(0deg);-ms-transform: rotate(0deg);transform: rotate(0deg);} 100% { -webkit-transform: rotate(360deg);-ms-transform: rotate(360deg);transform: rotate(360deg);}}</style>"
        	
        	.Write "<div id=""loader-wrapper"">"
	        	.Write "<div id=""loader""></div>"
	        	.Write "<div id=""loaderBG""></div>"
	        	.Write "<div class=""loader-section section-left""></div>"
	        	.Write "<div class=""loader-section section-right""></div>"
        	.Write "</div>"
        End With
	End Property
	'/*
	'---------------------------------------------------------------
	'
	'---------------------------------------------------------------
	'*/
End Class 

%>
