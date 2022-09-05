local status, column = pcall(require, "virt-column")
if not status then
	return
end

print("virt-column")
column.setup({
	virtcolumn = "*",
})
