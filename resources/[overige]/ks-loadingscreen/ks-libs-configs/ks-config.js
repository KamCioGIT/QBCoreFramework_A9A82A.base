const ksConfig = new Object();

// You can change the template from this line 'ksConfig.default'
// Available Templates: ksTemplate#1 / ksTemplate#2 / ksTemplate#3
ksConfig.default = 'ksTemplate#1';

// You can change the color theme from this lines 'ksConfig.color_R' + 'ksConfig.color_G' + 'ksConfig.color_B'
ksConfig.color_R = '128';
ksConfig.color_G = '13';
ksConfig.color_B = '13';

ksConfig.BackgroundVideoLink = 'https://cdn.discordapp.com/attachments/1198580381360848946/1200414703868977162/GTA_5___Back_to_Los_Santos___Cinematic.mp4?ex=65c61850&is=65b3a350&hm=5d1b06fdd309d2959b1f25f453a60d46ef4f6a2bbbd832525d06864133bf7533&' //'./ks-files/ksVideoBackground.mp4'
ksConfig.UseBackgroundVideo = true;
ksConfig.MuteBackgroundVideoSound = false;

ksConfig.MuteBackgroundMusic = true;

// You manage your staff team members from bellow, also you can choose between using the theme color for the roles or custom color
// If you wanna use theme color change the value of color to 'ThemeColor'
ksConfig.Team = [
    {user:'Mike', role:'Owner', avatar: 'ksAvatar1.png', color:'ThemeColor'},
    {user:'DutchKevin', role:'Owner', avatar: 'ksAvatar2.png', color:'ThemeColor'},
    {user:'Deceu', role:'Owner', avatar: 'ksAvatar3.png', color:'ThemeColor'},
]

ksConfig.DiscordLink = 'https://discord.gg/2aQCB7tzyx';
ksConfig.WebsiteLink = 'https://sasvegas-webshop.tebex.io/';

ksConfig.Section1_Title = 'Over Ons';
ksConfig.Section1_Text = "Wij zijn een unieke <span style='color:var(--ksMainGr);font-weight:bold;'>FiveM Roleplay</span>-server. Wij wensen je <span style='color:var(--ksMainGr);font-weight:bold;'> veel plezier</span> bij ons! Als u problemen ondervindt, kunt u terecht bij een van onze <span style='color:var(--ksMainGr);font-weight:bold;'>Staffleden</span>!";
// <span style='color:var(--ksMainGr);font-weight:bold;'>best</span>

ksConfig.Section2_Title = 'RULES';
ksConfig.Section2_Text = "<p><span style='font-size:10px'>- Heb respect voor anderen, wij accepteren geen Discriminatie/Racisme.<br />- Let op je taalgebruik. Scheld minimaal/niet.<br />- Gebruik de juiste kanalen voor wat je nodig hebt.<br />-&nbsp;Spreek management en ontwikkelaars niet onnodig aan benader ze in DM of in Discord.</span></p>";

ksConfig.Section3_Title = 'UPDATES';
ksConfig.Section3_Text = "<p>- Nederlandse Politie Auto&#39;s<br />- ING Bank MLO<br />- Realistische Auto&#39;s<br />- Shell Tankstation<br />- Nieuwe Autodealer</p>";

// Only for ksTemplate#2
ksConfig.ServerName = 'Kaizen Scripts';
ksConfig.Welcome = 'Welcome to <span id="ksTemp2_Header_G_Text_SN">'+ksConfig.ServerName+'</span>, we are loading the files...';

// Only for ksTemplate#3
ksConfig.DiscordText = 'https://discord.gg/2aQCB7tzyx'
ksConfig.WebsiteText = 'https://sasvegas-webshop.tebex.io/'
ksConfig.CopyText = '💚'