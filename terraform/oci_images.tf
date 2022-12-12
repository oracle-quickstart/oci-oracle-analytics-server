variable "marketplace_source_images" {
  type = map(object({
    ocid = string
    is_pricing_associated = bool
    compatible_shapes = list(string)
  }))
  default = {
    main_mktpl_image = {
      ocid = "ocid1.image.oc1..aaaaaaaata4wxefv4cmugmwocb2q7k6dl6722qnwyeerg6m7nkotolpyxrpa"
      is_pricing_associated = true
      compatible_shapes = ["VM.Standard2.1" , "VM.Standard2.16" , "VM.Standard2.2" , "VM.Standard2.24" , "VM.Standard2.4" , "VM.Standard2.8" , "VM.Standard.E3.Flex" , "VM.Standard.E4.Flex"]
    }
    #Remove comment and add as many marketplace images that your stack references be replicated to other realms 
    #supporting_image = {
    #  ocid = "ocid1.image.oc1....."
    #  is_pricing_associated = true
    #  compatible_shapes = ["VM.Standard2.1" , "VM.Standard2.16" , "VM.Standard2.2" , "VM.Standard2.24" , "VM.Standard2.4" , "VM.Standard2.8" , "VM.Standard.E3.Flex" , "VM.Standard.E4.Flex"]
    #}
  }
}