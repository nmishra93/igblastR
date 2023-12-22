# Nitesh Mishra
# R port for the perl script provided in igblast package
# Define a function to update fasta file names in a directory
edit_imgt_file <- function(directory_path) {
    # Get a list of fasta files in the directory
    fasta_files <- list.files(
        path = directory_path,
        pattern = "\\.fasta$",
        full.names = TRUE
    )

    # Define the regular expression
    regex_pattern <- "^>[^|]+\\|([^|]+)\\|.*"

    # Define a helper function to update names and write to file
    update_and_write <- function(file_path) {
        fasta_lines <- readLines(file_path)
        updated_names <- gsub(regex_pattern, ">\\1", fasta_lines)
        writeLines(updated_names, file_path)
    }

    # Use lapply to apply the helper function to each fasta file
    lapply(fasta_files, update_and_write)
    invisible()
}

# Update the names for all fasta files in the 'rhesus' directory
edit_imgt_file("db/rhesus_db")
