Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918D71F922
	for <phone-devel@vger.kernel.org>; Mon, 22 Apr 2024 22:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713825842; cv=none; b=GbfhAGZYB5xvgWEKo9ISOuUZwYpWeWJKYlGbVbeCz9W+GbeP9x/FPh5R6W1z1HRkreq+upxg1yC9Aiq/MWRHZfTRzmBz8ltCoolBzv6vnGUd0cB5AbcxbjI0CZ3NbYOlsJp2U0yZiqFDE7HE1jiSMePqI0WN9EY+u9tsJd/sXVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713825842; c=relaxed/simple;
	bh=ElqV9w5egMCE1fLprf67vgUULGRpUkv5I3l3AQ4IKSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNIofSu2LNjyRZVadk5iH1FVieNwtbPJyaVPqLnUQoyQ05QNBupd0iMED3f+nVbvuYycBPKGzuRx0msFA6+c9rt/WDntIu8q1yrY0rkTRrOEusktOPCJM2T1nCz/8F6cUNMZnLzw9dZdmMK3dRMWqhr2eNGBr/97yC0oFAtGuu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q3vVhk/X; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q3vVhk/X"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51b526f0fc4so1647934e87.1
        for <phone-devel@vger.kernel.org>; Mon, 22 Apr 2024 15:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713825839; x=1714430639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oofEEwMcsUFGHCf9AB7GLQjS3HSrYP8XWX7NSP6yUuo=;
        b=Q3vVhk/XIpb/nc7rFNSB35G2q1LVjx8Br2L+5m0HkikLZqUD5Nkr80oxo5n9DNTlgN
         Om10dKKjSL7adi4WvD5q3elvUkPz8cxk6nZHTfcopnNNi7wmzesNCcMhT+DvNw3wyl29
         ruejLgcbIszDW3Zq0KlrWTaGK1P3tNVARyRiD/L96sS/lI3IOYdgWTZZKKDSqsaSQCOJ
         fdpQxebLNE1nJEzxYIJXLApLnGKviURwCFd4jG60XWGob0dSuHk3SedURqI8BuOnlPYY
         oj8DEhHEBPZkS0vdCc6ZTvCX+GzZ+vdIzbdR8xy21TRXmQejhXeG2DcLMs37O8+aIbFX
         wyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713825839; x=1714430639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oofEEwMcsUFGHCf9AB7GLQjS3HSrYP8XWX7NSP6yUuo=;
        b=GzermG+hx2gqi4zgWhSzUn6G/bs+nskDUJmYMYuOiilxr3871hsmMpY6delLF/2Wf8
         hFy0o0lM+WSkM5Aufi37PlA/oVnfs0fNqqzjvao4pmBzvkVFOnWZ2gXvdmhInm6a1vCW
         X8ndxpvsZkbbc1ey1Vk2gpyqWEEQqudhxIB2+OXblMXO72qyXUsMx3DOwLaWZqJodo1L
         2+d4SvGGJykB4xYGsnlFn2HlaNFOuyTEgYiKpnymA0ngMcuvD2OIX8KF+CJH5BF2GsPr
         8ZcFQg8RjGaOgDtEuVnDGiwCZ5FmsP/+5WVj4l9BK6kYmCaHIDncn4u1w6LYuOFrxq9R
         my6g==
X-Forwarded-Encrypted: i=1; AJvYcCXMpjrJWI24kP0MNGNCwp8CQL2GKEbdU/vFmLHDZ+CcdWivvN6oDrdj7oLUOxaaemF8WU1jOlH+MEPOBqX3ZGkSpBO86yA7J4S1x10=
X-Gm-Message-State: AOJu0Yz7GN3ld8utByesZQawsqCVcNRQq1dSN7AJOHU0pzHY12bUOfXg
	WWmjj+IpqLNFJxU3wLZfjLfmLVsrHQik8J80bzy3hZT+9mRobQ4qgaJPo5fvwV/DZmzMSgMfxPC
	q
X-Google-Smtp-Source: AGHT+IFzzCNXoiQoP0c4aV9kGALB2szkveofYw8qjvKgw34NGG2nJIGXaItXvP9QnYff9kIfwriZpQ==
X-Received: by 2002:a05:6512:b8b:b0:515:bbe9:f208 with SMTP id b11-20020a0565120b8b00b00515bbe9f208mr8463038lfv.19.1713825838785;
        Mon, 22 Apr 2024 15:43:58 -0700 (PDT)
Received: from [172.30.204.103] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id m7-20020a056512358700b005175dab1cfdsm1833414lfr.257.2024.04.22.15.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 15:43:58 -0700 (PDT)
Message-ID: <36f33797-22d9-433c-9b5f-df8488191f3a@linaro.org>
Date: Tue, 23 Apr 2024 00:43:55 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: pmi632: Add vibrator
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240418-fp3-vibra-v1-0-b636b8b3ff32@fairphone.com>
 <20240418-fp3-vibra-v1-1-b636b8b3ff32@fairphone.com>
 <c1763d69-f0a4-4415-be7a-31b04153fbfb@linaro.org>
 <D0N5VCESMRIX.3MY64A0MXKJGW@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <D0N5VCESMRIX.3MY64A0MXKJGW@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/18/24 12:03, Luca Weiss wrote:
> On Thu Apr 18, 2024 at 12:01 PM CEST, Konrad Dybcio wrote:
>> On 18.04.2024 8:36 AM, Luca Weiss wrote:
>>> Add a node for the vibrator module found inside the PMI632.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> On a side note, this is a totally configuration-free peripheral that doesn't do
>> anything crazy until manually configured.
>>
>> In the slow quest to be (hopefully) more sane about the defaults, should we keep
>> them enabled by default? Bjorn?
> 
> But many (most?) devices don't have a vibration motor connected to
> PMI632, some (like devboards) don't have anything, and other phones have
> a separate chip that controls the vibration motor.
> 
> Enabling this by default would mean all devices with PMI632 would get an
> input device for the vibrator that probably doesn't work?

Fair

Konrad
