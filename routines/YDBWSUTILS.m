YDBWSUTILS ; YottaDB Utilities Entry Point; 05-07-2021
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
	;
RunShellCommand(COMMAND,RET) 	D RunShellCommand^YDBWSUTILS2(.COMMAND,.RET) Q
DirectoryExists(PATH) 			Q $$DirectoryExists^YDBWSUTILS2(.PATH)
CreateDirectoryTree(PATH) 		Q $$CreateDirectoryTree^YDBWSUTILS2(.PATH)
GetRoutineList(RTNS,PATTERN) 	D GetRoutineList^YDBWSUTILS2(.RTNS,.PATTERN) Q
GetGlobalList(GLBLS,PATTERN)	D GetGlobalList^YDBWSUTILS2(.GLBLS,.PATTERN) Q
FileExists(PATH)				Q $$FileExists^YDBWSUTILS2(.PATH)
ReadFileByLine(FILE,RET)		D ReadFileByLine^YDBWSUTILS2(.FILE,.RET) Q
ReadFileByChunk(FILE,CHUNK,RET) D ReadFileByChunk^YDBWSUTILS2(.FILE,.CHUNK,.RET) Q
WriteFile(FILE,DATA)			D WriteFile^YDBWSUTILS2(.FILE,.DATA) Q
UP(STR)							Q $$UP^YDBWSUTILS2(.STR)
LOW(STR)						Q $$LOW^YDBWSUTILS2(.STR)
RoutinePaths(RET)				D RoutinePaths^YDBWSUTILS1(.RET) Q
DeleteFile(FILE)				D DeleteFile^YDBWSUTILS1(.FILE) Q
	;							
	;
	;