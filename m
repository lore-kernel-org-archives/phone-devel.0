Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3DF2BAE7
	for <phone-devel@vger.kernel.org>; Mon, 12 Feb 2024 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707736603; cv=none; b=o0+w6VWqm2n5b6QvjSNR31WaKXWKB8g+DDlWj4d0lbXj/yOkbgbEpn+8dRxpBHUgFCalC/WbeIGh/BKLaCyNUDX9hYcnMdzco6inRiCzlDA+Gz1sWJOe2IbdhYqsf5TA7FpRXcdbZqpg7QvDaSCsvtfKBGgy3nkJiU9lvRy9mDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707736603; c=relaxed/simple;
	bh=+/dv/rjnTdZRDkLIWwNl3OVUhyJ/TnHTE0m66DG81mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELf1yvBOvXEiVR9gXOvMDjzh15hqVLyDoo0AbTKmZMms4OiOtMb4jn8ywW4IN2XogPv5r3VgbkNb51+YQpStie18brSH71tegLOamWT8YQZIQNUYDVUE0VjNWgJn8WT1Z9eqijoaY9iXbIv2wtwyqZgnh+WWYYXBg7bPYYhGRI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GHr9nCBy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GHr9nCBy"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-410ee8ed659so2330745e9.2
        for <phone-devel@vger.kernel.org>; Mon, 12 Feb 2024 03:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707736599; x=1708341399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhJlFfknc7JfVoq7noZrf9tAfPeenqXQkKrMu3gZlEQ=;
        b=GHr9nCByuvGtKNmJbJzkgiBs+RYNksn3oM9LIsa7ZR8PbQ2MAf21ds0ALdD8WX0iEJ
         4qzb9486BzGI1zUc7i/xf8DPP4CAKgiavXM9xkvt3/1IEUb+OgEPtcKA5CRH1cnfsCCz
         vNRUhzepSGft85HZrS3PkEJFfoot8BB8m+sDlLE5FZnoK9nlF/8rfqSFO7Q7h+mVbDFo
         VwlSrJh4eIgTOoqZrlzRLeWMAI79ZA5XJc/OmZkRbjcbKtyMkpVI5RJFcbRMZrhq+WVJ
         dUBhENL+W+tNpRlwTPWzX09OmQ/BO0ySGYtNqgch4/VJfwBBIE699X0AO2THdyh1L498
         T5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707736599; x=1708341399;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhJlFfknc7JfVoq7noZrf9tAfPeenqXQkKrMu3gZlEQ=;
        b=OoHT35dNwDJ+nu3cSFJPCNPiWpY+dcAbez15RHnR1Up35I22hectFKSHi0r4TwfZ2Q
         FXVW6UsnG8NpQpSjQZygmmb92K8Ic2BVjz9W0TETwWDCSuFFVm5fqyA2KK0/Hq/thAdG
         2KyROHneh7aMn2KP3KNS6L+x5ce+pXU8/I+9h41/mU8NV3mTCNj8cPq2ICXzn49IE2rQ
         Q2ywBlatu9pcqwsIgwmYsbsM1GO7hcWRvZLI2Q4dfL7hTtq/pG4xFXeejG7nMzR+8RWb
         6ptC+rnqrEClMF55O9ZHQ4ULCsHbO4l6By30pt3xj37smYZltikD/8aadwv36k97hJIU
         jP7w==
X-Gm-Message-State: AOJu0Yze0KEURAwwNj0gtiZkZ0qm+b+DMgLW/6+ygEkn/lLWVSp8x23u
	KyjHyJJyfe+fArt6cndUB7aTCGfS5DS6i1PN3QTc1PSa0orqxrgj25h73NfGTwvCkd5TQhv9nj2
	f
X-Google-Smtp-Source: AGHT+IFpAuLt1rb2QXW7m15x5ZnRaszV16GeULOePJs1dUDRnz4ues0/eHXNmd/xmA3d49MPrNUtWg==
X-Received: by 2002:a05:600c:6018:b0:410:c0d5:ffe4 with SMTP id az24-20020a05600c601800b00410c0d5ffe4mr2527727wmb.36.1707736598746;
        Mon, 12 Feb 2024 03:16:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnZgs0QRj6ByPtSYirwVOpHF6IwlnTsUSXOKKPNqNUEKwh/PN8Sokad/JL8GjPSBu7o2SJxbJVMy87obmTi5pOWiSrup/qrrI/dOb5mD6Nqwf3sV5jfKrZ7OX8DHZVOLsguhVpbGz8FEeyzWstuOZWnoIuFRKH2OgPkSH2s9nNaqe3S0GxAUvScAJQIVN2k/mUg7ltOTvK2WbTxtIf5CHBvtKrgyLvVxXed2tu0eUlwnDLKfp/hqCZUSbt4FvjogKoHME5smtzzQw71IJiUyTH1lCJWHyjNX8zz6zaSE59/K2c6M+kQ7aytnPfFcwTodSG8FDQxGO3FTKIdW5/HN9qPnYsBFvZ+Xz2tiRlJ6n3hAyC3j4L7UrHbzE25ELkYG+yGJCLJoopdMgF7vvnGXmd93cFC4m4R8WIvUdQFljqmQ==
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id jr6-20020a05600c560600b0041079d336c7sm8295768wmb.39.2024.02.12.03.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 03:16:38 -0800 (PST)
Message-ID: <db0d9666-796b-48e1-b830-2c9817a92b4f@linaro.org>
Date: Mon, 12 Feb 2024 12:16:36 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: typec: anx7688: start a binding
 document
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>
Cc: phone-devel@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>,
 fiona.klute@gmx.de, martijn@brixit.nl, samuel@sholland.org,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, megi@xff.cz
References: <ZcaCXYOf6o4VNneu@duo.ucw.cz>
 <3a662ef2-1888-4f24-bebe-3ce32da9d277@linaro.org>
 <Zcn6sSOqb+QpZtCC@duo.ucw.cz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Zcn6sSOqb+QpZtCC@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2024 12:02, Pavel Machek wrote:
> Hi!
>>> Add binding for anx7688 usb type-c bridge. I don't have a datasheet,
>>> but I did best I could.
>>>
>>> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>>>
>>
>> You miss proper diffstat which makes reviewing difficult.
> 
>> Actually entire patch is corrupted and impossible to apply.
> 
> Sorry about that.
> 
>> Anyway, where is any user of this? Nothing in commit msg explains
>>  this.
> 
> User being is worked on:
> 
> https://lore.kernel.org/lkml/2024020126-emote-unsubtly-3394@gregkh/T/
> 
> Thanks for comments. I'll go through them and try to improve things.

OK, please send bindings patch in the same patchset as the driver.
Preferably first bindings patch, then driver patch(es). The bindings
document ABI exposed by driver, so we expect to see and apply both of
them together (apply through subsystem, so USB in this case).

Best regards,
Krzysztof

