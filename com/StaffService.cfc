<cfcomponent>
    <cffunction name="getEmployees" access="public" returntype="query">
        <cfquery name="qStaff" datasource="ciftlik1">
            SELECT 
                EmployeeID, 
                FullName, 
                Role, 
                HireDate, 
                Salary,  
                PhoneNumber, 
                BloodGroup, 
                HomeAddress, 
                IsActive, 
                TC_No,  Email 
            FROM dbo.Employees 
            WHERE IsActive = 1 
            ORDER BY HireDate ASC, EmployeeID ASC
        </cfquery>
        <cfreturn qStaff>
    </cffunction>

    <cffunction name="addEmployee" access="public" returntype="void">
        <cfargument name="name" type="string" required="true">
        <cfargument name="role" type="string" required="true">
        <cfargument name="sal" type="numeric" required="true">
        <cfargument name="phone" type="string" required="false" default="">
        <cfargument name="blood" type="string" required="false" default="">
        <cfargument name="address" type="string" required="false" default="">
        <cfargument name="tcNo" type="string" required="false" default="">
        <cfargument name="email" type="string" required="false" default="">
        
        <cfquery datasource="ciftlik1">
            INSERT INTO dbo.Employees (
                FullName, 
                Role, 
                Salary, 
                PhoneNumber, 
                BloodGroup, 
                HomeAddress, 
                HireDate, 
                IsActive, 
                TC_No, 
                Email
            )
            VALUES (
                <cfqueryparam value="#arguments.name#" cfsqltype="cf_sql_nvarchar">,
                <cfqueryparam value="#arguments.role#" cfsqltype="cf_sql_nvarchar">,
                <cfqueryparam value="#arguments.sal#" cfsqltype="cf_sql_decimal">,
                <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_nvarchar">,
                <cfqueryparam value="#arguments.blood#" cfsqltype="cf_sql_nvarchar">,
                <cfqueryparam value="#arguments.address#" cfsqltype="cf_sql_nvarchar">,
                CAST(GETDATE() AS DATE),
                1,
                <cfqueryparam value="#arguments.tcNo#" cfsqltype="cf_sql_nvarchar">,
                <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_nvarchar">
            )
        </cfquery>
    </cffunction>

    <cffunction name="deleteEmployee" access="public" returntype="void">
      <cfargument name="empID" type="numeric" required="true">
    
      <cfquery name="qDelete" datasource="ciftlik1">
            UPDATE dbo.Employees 
            SET IsActive = 0 
            WHERE EmployeeID = <cfqueryparam value="#arguments.empID#" cfsqltype="cf_sql_integer">
      </cfquery>
    </cffunction>
</cfcomponent>