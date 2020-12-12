    // To get OS installation date we'll need to check system log file and find entry which contains installation date
var systemDates : String? = nil
do {
    let fullSystemLog = try NSString(contentsOf: URL(fileURLWithPath: "/var/log/install.log"), encoding: String.Encoding.utf8.rawValue)
    let entries = fullSystemLog.components(separatedBy: "\n")
    //Filter to get only entries about OS installation
    let filtered = entries.filter{ entry in
        return entry.contains("OSInstaller") && entry.contains("Install Complete") //Markers telling that OS was installed
    }

    var latestMention = ""
    if filtered.count > 0 {
        //If 1 or more entries found we'll pick last one
        latestMention = filtered.last!
    }
    else if entries.count > 0 {
        //If there are 0 mentions of OS installation - we'll use first entry in logs
        latestMention = entries.first!
    }

    //parse picked entry for date
    do {
        let regex = try NSRegularExpression(pattern: ".+:[0-9]{2}", options: [])
        let nsString = latestMention as NSString
        let results = regex.matches(in: latestMention,
                                    options: [], range: NSMakeRange(0, nsString.length))
        let actualDateSubstrings = results.map { nsString.substring(with: $0.range)}

        if let dateStringFromMention = actualDateSubstrings.first {

            systemDates = dateStringFromMention
        }
        else {
            systemDates = "<Error: no date results>"
        }

    } catch let error as NSError {
        systemDates = "<Error: invalid regex: \(error.localizedDescription)>"
    }
} 
catch {
    systemDates = "<Error: system log file not found>"
}

print("\tSYSTEM INSTALLED: \(systemDates)")