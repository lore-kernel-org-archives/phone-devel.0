Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76585285CA2
	for <phone-devel@vger.kernel.org>; Tue, 11 Aug 2026 04:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786422775; cv=none; b=qbXZ5ExIcjJLcUukv97gEA+7rjf4OnKKLaRaozxR+cUkQsSJqeE+O8GttpS2WpgL8Unh6bBne+Rv/B0m/bL3aUx5P8u8LUAjQsSn+8T9S+a1jBoTpI2oDJ3gbbl6iZtikkVDbh6TECJmvYKEOPNHtYFeuAf2hfZVDzSfTpcBsLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786422775; c=relaxed/simple;
	bh=fJmU+BIwJkrdiLINGSNpueASUlZY1S3BdHncMRZDVgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVLHU5Oo515ypgmem8V//XUjiGfsz1No4ou+1PrKm4g9hJf6CzToyWZ9hMkGGRyII2jJOu8o7h5Hj8pLPE/HxkdNCdBapRouJzVxksyDKGips0Q6i1hvpwuLWqoI8SPkJvgxMi0b8Twgi8cmut0Ke+7ulY7DpyZj2Q/vY4385PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqDk/kHM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqDk/kHM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so22880245e9.0
        for <phone-devel@vger.kernel.org>; Mon, 10 Aug 2026 21:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786422771; x=1787027571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uevAQqN80mKQhlZ8WcniYbzi6l/HLyUq4gvUDP8ovMo=;
        b=MqDk/kHMTP5D7zgVlfvttc6Mqka0uuA5mJNIjnDcWLghQRgUKUi1Ik8+LM4YJtXSI/
         kGFyikur818OYAyr1HI+XEczQXwmdGED48AdO9WC/AI99dBcJ5zlHQhAzyX5BFimml9z
         7vwFQZeBe60LEGHjuXh8GvSNFCe+/mpqyyr66yP/2+x8ULTM6vHJ9GtbYgj4MvaLjQP+
         qPIe0ckvCK51H6PVu2upSUo7Vc8XdCCtPl4FszM/3avS4QxFCqoFHP1AQL+7d2JszyRP
         tN+bCT8LfSoriys+tkml8vWCOS+SFMMdOGS7IiQRgrMw9RgeDfjtZYXDTL7+pQPYQezb
         u6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786422771; x=1787027571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uevAQqN80mKQhlZ8WcniYbzi6l/HLyUq4gvUDP8ovMo=;
        b=NFOO0temkclWgt9ZNugZm/u7do+pOTC34MyjiyDijXq5TgS4h/B2cYx6xc+FJNb4Jw
         riQOuULqyV+nRaN6V+F+1hfwaQHbi8HpqcZ7C+uQDa0K0jHlfAWRTgP1w+V6vC0cA/NN
         ZN2gXEB/lg/mj99BL4b2HltOOqx4bPeq3vA3iICLTzZZe4t0S8lSAin1rOVM8f0LNFIX
         xYPp1/kQpBQszGVlXUPiHeYHdMoEzo/imdKhbYOQyzSjZPTXreKBjVrujbZfwVe1z/Ig
         cbisR+dSySbmdxm1WfZf/CQW/CTwZDM9YYBYG06AtrAMJxOnyncl92abFzNRFfsrMzue
         UPkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpE+NXb7zVJ+Tqng/vu6ArVOq4CHToU/2n6slajVKf7IbF35WwJs7nVcBIML7iDF4W2nAlq3QHd50Vang==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrH1Nfr/MYh+ng3BJ+wiYBhuURWqbtcHDE19W7vJ9qNb4HS/YQ
	BePj4CmzoZqFWA6NLibNrOuRFs+1N/tidsuZrCCSvYs08j6xxRYKO2D7
X-Gm-Gg: AR+sD13qC6iJzVf+gxfhZC531NGwe297q6A+g/lB59KFIgabIXojPdoZri6b304/fW6
	DIvVVYLTErpe+rMTFuRytwb8CWbsMGi2oXa5NKPsHT5Hq9yBgLnkgVZ4+PkJzyD/O5bLkwNyXNE
	7zqJ0I9yPhOPFR1J5t8/dRl1SjDegYh8Btmiuyv6ionPyrtLxDmUlAAaxsjysdzsotNpL6rbENP
	50uBo8AuOn8HYd3MyJs78aBBIByhB8GeERICUM1VZEQQJj+nrGElE1uCC6sAKyP6NKfF1TVodtw
	9sWVoSF0dXdl3z1g8luBqGY65Co3WykuPQsRrP7/LzND4IEkpMD3VSSQt5R867q4LEpfbrISmEr
	BqYlNgFVGHG4AxwnYiyfHp1TY4y0it+Bwroon5H4BU0/PGqJw/BhuVYHJsyXzBjacf1fMKYaE3i
	IFq/WSZNuiC1MtaD8lgClIaZzndIAYYMJ6lFzBbk4DFCyUyowh2qiP9NbQdNpwgAL8
X-Received: by 2002:a05:6000:4a19:b0:47f:ec8a:214f with SMTP id ffacd0b85a97d-4814adc3281mr627184f8f.15.1786422770569;
        Mon, 10 Aug 2026 21:32:50 -0700 (PDT)
Received: from [192.168.0.104] ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a6b2ea8sm1050589f8f.16.2026.08.10.21.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 21:32:50 -0700 (PDT)
Message-ID: <71c1a0e4-73f5-4c22-a443-731be59d0d99@gmail.com>
Date: Tue, 11 Aug 2026 07:32:48 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7125-samsung: add initial
 device tree
To: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 phone-devel@vger.kernel.org
References: <20260705-sm7125-samsung-v2-0-d3b17005ecb3@gmail.com>
 <20260705-sm7125-samsung-v2-3-d3b17005ecb3@gmail.com>
 <a89e90e8-a1d3-4e70-8714-c9862044a62d@ixit.cz>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <a89e90e8-a1d3-4e70-8714-c9862044a62d@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/5/26 9:41 PM, David Heidelberg wrote:
> On 05/07/2026 12:30, Erikas Bitovtas wrote:
>> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
>> in 2021. Add initial device tree for SM7125 Samsung platform with
>> support for:
>> - Framebuffer
>> - GPIO keys
>> - Hall sensor
>> - Vibrator
>> - Regulators
>> - Reset input
>> - Real-time clock
>> - SD card
>> - UFS
>> - USB
>>
>> Tested-by: Stefan Hansson <newbyte@postmarketos.org>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>>   arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  20 +
>>   arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  20 +
>>   .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 536 +++++++++++
>> ++++++++++
>>   4 files changed, 578 insertions(+)
>>
> 
> Nice,
> 
> Reviewed-by: David Heidelberg <david@ixit.cz>
> 
> small nitpick, the Copyright inside the files should be yours, at least
> unless you giving up your contributions or you been paid by LF ;-) .
> 
I replaced LF copyright with mine in v3.
I found this patch series from a developer who preferred to stay
pseudonymous. They were licensed under GPLv2, and I got in touch with
the developer and they permitted me to claim ownership for these patches.
https://github.com/map220v/sm7125-mainline/blob/a72q-6.10/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
> David

