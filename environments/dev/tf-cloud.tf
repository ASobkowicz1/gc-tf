terraform {
  cloud {
    organization = "AdamsssTF"
    
    workspaces {
      name = "gc-tf"
    }
  }
}