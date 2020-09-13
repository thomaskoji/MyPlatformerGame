persistent = true;

if(instance_number(object_index) > 1)
{
	show_message("EXTRA SINGLETON CREATED: " + string(object_get_name(object_index)));
}