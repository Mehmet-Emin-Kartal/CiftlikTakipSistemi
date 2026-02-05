<cfcomponent>
    <cffunction name="getEmployees" access="public" returntype="query">
        <cfquery name="qStaff" datasource="ciftlik1">
            SELECT EmployeeID, FullName, Role, HireDate, Salary, JobDescription 
            FROM dbo.Employees 
            ORDER BY HireDate DESC
        </cfquery>
        <cfreturn qStaff>
    </cffunction>

    <cffunction name="addEmployee" access="public" returntype="void">
        <cfargument name="name" type="string" required="true">
        <cfargument name="role" type="string" required="true">
        <cfargument name="sal" type="numeric" required="true">
        <cfargument name="jobDesc" type="string" required="true">
        
        <cfquery datasource="ciftlik1">
            INSERT INTO dbo.Employees (FullName, Role, Salary, JobDescription, HireDate)
            VALUES (
                <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_nvarchar">,
                <cfqueryparam value="#arguments.role#" cfsqltype="cf_sql_nvarchar">,
                <cfqueryparam value="#arguments.sal#" cfsqltype="cf_sql_decimal">,
                <cfqueryparam value="#arguments.jobDesc#" cfsqltype="cf_sql_nvarchar">,
                CAST(GETDATE() AS DATE)
            )
        </cfquery>
    </cffunction>

    <cffunction name="deleteEmployee" access="public" returntype="void">
      <cfargument name="empID" type="numeric" required="true">
    
      <cfquery name="qDelete" datasource="ciftlik1">
            DELETE FROM dbo.Employees 
            WHERE EmployeeID = <cfqueryparam value="#arguments.empID#" cfsqltype="cf_sql_integer">
      </cfquery>
    </cffunction>
</cfcomponent>