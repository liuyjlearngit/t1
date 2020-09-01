def initializeDatabase() {
    sh 'curl ${domain}/download/dims-database-initializer-@project.version@-jar-with-dependencies.jar -o dims-database-initializer-@project.version@-jar-with-dependencies.jar'
    sh 'java -jar dims-database-initializer-@project.version@-jar-with-dependencies.jar jdbc:postgresql://localhost:5432/postgres ${template_username} ${template_password} ${template_database}'
}

def startBatch() {
    sh 'curl ${domain}/download/dims-batch-@project.version@.jar -o dims-batch-@project.version@.jar'
    sh 'java -jar -Xms1G -Xmx4G -Dspring.datasource.username=${template_username} -Dspring.datasource.password=${template_password} -Dspring.datasource.url="jdbc:postgresql://localhost:5432/${template_database}" -Ddims.url="${domain}" dims-batch-@project.version@.jar --job=dataCollector --province=${province} --specialty=${speciality}'
}

def startImport() {
    sh 'curl ${domain}/download/dims-data-issue-importer-@project.version@.jar -o dims-data-issue-importer-@project.version@.jar'
    sh 'java -jar -Xms1G -Xmx4G -Dspring.datasource.username=${data_username} -Dspring.datasource.password=${data_password} -Dspring.datasource.url=${data_url} dims-data-issue-importer-@project.version@.jar --province=${province} --specialty=${speciality}'
}

return this