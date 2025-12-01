Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9957A30E837
	for <phone-devel@vger.kernel.org>; Mon,  1 Dec 2025 12:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593853; cv=none; b=KmmJARM5GwzBuAxg6HpXCuuwW1GpcA7KVDB2VJSKDE3v0U5gjsUGAdYddzuWSx0pHU2K097+9Tjc69AWp2C3eEfDDDk3Qt32X+E5huZy/L2oasroMt1Thn4LC2eFIBbQsgEUZNcgYKB3eglIJebpvbsoWQZqVFAcysNvTavejsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593853; c=relaxed/simple;
	bh=5+1ynFX9sq0ziaJLuRN5eNyfkmxm5J0x2HmsoNtaays=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wp3cWVBOVWAjG5XwUmCAutO13rBuBM7rPhTN4VOJO6l/++Msc2nJ9IDtbJJqalUNjhYrmxf1H6jd+ahJOyy3dEeZqEXkbaZ2JAlj9YDH0fFZXXM/LHYhAC3r/7mnTk0EH5MbENPMLw0tOA/Oof+EYTHNgvIM7QB5UBjJVbQgMro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k30IszBp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k30IszBp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so41989155e9.3
        for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 04:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764593850; x=1765198650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=266CUf2mQ02zb00BTrcOWPUIAlQp5ZHo7Lg3QzyKKsk=;
        b=k30IszBp0wz/hU7NqhxlwrUnagrVNA3eeJPdCyR3m2TnRH4pERZrrp2rfMieLsejod
         2p2IDxQwG4hBNrVv79cpr/3UyFfrAm6g0lYY6W1JIsNXb1UiWvxtgClMLib/1cen5Fkc
         cRwPqcY3mZxdj1CKHn2h3jLIWnokkr0sUTAH0uk+wanO4N1WR0KCzLgxv9Fev1ru0lNt
         neLKftGab+9e5xGP7EH61p4qwaCZmS19nx7mh8z8PqKUaJmCV4KT3Byl3D1EEo4+pFc4
         ubYVigyZ0TwgLZakawmLPh2HKVhh2nCCX2Wbkv8SU+tRj6e2xazD8MN5kZ3wNxz9Eu8C
         sPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593850; x=1765198650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=266CUf2mQ02zb00BTrcOWPUIAlQp5ZHo7Lg3QzyKKsk=;
        b=pUF+t53AqyHteINfAZBZqHAo+yZPsYkFoH4jUQUhbXJgXJNNUHv2r6gujkoP+/RhiL
         NB2gen4xPEt9hAHlg6pYorgFxUEZk4lYDhkyQi54RbAD3q9d1yDW89lJflGcmsG8tqND
         fEmxQFEIKXyfXsxnxfCyh1gIW0+x3eRmNuSeBgNe7lfBWnV/ClJy9ZFjBCKAEBo3Xw2K
         YJbwhmyuvywwToWhV1OBpu9dm4FOlUkoqEH0bn2plWOyveLMeLIQcs3lCOQ/z6DOLwFq
         D9hjlfz3bJ7N3o9J7U8vSdPZLbyD2jxbAsxY+aqyDc1lYYMpUOaKQ6HQBsw7R6ztoxpK
         ZcKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvmNDwJFgdcamob9yXt7Dhi0oJO1Esavoxg4+K3xjAuf5ScXj0fbff60/QvLplb4gY2zvRuRq+b+AIOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iuSOxPTODTfArztmuBc7M/pUCfmeV3cf5cQmuCWz7PltVNe2
	A8r8Jjw0OndVbPPSbjgJKhS99IQWghsbrLS7kxaWHIN8/p8NDztByzRwbRWFXy/EFbdkxLRghYE
	4NGXn
