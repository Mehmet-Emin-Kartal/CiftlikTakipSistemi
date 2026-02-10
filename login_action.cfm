<cfquery name="checkUser" datasource="ciftlik1">
    SELECT * FROM Users 
    WHERE UserName = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
    AND Password = <cfqueryparam value="#form.password#" cfsqltype="cf_sql_varchar">
</cfquery>

<cfif checkUser.RecordCount GT 0>
    <cfset session.isLoggedIn = true>
    <cfset session.userName = checkUser.UserName>
    <cflocation url="index.cfm" addtoken="false">
<cfelse>
    <cflocation url="login.cfm?error=1" addtoken="false">
</cfif>