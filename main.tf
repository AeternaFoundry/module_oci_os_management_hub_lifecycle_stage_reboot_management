resource "oci_os_management_hub_lifecycle_stage_reboot_management" "os_management_hub_lifecycle_stage_reboot_managements" {
  for_each = var.os_management_hub_lifecycle_stage_reboot_managements

  lifecycle_stage_id     = each.value.lifecycle_stage_id
  reboot_timeout_in_mins = each.value.reboot_timeout_in_mins

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "work_request_details" {
    for_each = each.value.work_request_details != null ? [each.value.work_request_details] : []
    content {
      description  = work_request_details.value.description
      display_name = work_request_details.value.display_name
    }
  }
}

