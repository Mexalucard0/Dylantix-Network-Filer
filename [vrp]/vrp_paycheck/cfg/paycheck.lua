--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]


local cfg = {}

-- paycheck and bill for users
cfg.message_paycheck = "Løn: ~g~DKK" -- message that will show before payment of salary
cfg.message_bill = "Skat: ~r~DKK" -- message that will show before payment of bill
cfg.post = "." -- message that will show after payment

cfg.bank = true -- if true money goes to bank, false goes to wallet

cfg.minutes_paycheck = 30 -- minutes between payment for paycheck
cfg.minutes_bill = 30 -- minutes between withdrawal for bill

cfg.paycheck_title_picture = "Danske Bank" -- define title for paycheck notification picture
cfg.paycheck_picture = "CHAR_BANK_MAZE" -- define paycheck notification picture want's to display
cfg.bill_title_picture = "Skat" -- define title for bill notification picture
cfg.bill_picture = "CHAR_MP_MORS_MUTUAL" -- define bill notification picture want's to display

cfg.paycheck = { -- ["permission"] = paycheck
  ["rigspolitichef.paycheck"] = 40000,
  ["vicerigspolitichef.paycheck"] = 38000,
  ["politiinspektør.paycheck"] = 36000,
  ["vicepolitiinspektør.paycheck"] = 34000,
  ["politikommissær.paycheck"] = 32000,
  ["politiassistent.paycheck"] = 30000,
  ["politibetjent.paycheck"] = 25000,
  ["politielev.paycheck"] = 16000,
  ["regionschef.paycheck"] = 40000,
  ["viceregionschef.paycheck"] = 36000,
  ["overlæge.paycheck"] = 32000,
  ["akutlæge.paycheck"] = 28000,
  ["ambulanceredder.paycheck"] = 25000,
  ["redderelev.paycheck"] = 15000,
  ["advokat.paycheck"] = 34000,
  ["mekaniker.paycheck"] = 28000,
  ["taxa.paycheck"] = 17000,
  ["miner.paycheck"] = 14000,
  ["arbejdsløs.paycheck"] = 6500,
  ["postnord.paycheck"] = 18000
}

cfg.bill = { -- ["permission"] = withdrawal
  ["rigspolitichef.paycheck"] = 20000,
  ["vicerigspolitichef.paycheck"] = 19000,
  ["politiinspektør.paycheck"] = 18000,
  ["vicepolitiinspektør.paycheck"] = 17000,
  ["politikommissær.paycheck"] = 16000,
  ["politiassistent.paycheck"] = 15000,
  ["politibetjent.paycheck"] = 12500,
  ["politielev.paycheck"] = 8000,
  ["regionschef.paycheck"] = 20000,
  ["viceregionschef.paycheck"] = 18000,
  ["overlæge.paycheck"] = 16000,
  ["akutlæge.paycheck"] = 14000,
  ["ambulanceredder.paycheck"] = 12500,
  ["redderelev.paycheck"] = 7500,
  ["advokat.paycheck"] = 17000,
  ["mekaniker.paycheck"] = 14000,
  ["taxa.paycheck"] = 8500,
  ["miner.paycheck"] = 7000,
  ["arbejdsløs.paycheck"] = 3250,
  ["postnord.paycheck"] = 9000
}

return cfg
