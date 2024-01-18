local Tweets = {}

if Config.SaveTweets then
  CreateThread(function()
    local oTweets = GetResourceKvpString('tweets') and json.decode(GetResourceKvpString('tweets')) or {}

    table.sort(oTweets, function(a, b) return tonumber(a.date) > tonumber(b.date) end)

    if #oTweets > 30 then
      for i = 1, 30 do
        table.insert(Tweets, oTweets[i])
      end
    else
      Tweets = oTweets
    end

    SetResourceKvp('tweets', json.encode(Tweets))
  end)
end

Phone.API.RegisterServerEvent("twitter:getNotifications", function(source)
  local phone = GetPlayerPhone(source)
  local account = phone.getAccount('twitter')
  if not account then return 0 end
  return account.notifications
end)

Phone.API.RegisterServerEvent("twitter:markRead", function(source)
  local phone = GetPlayerPhone(source)
  local account = phone.getAccount('twitter')
  account.notifications = 0
end)

Phone.API.RegisterServerEvent("twitter:getAccount", function(src)
  local phone = GetPlayerPhone(src)
  return phone.getAccount("twitter")
end)

Phone.API.RegisterServerEvent("twitter:getTweets", function(src)
  table.sort(Tweets, function(a, b) return tonumber(a.date) > tonumber(b.date) end)
  return Tweets
end)

Phone.API.RegisterServerEvent("twitter:getMentions", function(src)
  local phone = GetPlayerPhone(src)
  local acc = phone.getAccount("twitter")
  local nTweets = {}

  for k, v in pairs(Tweets) do
    if v.user.name ~= acc.username then
      if string.find(v.msg, "%f[@]@" .. acc.username .. "%f[%A]") then
        table.insert(nTweets, v)
      end
    end
  end

  table.sort(nTweets, function(a, b) return tonumber(a.date) > tonumber(b.date) end)
  return nTweets
end)

Phone.API.RegisterServerEvent("twitter:login", function(src, username, password)
  local phone = GetPlayerPhone(src)
  local correct = promise.new()

  MySQL.Async.fetchAll("SELECT * FROM twitter_accounts WHERE username=@username",
    {
      ["@username"] = username,
    }, function(result)
      if result[1] then
        if result[1].password == password then
          correct:resolve(result[1])
        else
          correct:resolve(false)
        end
      else
        correct:resolve(false)
      end
    end)

  local account = Citizen.Await(correct)

  if account then
    phone.setAccount("twitter", account)
  end

  return account
end)

Phone.API.RegisterServerEvent("twitter:create", function(src, username, password, avatar)
  local phone = GetPlayerPhone(src)
  local p = promise.new()

  if not canUserCreateAccount(phone.identifier, 'twitter_accounts') then
    return Locales.maxAccountCap
  end

  MySQL.Async.fetchAll("SELECT * FROM twitter_accounts WHERE username=@username",
    {
      ["@username"] = username,
    }, function(result)
      if result[1] then
        p:resolve(true)
      else
        p:resolve(false)
      end
    end)

  local accountFound = Citizen.Await(p)
  if accountFound then
    return Locales.usernameTaken
  end

  local accountCreated = promise.new()

  MySQL.Async.execute("INSERT INTO twitter_accounts (username, password, avatar, creator) VALUES (@username, @password, @avatar, @creator)",
    {
      ["@username"] = username,
      ["@password"] = password,
      ["@avatar"] = avatar,
      ["@creator"] = phone.identifier
    }, function()
      accountCreated:resolve()
    end)

  Citizen.Await(accountCreated)

  phone.setAccount("twitter", { username = username, password = password, avatar = avatar })

  return phone.getAccount("twitter")
end)


Phone.API.RegisterServerEvent("twitter:delete", function(src)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount("twitter")

  local p = promise.new()
  MySQL.Async.execute("DELETE FROM twitter_accounts WHERE username=@username",
    {
      ["@username"] = account.username,
      ["@password"] = account.password,
    }, function()
      p:resolve()
    end)

  return Citizen.Await(p)
end)

