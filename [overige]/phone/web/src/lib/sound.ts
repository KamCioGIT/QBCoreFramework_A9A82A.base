export const playSound = (file: string, volume?: any) => {
  const audio = new Audio(`./sounds/${file}`);
  audio.volume = volume ? volume : 0.3;
  audio.play();
  return audio;
};
