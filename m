Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1AB30F7F7
	for <phone-devel@vger.kernel.org>; Mon,  1 Dec 2025 12:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593435; cv=none; b=nEUkGVxy0PeHybelFUDeQ/dLrZryOaJcu49oJO3u5Qu//1CWr0e1slAOLm6adtFG0PAC+6Dt+8OqawTyDewobC7kJ+wqVyF9TpB7DqdadDcGSBIWSV38K0nBWXfCCgg4lL//o+Mua9faCPsn3BRGKbpD2/HVd1RVstX4f7nwt1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593435; c=relaxed/simple;
	bh=3Lempk/IOUZAlYvbPF2A/aQxGYHdGcn33YO5RSNVjRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skGl0knByEsK/iaIpoP2HSck9T1hJMdWsEQ9dAe/de693FfFoZdup55CQmsWW/T+Dz7mbubIwzci62Snlznmj/SftvefvUeg+Ub1QszO6z/BCNhPFfQTHj1NFBdTOjQjDn1Zlp1jPcYOL/XGHNEaJZluQSyUaB2yi0aSMz6CiFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Aau7poNP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Aau7poNP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so29789355e9.2
        for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 04:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764593431; x=1765198231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3JlqK0ZnrQL7pFj/vous2tYHR6XDdun4YSY1ntH8dXY=;
        b=Aau7poNPM7BaKhv7LzTA1uvPJ5hOOUaCNxivIpo4UcfK0q5aSNKsU8SsQU+AmWpDkJ
         Pylb8ifHaIrJ8hT8SfJs973553skug2nb1bcSY5AhOMKSlIAHXFcbXJxyJK0ik8F0Roq
         7yruYhQ4QN/sGgXGf2PgW6TEZJ2umCfxZBgVMdHYY2wYruMpZ7qmFseY42ZNXm2WQ7W8
         KluFhMSvUJOx4aiqSeMUNsDifjIKBUkEh6Y2osEhE+3VVxuVAQxJ0ObkzWC3KkpxraQA
         IHY6+iS+xI8CocwcyoAtY1wTDz/khi3R9GjY8MzDvABTb5SF++DO4Qm1YGa1d6tZdJ+L
         bmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593431; x=1765198231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3JlqK0ZnrQL7pFj/vous2tYHR6XDdun4YSY1ntH8dXY=;
        b=gipKFuRHkKWMJNGwpNH3/sEhq9gcZr5QF46IkfT3jxKiHc1KxEW+twXhj024TF9F1L
         7eVtLLheipOAzB/WY0YxjRHxodhc/AHVtO3ymAbyBtkyZFstWiDxI0sF/lK10d6NMl8X
         +DBXJPIs4B/sE9hbhfcdagR8Ls7EU8xvCYVHnL33ObgEc+n4Ph2YstbHR62msxfhsjUj
         +8bvl43GsS9My2o+GUl1UIOfvuzhlW/gJ73KGOd4D8+ysIncKxr5r78FoF5PUacC3Uhx
         rKYKvJh7UFBp3zkrgUYSWMf8WPxjwsLvvmO7lPmXTjJtuwCIfyg29/qONulguyHgWP3z
         QuLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfvpqDIbDlHPsKfmPCQNEPzKS+gYCuhsyJzgBtNKRjPdAGeidLh4NxtqKKCcneOBXVM55EkP+eiR6C7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdrOiwcHyxWSovbzUnHVlWBcOuMb+t9ZsxBiwdq21XtOSbFPQp
	eJrAgzlVA62M1Ip9FU4sSXXz9tzjaoNps696uxcRXCyO9l8uN5VUL8TcSkAOPUE+EEA=
X-Gm-Gg: ASbGncunglYy+z2ykkf5M+e42CRYnZTPNRfKglYninkChjss12CvLD/PyYHLrb1xE42
	G02nec8oBM2laxDkjzMHEgpAAqf0W1C8l+blSX8x78PgrXjxyi8ZJidK90G4Avmln9syQ6DNnrn
	bLi+uoa/SDDJpcG/ms+UvirxtlhCqUfPiNkrqFYx0KUGmyaA3JtCiP1FqcscI/de0Nr8aeTfPZQ
	6y1Aw/34I7llV/d26pm0qNgT8AEaY97DgR4SICnmzip6ECuGMLfR0TjMuPfYnu0g0rRoCdGYqB+
	Dtk1sCAN8a3urSS3uJd6w7DVzb6pPbkMt5fiDAPlc6XKbVo3TsMJ6JEzeI6N+YIconG8psNjyxc
	puXT/GtYsC230P67lomb1N5rpKH8ah0c8dvz+16VKyvgrLhKdRF9TsFbkHU7o1V5pFRypalE7Eq
	atJjbJvoEMw3zBrh91K6rTQrHvTqhsNOeZqnIhCII39xDc9+2raFA=
X-Google-Smtp-Source: AGHT+IFCiHhSv7clOJbOTsjbFGUe1tQYLwM5Ciro9iNMejKFvi5zfUI19dCqAQbxePS0HCp6jxwcYw==
X-Received: by 2002:a05:600c:1551:b0:477:7d94:5d0e with SMTP id 5b1f17b1804b1-47904b23c43mr242645295e9.27.1764593431085;
        Mon, 01 Dec 2025 04:50:31 -0800 (PST)
Received: from [192.168.1.36] (p549d4b1b.dip0.t-ipconnect.de. [84.157.75.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040d3c72sm158803585e9.6.2025.12.01.04.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:50:30 -0800 (PST)
Message-ID: <f86267ee-ad70-43ef-8e48-b9f2e509c193@linaro.org>
Date: Mon, 1 Dec 2025 13:50:29 +0100
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
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <3fcfc5b8-7509-4e4c-a1cd-e973d7e1d091@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/12/2025 13:48, Konrad Dybcio wrote:
> On 11/30/25 1:08 AM, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> The lab and ibb regulators aren't used here. Disable them.
>>
>> Removes following warnings:
>> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/lab
>> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/ibb
> 
> These are only vaguely related, as there's nothing to be wary about that's
> specific to these devices - it's just devlink being grumpy
> 
>> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> I assume this is right approach, as OLEDs on both devices are driven by
>> different regulators.
>>
>> Question is, if should be labibb nodes enabled by default?
> 
> They're onboard. I'd rather keep them predictably parked than left in
> whatever (potentially ON) state the bootloader may leave them at

Shouldn't they be default disabled in the pmic dtsi and only enabled on
the devices that actually use them? Many SDM845 devices with OLED panels
don't use these regulators.

> 
> Konrad

-- 
// Casey (she/her)

