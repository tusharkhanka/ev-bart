EisenVault Alfresco BART
1. Install Dependency 
    $ sudo ./prepare.sh
2. Configure alfresco-bart.properties 
    According to need ev-bart offers backup type on line 138
    use s3, ftp, scp, local
3. Run ev-bart
    alfresco-bart.sh <mode> [set] [date <dest>]
    Modes:
        backup [set]	runs an incremental backup or a full if first time
        restore [set] [date] [dest]	runs the restore, wizard if no arguments
        verify [set]	verifies the backup
        collection [set]	shows all the backup sets in the archive
        list [set]		lists the files currently backed up in the archive

    Sets:
        all		do all backup sets
        index	use index backup set (group) for selected mode
        db		use data base backup set (group) for selected mode
        cs		use content store backup set (group) for selected mode
        files	use rest of files backup set (group) for selected mode
