class compinfo{
	file{"/tmp/comp_info":
	content => template("compinfo/comp_info.erb"),

        }
}
