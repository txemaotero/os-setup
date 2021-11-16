
function check_file_path(fname)
    if vim.fn.filereadable(fname) == 1 then
        return fname
    elseif vim.fn.filereadable(vim.fn.expand("%:p:h").."/"..fname) == 1 then
        return vim.fn.expand("%:p:h").."/"..fname
    else
        return nil
    end
end


function quick_look(fname)
    local path = check_file_path(fname)
    if path == nil then
        vim.notify("File not found: "..fname, "error")
        return
    end
    local handle = io.popen('qlmanage >/dev/null 2>/dev/null -p '..path)
    handle:close()
end


function quick_look_under_cursor()
    local fname = vim.fn.expand("<cfile>")
    quick_look(fname)
end

--- Get the region between two marks and the start and end positions for the region
 ---
 --@param mark1 Name of mark starting the region
 --@param mark2 Name of mark ending the region
 --@param options Table containing the adjustment function, register type and selection mode
 --@return region region between the two marks, as returned by |vim.region|
 --@return start (row,col) tuple denoting the start of the region
 --@return finish (row,col) tuple denoting the end of the region
 function vim.get_marked_region(mark1, mark2, options)
   local bufnr = 0
   local adjust = options.adjust or function(pos1, pos2)
     return pos1, pos2
   end
   local regtype = options.regtype or vim.fn.visualmode()
   local selection = options.selection or (vim.o.selection ~= 'exclusive')

   local pos1 = vim.fn.getpos(mark1)
   local pos2 = vim.fn.getpos(mark2)
   pos1, pos2 = adjust(pos1, pos2)

   local start = { pos1[2] - 1, pos1[3] - 1 + pos1[4] }
   local finish = { pos2[2] - 1, pos2[3] - 1 + pos2[4] }

   -- Return if start or finish are invalid
   if start[2] < 0 or finish[1] < start[1] then return end

   local region = vim.region(bufnr, start, finish, regtype, selection)
   return region, start, finish
 end


 --- Get the current visual selection as a string
 ---
 --@return selection string containing the current visual selection
 function vim.get_visual_selection()
   local bufnr = 0
   local visual_modes = {
     v = true,
     V = true,
     -- [t'<C-v>'] = true, -- Visual block does not seem to be supported by vim.region
   }

   -- Return if not in visual mode
   if visual_modes[vim.api.nvim_get_mode().mode] == nil then return end
   print('2')

   local options = {}
   options.adjust = function(pos1, pos2)
     if vim.fn.visualmode() == "V" then
       pos1[3] = 1
       pos2[3] = 2^31 - 1
     end

     if pos1[2] > pos2[2] then
       pos2[3], pos1[3] = pos1[3], pos2[3]
       return pos2, pos1
     elseif pos1[2]==pos2[2] and pos1[3] > pos2[3] then
       return pos2, pos1
     else
       return pos1, pos2
     end
   end

   local region, start, finish = vim.get_marked_region('v', '.', options)
   print(vim.inspect({region, start,finish}))

   -- Compute the number of chars to get from the first line,
   -- because vim.region returns -1 as the ending col if the
   -- end of the line is included in the selection
   local lines =
     vim.api.nvim_buf_get_lines(bufnr, start[1], finish[1] + 1, false)
   local line1_end
   if region[start[1]][2] - region[start[1]][1] < 0 then
     line1_end = #lines[1] - region[start[1]][1]
   else
     line1_end = region[start[1]][2] - region[start[1]][1]
   end

   lines[1] = vim.fn.strpart(lines[1], region[start[1]][1], line1_end, true)
   if start[1] ~= finish[1] then
     lines[#lines] =
       vim.fn.strpart(
         lines[#lines],
         region[finish[1]][1],
         region[finish[1]][2] - region[finish[1]][1]
       )
   end
   return table.concat(lines)
 end


function get_selected()
    print(vim.fn.getreg('"'))
end

