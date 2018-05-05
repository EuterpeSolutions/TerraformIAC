# ESHomepage
Terraform setup for uploading and managing the Euterpe Solutions homepage.

## Setup
* Clone the repo
* Edit the following variables in the `files.sh` file
  * **SRC** - Location of the [EuterpeSolutionsHomepage](https://github.com/EuterpeSolutions/EuterpeSolutionsHomepage) repo
  * **DIST_SRC** - Location of the `/dist` folder from the built Angular components
* Edit the following variables in the `main.tf` file
  * **source_code_directory** - Location of the [EutpereSolutionsHomepage](https://github.com/EuterpeSolutions/EuterpeSolutionsHomepage) repo
## Usage
* Run `terraform init` to install the needed providers
* Run `./files.sh` to generate the `files.tf` file with all the files needed to upload
* Run `terraform plan` to test out the terraform upload
* Run `terraform apply` to upload the code