X-Gm-Gg: ASbGncvto7O21gQQVrSqHE71MCFlCE7V3lobF4oTWS6a1eDeKRUc+qfDzjnDezpKLs/
	7JeB24U0QByMMa0Nmh1J40LE6jOrGZ/OPMEofH2oi7trSCBuD2IZ7JOX6xA9VhK+f+TB7ubpJXf
	SL8upPFX4GenKVXeMWJXjOq8xZvBQSfXowO5QxLJjXjiS8zotK8DiJgiisk/Axnxz5ePDufVqO7
	k9njP3ucIPKYsHJu1h/tx6PfwxKOLBWZu1yhM9aiX+L+vzcpqYrGuLkyq41XkejA6so/wCCEjmh
	AMPO8ajnr5P0WgxqZM5pf/J+ym5jekaeMU82Mz6pBig1hLDqibeSF3PU6Hq7lIopIusCRuBQPaS
	hsQfxTq0bQKxrIlqQenx0LoBOKWxqXw+r3qaki2dNK/w0cYfj2UNypg+BCIqvaFUBKW7yoaDwD8
	lvV6F+azlIzUiPGigaNmwbslkvkV9AD5hjFw+eVzcfOpKn7yh63F4=
X-Google-Smtp-Source: AGHT+IFKcT3KZ6F5cHrXTlydWgyd1JuFvppbFsoLD2jFXYXeFZihdr8Tlj7uRzO7WrrPLR5+bwhxBQ==
X-Received: by 2002:a05:600c:4f46:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-477c1103099mr389390305e9.2.1764593849911;
        Mon, 01 Dec 2025 04:57:29 -0800 (PST)
Received: from [192.168.1.36] (p549d4b1b.dip0.t-ipconnect.de. [84.157.75.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052cfe70sm153236355e9.10.2025.12.01.04.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:57:29 -0800 (PST)
Message-ID: <92c1609c-735d-4b5b-85ff-c40995aab813@linaro.org>
Date: Mon, 1 Dec 2025 13:57:28 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: labibb is not used on
 OnePlus 6/6T
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, david@ixit.cz,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz>
 <3fcfc5b8-7509-4e4c-a1cd-e973d7e1d091@oss.qualcomm.com>
 <f86267ee-ad70-43ef-8e48-b9f2e509c193@linaro.org>
 <0d63bddf-7a88-4c59-8ba3-6655e7a8854e@oss.qualcomm.com>
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <0d63bddf-7a88-4c59-8ba3-6655e7a8854e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/12/2025 13:55, Konrad Dybcio wrote:
> On 12/1/25 1:50 PM, Casey Connolly wrote:
>>
>>
>> On 01/12/2025 13:48, Konrad Dybcio wrote:
>>> On 11/30/25 1:08 AM, David Heidelberg via B4 Relay wrote:
>>>> From: David Heidelberg <david@ixit.cz>
>>>>
>>>> The lab and ibb regulators aren't used here. Disable them.
>>>>
>>>> Removes following warnings:
>>>> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/lab
>>>> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/ibb
>>>
>>> These are only vaguely related, as there's nothing to be wary about that's
>>> specific to these devices - it's just devlink being grumpy
>>>
>>>> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
>>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>>> ---
>>>> I assume this is right approach, as OLEDs on both devices are driven by
>>>> different regulators.
>>>>
>>>> Question is, if should be labibb nodes enabled by default?
>>>
>>> They're onboard. I'd rather keep them predictably parked than left in
>>> whatever (potentially ON) state the bootloader may leave them at
>>
>> Shouldn't they be default disabled in the pmic dtsi and only enabled on
>> the devices that actually use them? Many SDM845 devices with OLED panels
>> don't use these regulators.
> 
> As I said, I wouldn't be surprised if they were enabled by the bootloader
> as part of some reference/common routine and left hanging. Linux will
> switch them off if they're never used and I'm fairly sure the users won't
> mind the odd couple dozen bytes of runtime kernel memory usage (which if
> we go that route probably balance out with the added couple characters for
> status=disabled in the resulting DTB)

Ahh yeah I understand, the DT node has to be enabled for the driver to
load and actually turn off the regulators if they're unused. Makes sense.

Thanks,>
> Konrad

-- 
// Casey (she/her)