Phone.API.RegisterServerEvent("twitter:logout", function(src)
  local phone = GetPlayerPhone(src)
  phone.removeAccount("twitter")
end)

Phone.API.RegisterServerEvent("twitter:changeAvatar", function(src, avatar)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount("twitter")
  account.avatar = avatar
  phone.setAccount("twitter", account)

  MySQL.Sync.execute("UPDATE twitter_accounts SET avatar=@avatar WHERE username=@username", {
    ["@username"] = account.username,
    ["@avatar"] = avatar
  })
end)

Phone.API.RegisterServerEvent("twitter:tweet", function(src, tweet)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount("twitter")

  if not account then
    return
  end

  Tweets[#Tweets + 1] = { id = tweet.id, msg = tweet.msg, images = tweet.images, likes = {}, user = { name = account.username, avatar = account.avatar }, date = os.time() }

  table.sort(Tweets, function(a, b) return tonumber(a.date) > tonumber(b.date) end)

  if #tweet.msg < 1 and #tweet.images > 0 then
    tweet.msg = 'Image'
  end

  for k, v in pairs(Phones) do
    local acc = v.getAccount('twitter')
    if acc then
      if v.settings.twitterMentions then
        if string.find(tweet.msg, "%f[@]@" .. acc.username .. "%f[%A]") then
          if account.username ~= acc.username then
            if not acc.notifications then
              acc.notifications = 0
            end

            acc.notifications = acc.notifications + 1
          end

          TriggerClientEvent("phone:notify", v.source, { app = "twitter", title = '@' .. account.username, content = tweet.msg, sound = "notify.mp3" })
        end
      else
        TriggerClientEvent("phone:notify", v.source, { app = "twitter", title = '@' .. account.username, content = tweet.msg, sound = "tweet.mp3" })
      end
    end
  end

  if Config.SaveTweets then
    SetResourceKvp('tweets', json.encode(Tweets))
  end

  TriggerClientEvent("twitter:refreshTweets", -1, Tweets)
end)

Phone.API.RegisterServerEvent("twitter:delTweet", function(src, tweet)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount("twitter")

  if not account then
    return
  end

  for k, v in pairs(Tweets) do
    if v.id == tweet.id then
      if v.user.name == account.username then
        table.remove(Tweets, k)
      end
    end
  end

  table.sort(Tweets, function(a, b) return tonumber(a.date) > tonumber(b.date) end)

  if Config.SaveTweets then
    SetResourceKvp('tweets', json.encode(Tweets))
  end

  TriggerClientEvent("twitter:refreshTweets", -1, Tweets)
end)

Phone.API.RegisterServerEvent("twitter:like", function(src, id)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount("twitter")

  if not account then
    return
  end

  local tweet = findTweetById(id)

  local alreadyLiked = false
  for k, v in pairs(tweet.likes) do
    if v.username == account.username then
      alreadyLiked = k
      break
    end
  end

  if alreadyLiked then
    table.remove(tweet.likes, alreadyLiked)
  else
    table.insert(tweet.likes, { username = account.username })
  end

  table.sort(Tweets, function(a, b) return tonumber(a.date) > tonumber(b.date) end)

  if Config.SaveTweets then
    SetResourceKvp('tweets', json.encode(Tweets))
  end

  TriggerClientEvent("twitter:refreshTweets", -1, Tweets)
end)

function canUserCreateAccount(identifier, table)
  if Config.MaxAccountsPerApp == 0 then
    return
  end

  local canCreate = promise.new()
  MySQL.Async.fetchScalar(("SELECT COUNT(1) FROM %s WHERE creator=@creator"):format(table),
    {
      ["@creator"] = identifier
    }, function(result)
      if result < Config.MaxAccountsPerApp then
        canCreate:resolve(true)
      else
        canCreate:resolve(false)
      end
    end)
  return Citizen.Await(canCreate)
end

function findTweetById(id)
  for k, v in pairs(Tweets) do
    if v.id == id then
      return v
    end
  end
end
