Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617BF2C3258
	for <phone-devel@vger.kernel.org>; Fri,  7 Nov 2025 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762521051; cv=none; b=QCflgv1BeXLIFT/2urpo6bgkVT9wDyHTNB8Po0QCfAHJDsGraSOb0yJoYcFGRRfGZYYmtSNy8EGI4mQmVdlvH2bhcXi4TQswr5VU7Y6f6fX6+sXPHUklvPJRu19oXKUf9wb6KYZeSWqGe/lVJ4hX9vtEEnth036nD0H0HRTiil4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762521051; c=relaxed/simple;
	bh=X9iTnwju2qFdxCnEg0NR9GAe26HVn4rmc+Xg59b/xTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvn/KGpwXrVe7LNcOcASdchD4LGb/JccNhcSGdQx/eCjc9N4L4Qe8TXD0OprwMs5PGN7xkHVGanw93Ci209Pbgv4R+tEtcBZbXEpqu1v+sfdFPQCGovWUeyKsnikfd4q9h96IG4hqO9DSC8gWyDWWy0YchhQB61ioE9dX3cfmBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ic3s8Zsr; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ic3s8Zsr"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6407e617ad4so775304a12.0
        for <phone-devel@vger.kernel.org>; Fri, 07 Nov 2025 05:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762521047; x=1763125847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gYHHRwUPFMx2o7hSDNrrgKGsA3wEJmqOL2og+5hJ+F4=;
        b=ic3s8Zsrq/cpSWPimMQl7eXeyy7bURpkZUATf/NTYwHwXoHDzY5lr03vozTpwbOVFd
         n84WUEsWfs+PSzjpBeJGdJcRmKb+t1fHx9jXXcoqfVGZ0WdYOnuG7UXxvoEDmWhBTiXY
         zYjAbRzvKUkKKqDqVPZv6lSjRfVHAobhdj957364p4mtfXn9e79Scq4G4AlGVT5LBcE3
         Hb5KdxI5WKe8TvkS6pvnv+3ci+FulVJK+FXNu8Chn3x1uR690jFaKrFkbQG1MGIzqghS
         RxQ9emH7WgYdIIiHqNgcePT6jj6tl7aGpMhtuZ4u2WwaGMneJ7QTfDTYc4xJjkut4W34
         Dm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762521047; x=1763125847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYHHRwUPFMx2o7hSDNrrgKGsA3wEJmqOL2og+5hJ+F4=;
        b=OUuBSt7uCDzboxZ53CGt4uNzz5IVjLf4NBL8BxDxwAASaB3WullXAMfn7kolMQXAgE
         9WJz6VjtPtr4ZaJnw42R8DbnvW6bqdToFAUHGBg1t93mRT5AtM4/y0jZJLVVHb0kCIYi
         55jQDcCrFxkp9dmTic7t8hDvvye3SHj9Nh/Vs9Q41TDIdEAcwv00u0e5H+qRhmRm7cdq
         Xvhrj4dMu0qjTzcAFdYigAwcQCTf8KbOVw+XiBG8FcQaBRz6oaivSyOKLEoqox3KDodn
         aOfypJnRNcXaU/EVnDGyjJsFr1zHyzNZ4H51yj9rZLqYKi1WufH5dRTuvxc0W05MjpEu
         fgNg==
X-Forwarded-Encrypted: i=1; AJvYcCXRfjskBRvl3bd7rcGori00d3vqoJ8IMo0euGble7QUkJEEqx62J18EoG3ObKtc5kW6+GDxrwdFZJpzgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2VY9zrXu6Hzv96qHkFNeWp5/jgk4WXU9siRH+kAm9AMxRGoto
	Gq/IH8l5yUWmBDDKZLXRpVTK4S3a/Xd3A4whsIRgXTdQs3aY89MzSe6NNeOVp7zi63s=
