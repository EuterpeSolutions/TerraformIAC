# ESHomepage
Terraform setup for uploading and managing the Euterpe Solutions homepage.

## Usage
* Clone the repo
* Run `terraform init` to install the needed providers
* Edit the **SRC** variable in the `files.sh` script to the location of the angular src code
* Run `./files.sh` to generate the `files.tf` file with all the files needed to upload
* Edit the `main.tf` file variable **source_code_directory** to point to the src code directory
* Run `terraform plan` to test out the terraform upload
* Run `terraform apply` to upload the code
