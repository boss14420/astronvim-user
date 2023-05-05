-- enable servers that you already have installed without mason
return function()
  if require('jit').arch == 'x64' then
    return {}
  else
    -- use custom clangd
    return {"clangd"}
  end
end
