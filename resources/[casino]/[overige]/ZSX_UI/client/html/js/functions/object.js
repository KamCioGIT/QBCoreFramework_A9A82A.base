let ZSX = {}

ZSX.getOffset = (el)=> {
    const element = $(el).position()
    return {
      left: element.left + window.scrollX,
      top: element.top + window.scrollY
    };
}

ZSX.WaitCondition = (condition) => {
  return new Promise((resolve) => {
      const interval = setInterval(() => {
          if (!condition()) {
              return;
          }

          clearInterval(interval);
          resolve();
      }, 100);

      setTimeout(() => {
          clearInterval(interval);
      }, 5000);
  });
};

ZSX.removeStyleProp = (elm, prop) => 
  $(elm).attr("style")
  .split('; ')
  .filter(p => !p.startsWith(prop) )
  .join(';');