let base = (shape, shadowIntensity = 0.1, lightIntensity, overlay) => ({
  shape,
  shadowIntensity,
  lightIntensity: lightIntensity ?? shadowIntensity + 0.15,
  overlay
})

let scattered = (si, li) =>
  base('scattered', si, li)

let standard = (si, li) =>
  base('standard', si, li)

let sparse = (si, li) =>
  base('sparse', si, li)

let spotted = (si, li) =>
  base('spotted', si, li)

module.exports = {
  'titanium': standard(),
  'boron': standard(0.15, 0.2),
  'aluminum': standard(),
  'tin': scattered(),
  'platinum': sparse(),
  'uranium': base('splotchy'),
  'lithium': scattered(),
  'nickel': sparse(),
  'silver': spotted(),
  'lead': spotted(),
  'tungsten': sparse(),
  'copper': base('gouged'),
  'magnesium': standard(0.2, 0.25),
  'fluorite': base('splotchy', 0.15, 0.3),
  'gold-splotchy': base('splotchy', 0.15, 0.3),
  'redstone': standard(),
  'coal': standard(),
  'thorium': standard(),
  'salt': scattered(),
  'zinc': spotted(),
  'quartz': base('serrated', 0.15)
}