loadstring(game:HttpGet('https://raw.githubusercontent.com/rremedyy/rremedyy/main/drawing.lua'))();
local old_pcall = clonefunction(pcall);
getgenv().request = function(data, ...) -- 他媽的偵測到海浪 😡🤬
      warn('反轉網站後端 ⚕♌♋♉☣☢☢');
      warn(data.Url);
      if (string.find(data.Url, 'replit')) then
            warn('偵測到狗屎白名單🙉🙄😜🕎');
            return {StatusCode=200,Body={match=function()return 'HWID is whitelisted'end}};
      end;
      return http_request(data, ...);
end;
getgenv().pcall = function(...)
    local ret = {old_pcall(...)};
    table.remove(ret, 1);
    return true, unpack(ret);
end;
loadstring(game:HttpGet('https://raw.githubusercontent.com/mainstreamed/clones/main/abyss/loader.lua'))();
