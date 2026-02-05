component {
    public query function getAnimals() {
        var qryAnimals = queryExecute("
            SELECT AnimalID, EarTagNumber, Breed, BirthDate, CurrentStatus
            FROM dbo.Animals 
            ORDER BY BirthDate DESC
        ", {}, {datasource="ciftlik1"});
        
        return qryAnimals;
    }
}