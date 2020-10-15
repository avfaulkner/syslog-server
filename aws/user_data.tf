data "template_file" "user_data" {
  template = "${file("templates/userdata.sh.tmpl")}"

}
