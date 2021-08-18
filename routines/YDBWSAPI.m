YDBWSAPI ; YottaDB Web Server API Entry Point; 05-07-2021
	;#################################################################
	;#                                                               #
	;# Copyright (c) 2021 YottaDB LLC and/or its subsidiaries.       #
	;# All rights reserved.                                          #
	;#                                                               #
	;#   This source code contains the intellectual property         #
	;#   of its copyright holder(s), and is made available           #
	;#   under a license.  If you do not know the terms of           #
	;#   the license, please stop and do not read further.           #
	;#                                                               #
	;#################################################################		
	Q
	;
API(%Q,%R,%A)
	s $ET="D ERR^%YDBWSAPI"
	N %J
	S %R("mime")="application/json"
	S %R("header","Access-Control-Allow-Origin")="*"
	S %R("header","Access-Control-Allow-Headers")="Origin, X-Requested-With, Content-Type, Accept"
	I '$D(@%Q("body")) Q
	N %RR D DECODE^YDBWS(%Q("body"),"%RR")
	N %ROUTINE S %ROUTINE=%RR("routine")
	K %RR("routine") K %J
	N (%RR,%J,%WTCP,%ROUTINE,%Q,%R,%A,%YDBWSRESP)
	D @(%ROUTINE_"(.%RR,.%J)")
	K @%R D ENCODE^YDBWS("%J",%R)
	Q
	;
SERVESTATIC(%Q,%R,%A)	
	N PATH S PATH=$G(%Q("path")) 
	I PATH="" S PATH="/YDBWebSockets/index.html"
	I PATH="/" S PATH="/YDBWebSockets/index.html"
	I PATH="/YDBWebSockets" S PATH="/YDBWebSockets/index.html"
	I PATH="/YDBWebSockets/" S PATH="/YDBWebSockets/index.html"
	I $E(PATH,1,9)'="/YDBWebSockets/" D SETERROR^%YDBWS(404) Q
	N FILEPATHS
	S FILEPATH="dist/spa/"_$E(PATH,10,$L(PATH))
	I $P(FILEPATH,".",$L(FILEPATH,"."))["?" D
	. S $P(FILEPATH,".",$L(FILEPATH,"."))=$P($P(FILEPATH,".",$L(FILEPATH,".")),"?")
	I '$$FileExists^YDBWSUTILS(FILEPATH) D
	. S FILEPATH="dist/spa/index.html"
	N EXT S EXT=$P(FILEPATH,".",$L(FILEPATH,"."))
	S %R("mime")=$$GetMimeType^YDBWS(EXT)
	N OUTPUT
	D ReadFileByChunk^YDBWSUTILS(FILEPATH,4080,.OUTPUT)
	M @%R=OUTPUT
	Q
	;	
PING(I,O)
	S O("data","RESULT")="PONG"
	Q
	;
ERR ;
	Q
	;
WS(request,response,arguments)
	m ^AHM($I(^AHM))=HTTPREQ
	s @response@(1)=1
	quit