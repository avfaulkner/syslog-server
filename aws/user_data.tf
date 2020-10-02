data "template_file" "user_data" {
  template = "${file("templates/userdata.sh.tmpl")}"

}
output "user_data_common" {
  value = "${data.template_file.user_data.rendered}"
}