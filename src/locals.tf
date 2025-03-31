locals {
  # name vm_web
  vm_web_name = "${var.vm_name_prefix}-${var.vm_env}-${var.vm_platform}-${var.vm_type_web}"

  # name vm_db
  vm_db_name = "${var.vm_name_prefix}-${var.vm_env}-${var.vm_platform}-${var.vm_type_db}"
}
