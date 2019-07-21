
-- return cfg

local cfg = {}

cfg.firstjob = "Civil" -- set this to your first job, for example "citizen", or false to disable

-- text display css
cfg.display_css = [[
@font-face {
  font-family: 'hyperion';
  src: url('https://byhyperion.net/stylesheet/fonts/american_captain.ttf');
}
.div_job{
  position: absolute;
  top: 30px;
  left: 40px;
  letter-spacing: 1.5px;
  font-size: 29px;
  font-weight: bold;
  color: white;
  text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
  font-family: "hyperion";
}
]]

-- icon display css
cfg.icon_display_css = [[
.div_job_icon{
  position: absolute;
  height: 33px;
  width: 33px;
  bottom: 2px;
  left: 304px;
}
]]

-- list of ["group"] => css for icons
cfg.group_icons = {
  ["Betjent"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065603493855252/betjent.png);
    }
  ]],
  ["Elev"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065603493855252/betjent.png);
    }
  ]],
  ["AKS"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065596481110031/aks.png);
    }
  ]],
  ["Læge"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065600880934943/ambulanceredder.png);
    }
  ]],
  ["Lægeelev"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065600880934943/ambulanceredder.png);
    }
  ]],
  ["Mekaniker"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065609840099330/mekaniker.png);
    }
  ]],
  ["Mekaniker Chef"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065609840099330/mekaniker.png);
    }
  ]],
  ["Hells Angels"] = [[
    .div_job_icon{
      content: url(https://cdn0.iconfinder.com/data/icons/kameleon-free-pack-rounded/110/Rocker-512.png);
    }
  ]],
  ["Taxa"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583066521014763530/taxa.png); 
    }
  ]],
  ["Træhugger"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065638906363905/traehugger.png);
    }
  ]],
  ["Advokat"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065649484529843/advokat.png);
    }
  ]],
  ["Advokat Chef"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065649484529843/advokat.png);
    }
  ]],
  ["Barn"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583064835085041664/585078496095633418/people.png); 
    }
  ]],
  ["Dommer"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065605859573781/dommer.png);
    }
  ]],
  ["Civil"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065604701814804/civil.png); 
    }
  ]],
  ["Udbringer"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065644212158474/udbringer.png);
    }
  ]],
  ["Postbud"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583066780319219714/postbud.png);
    }
  ]],
  ["Skraldemand"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583066590153670681/skraldemand.png);
    }
  ]],
  ["Lastbilchauffør"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065608216903723/lastbilchauffor.png);
    }
  ]],
  ["Pengetransport"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065612172001314/pengetransporter.png);
    }
  ]],
  ["Minearbejder"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065611073224706/minearbejder.png);
    }
  ]],
  ["PET-agent"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065604701814804/civil.png);
    }
  ]],
  ["Psykolog"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583066502434127903/psych.png);
    }
  ]],
  ["Fisker"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065606820069398/fisker.png); 
    }
  ]],
  ["Journalist"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583067593863069696/pngfind.com-paper-icon-png-1644354.png);
    }
  ]], -- this is an example, add more under it using the same model, leave the } at the end.
}
return cfg