X-Gm-Gg: ASbGnct3pBDtQQGZw3M8U6VnE1q8gxqEWgC7lB6bWxXXHLPxTmpuC5yMViG+1V+jVMj
	XuLCUfG2vQOydRA8zqep9pO6tLpztIj/beCJtxZKbsIn06dNoPXz1RMxL6avbd71gkFfrqeRctv
	ZWI0l3ZKBp1MukrjT72Da6krt7D+gopn6Ff7DUSI51U1fLxlkOSbYaJ6AoUklboTwm/pModUt1Y
	6Xks0OLWx00kVGzomX7ohQ0jPX9YQyfimQHhiLigmTHrS/K2OzFj6mdpF3ec6USgTONcnU9kXUb
	0rsRlsyPzkOFnIJggJCThrozdC57AzGy3v69OYduwceVHsKbKKuTqpVyUBXN8QGZksYm4DMLTpG
	mq7M8gr7pADoFdQQ90xJ8Po4uFEoex26c8uIWIngnPCkzQ3vkIEoQKLEMCT0TwkyZLl98WXYvry
	4gF7eEm3gECkdjNnD/Guph0WsD
X-Google-Smtp-Source: AGHT+IGg1Zbnws8cxX7orORuWlbhSBF5v/XmuMbF1BaB1hdo3oYtaWYVQbZOezZs+ceawiJZq7x26A==
X-Received: by 2002:a05:6402:461b:10b0:641:1cbe:a5bf with SMTP id 4fb4d7f45d1cf-64147094e1fmr1299694a12.9.1762521046750;
        Fri, 07 Nov 2025 05:10:46 -0800 (PST)
Received: from [172.20.148.153] ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f813e9fsm3999374a12.16.2025.11.07.05.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 05:10:46 -0800 (PST)
Message-ID: <db9ea6f8-810e-4143-9e09-84536145999a@linaro.org>
Date: Fri, 7 Nov 2025 14:10:45 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] dt-bindings: panel: Add Samsung SOFEF00 DDIC with
 panel
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, David Heidelberg <david@ixit.cz>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
 <20251104-sofef00-rebuild-v1-1-dfcfa17eb176@ixit.cz>
 <20251106-enlightened-centipede-of-tempering-3cfa50@kuoka>
 <be1b6e34-40ab-4587-8dbe-84e08bf83dcb@linaro.org>
 <108b8631-6d92-4b2f-a59d-3c9e0c607e5d@kernel.org>
Content-Language: en-US, en-GB
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <108b8631-6d92-4b2f-a59d-3c9e0c607e5d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/7/25 12:27, Krzysztof Kozlowski wrote:
> On 07/11/2025 12:23, Neil Armstrong wrote:
>> On 11/6/25 09:48, Krzysztof Kozlowski wrote:
>>> On Tue, Nov 04, 2025 at 11:16:09PM +0100, David Heidelberg wrote:
>>>> Basic description for S6E3FC2X01 DDIC with attached panels
>>>>
>>>>    - Samsung AMS601NT22 6.01 inch, 1080x2160 pixels, 18:9 ratio
>>>>    - Samsung AMS628NW01 6.28 inch, 1080x2280 pixels, 19:9 ratio
>>>>
>>>> This panel has three supplies, while panel-simple-dsi is limited to one.
>>>> There is no user of this compatible, nor the compatible make sense.
>>>
>>> There are. git grep samsung,sofef00, gives me two users.
>>
>> Hmm, on -next I only see a single one:
>>
>> $ grep samsung,sofef00 arch/*/boot/dts/ -R
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts:  compatible = "samsung,sofef00";
>>
> 
> These are the users:
> 
> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> drivers/gpu/drm/panel/panel-samsung-sofef00.c
> 
>>>
>>>> Remove it from simple DSI panel definitions.
>>
>> Can't you mark is deprecated at first ?
> 
> Not sure what would be the benefit here. There is no negative ABI impact
> here.

If we want to acknowledge the potential scenario where someone is 
booting a newer kernel with an older DT then we should keep the old 
compatible in the driver right? And marking it deprecated in bindings 
would make sense.

It could be removed from the driver in the future if there is another 
variant of the panel added or we decide to cleanup.

It's still not entirely clear to what extent we care about DT/kernel 
backwards compatibility though.
> 
> Best regards,
> Krzysztof

