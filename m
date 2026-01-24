Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF27A26CE2C
	for <phone-devel@vger.kernel.org>; Sat, 24 Jan 2026 20:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769286222; cv=none; b=NVVQLsnFpHqKkGiYGwJICxUZacgxPtFuvmxjFXELH0rQKnPCoS2ZnSz1sJr1eSbaNLv9Mz6OtZPNccAq7iTgu4lNYNm/vIBQ2pHR6nvCPFnRzRaD8P5rPSCT2DtJ3G3k4i2ZB5ApGLNEnl50OnH4mFhad1jlkyARvQSd59YkMoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769286222; c=relaxed/simple;
	bh=K9T/oFt08Y6R26vl8medrow+Qm7xgj19wlgomw+eLtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOV5l3PkJbNnJ/AHIK+RHF3QSCsEHEGaL/BqElcuta2HaLahX72YPkOaEZBsfs7xj+wgetyp8nyZZtvq/YQ/AvbHjcd2jHVWY3353F436ko6uKbXHlZMPU5RclRhX7fHQqgogNcBbohPsabXbQUixpol5gWnzoxE6EAHAzNPmow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNL3wrtM; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNL3wrtM"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65814266b08so6212255a12.3
        for <phone-devel@vger.kernel.org>; Sat, 24 Jan 2026 12:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769286219; x=1769891019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gzxkm0h8XEMj0XxTsj3iPE14mhoIpF5KuL5jI5jwGiU=;
        b=FNL3wrtMkSauYix9WHBd1nSjLgpVxg2CfUhl/u8TCRW3DuxwNkZztRuAjUKIjpm6ub
         Vv9yN19DSpj1AYnFr62OxMWjyy7Wpmr5jebJR+rzMQbZCWAkfJSrhOFWi1I1EUeMiBJn
         yeHLK0XB5dT/NrQSB3nEXu1GNrnWFrRzu50bH4a3B2ADRBEg2Ad3+neX7eDVUCyBGyT4
         uHLZcCReHmubZRmuesI6vTI7Q/mggcUnnpDtBC8P6L5ZoyC0UvvL8DcfrY7KdW/t7+x3
         NoVRklV+848cIu5PgrYOuPrcoDyAOuQaknhiSv+/Y4og0/+0ibsM4LCPSuLLjYzyyOYN
         PC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769286219; x=1769891019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gzxkm0h8XEMj0XxTsj3iPE14mhoIpF5KuL5jI5jwGiU=;
        b=Knx867AzT4zt2PfIMzRIrats5aY5iTut/9aVmGNllrrQmhoJ8v5IZYk1AZhOLtN4xG
         jmS+aAf2nCtssT0a3dSpjFB+B1wBNTl/UoTWlMtrFvUPn+cBMUXauzRMSd+YhwNkaWze
         ++3G7UphViGholUU3dsC3nuBAz9HlkRXnMCnv96ZQUX/rqYIzZmlzP1n7JrPq06bKHGR
         FIBbh96D1fF6/w8qJGMj7PpkhyjxiWWaKjoURqcksZ2ypdFpAHSjSULIbu2NW5XXxSoV
         GcMJZYatmseFlP3V3GqfiDYh82P4lNVRShA202hmSkE1OcbvVKQKGGFJ+ROWGJtjUmD3
         g+4A==
X-Forwarded-Encrypted: i=1; AJvYcCXBfo9CMKOdNddHaCZOe/hY3IZoUxByCk0N186a2AQqi+gjllA9lXLJmjo7zMX24hsqS1UjRMc0WPtofA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLS2UeKuI4yEV0mLTb62Fb5ip9lu2Hkf2e2Ufgxg/krKKlabz1
	BEXkd/ZbLiareoWXXTlRkxAohFH4sTw7uL1N0mSqJcBvR43ToXi1bdOZdB8vIA==
X-Gm-Gg: AZuq6aKtLOlWY+NIv7xPBhxVAleZgV0DG0Q+otic9y9XRTol8UzChIV8L5uvi9D2xyt
	v1eHLavcKs0f3Upmi/IAVt25Cv+9PcBwr9gnmNrjV7P/BNZflvTG5pTmQFs/V/2qymC69Rvb3i0
	KeyYSxLT3C5PoXV581hLz9dddgoBHM2wiERCokg/8rjmE1+LVCO00bW/tcQw9Q7YoQyVFJA2SWw
	YaZpiKjEdJfyus3QpYt6pd66p7BhtEpuWN6lIeuOxp+DhX/dUHib0K3OICGM8OwvG0NJhjsAfkf
	JFNzQIhzqW0EUlJTbHP/hIEuqteyo+26rKCYV+FbLI1RLY1tvmQpMmww03ObjcOinbR/esMpP7H
	xr6JM3Q9rniGcncZbkp3t/SU/t7QOs5uL2+8SXO16DxusyQ6q0wTuUaPTvEDs0cH6uxoitocY0a
	mDbW8NRXDXdeKI7NvlsaBl6v+UVPEyxcB4kkDBl/kl4NPV0PXxPSxRFzGjYtwoB0a3gpwkqjpxv
	AooogHYTuUfV068koAgLy6YQBU1qZo+AJBDWyjmZ1/E6ftNLA5WuEoeXeY4MKP67eFnsNMvh1o=
X-Received: by 2002:a05:6402:26c4:b0:64b:7dd2:6ba4 with SMTP id 4fb4d7f45d1cf-6584874e648mr4167820a12.4.1769286218916;
        Sat, 24 Jan 2026 12:23:38 -0800 (PST)
Received: from ?IPV6:2a01:114f:470e:6200:4c6a:9244:66ab:7c8e? (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b96cae0sm2579920a12.33.2026.01.24.12.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 12:23:38 -0800 (PST)
Message-ID: <2153fb6d-17d3-4cec-b348-894599743b93@gmail.com>
Date: Sat, 24 Jan 2026 21:23:36 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mfd: bcm590xx: Add support for interrupt handling
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Stanislav Jakubek <stano.jakubek@gmail.com>
References: <20251013-bcm590xx-irq-v3-1-0ceb060d2ee8@gmail.com>
 <20251023130335.GM475031@google.com>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20251023130335.GM475031@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry for the late reply to a 3-month-old review, but I missed this comment:

On 23.10.2025 15:03, Lee Jones wrote:
> On Mon, 13 Oct 2025, Artur Weber wrote:
>>   
>> +static bool bcm590xx_volatile_pri(struct device *dev, unsigned int reg)
> 
> If I've asked a question or showed uncertainty about something, it
> usually means that changes need to be made.  Asking what "pri" meant
> wasn't a one time thing.  It shows that something is not clear and if
> I'm asking, others will wonder too.
> 
> Can we change 'sec' to 'secondary' and 'pri' to 'primary' please? 

That function was named for consistency with the other uses of "pri" and
"sec" in the code; this function is passed to a field in the struct
"bcm590xx_regmap_config_pri".

(Admittedly, "bcm590xx_regmap_volatile_pri" would be a more accurate
function name.)

I understand that the pri/sec naming could be confusing though. Should I
update the entire driver to use primary/secondary instead, or just this
one function? Or just the regmap_config?

The regmap_pri and regmap_sec names are also used in the bcm590xx struct
which is passed to other drivers (currently only the regulator driver),
changing those would also involve changing that driver, but that's fine
by me.

Best regards
Artur
