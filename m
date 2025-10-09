Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB432D877C
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760004638; cv=none; b=q4Irvv5LPnF+qaa3FnihHM8om++YPY15NOqgTUwqeechlYNWqU5m3sDW6nbrC+w/e/A+qq/DCl3nB5dr9FVjCQFSBJZLEJ5jixmXJ35QInRm4PWoRjJ6mUgF8po1ULE/3iStsYQ+2f4tovh96ePGwy82y2ahyE4xcF9Cqmaw3Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760004638; c=relaxed/simple;
	bh=gG4uos5u7JZYKZN9sVpZMjMGBZVjLgLK+l61W+7327M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FZzELfa5hVYsOuaZZapdtDf5DT7qnsT+2uMCsYy05R1DmZUJ6BiLtehh8UjLjVlLhA2HthDfX3m9eWmGgpO7p0ducxUysl4bGA6YxdM90dUIDEx/xYVjjAd98QBKbGcyF2tkJtZMSkt+5uHmCbqkFVju7EHkCaSCNOL8oJcp39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Vc+9kMgs; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Vc+9kMgs"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b463f986f80so169562666b.2
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 03:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760004634; x=1760609434; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viQs/zJlFXUzbGPc0YC6fbKblNDfZ3K6sukiP7yGwdA=;
        b=Vc+9kMgsIuD+EPFwhTPJRM3ETJLY+5xhBq6fHJL+NQO1JMT55AeQ0euergmAZNMFHh
         FjqSA152TXjMzTDqgw5X8N9U1vOcNWRfPQqD8YOoaltg3YtLg6RQgQEbE6V5mzXDi2Tn
         +6AbmCnlD3nsaNrl/1o889LGizsjF+sMuBZLtlmrLY60mD6VufMlt/us830IwRubUu1+
         UssuUPtfw/QbqkRaPurP5p1N/JIhJYCh73Ylky3ImPWGi36foOBpsc9Xv1CslboiyyZz
         yWB759KdXeZh/fAmuCBl8MNgLeS84pHnEpIpoCRyU+8o5es7TinxldV0Y67/UShoy3Oo
         R/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004634; x=1760609434;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=viQs/zJlFXUzbGPc0YC6fbKblNDfZ3K6sukiP7yGwdA=;
        b=iS6Hj1xpvw9BrkGysSYssSRRiWRqlNMYI5Oh+3fWLncu/YtlB4tywOcE7av0sUwALy
         McrRVH1aU8rzc3S3tvq3UpGkn/wFXizhXH1uyMhLuZxUkePdevhaH+948dyUGgCS0+nn
         d3f28gYY3ciIhjjTJDTYjMneAMBCwvWY2aRyPmGzlOMP5Hm+FfPmkrXLKyvfqfGnaXXM
         vfYWQqSWHCqxq4OHVRMTiDCp6nCmQHgbZx7uZmqOcCPkKpSNlJ72Q4IeSsrP76uxQ9JU
         uxiVKZXFyMr9zfIrVwy+wTMIICL33BiIobf+Ug5m8y3yQ/ig1Z1VKxzAO4RutiRHFJW9
         E/zA==
X-Forwarded-Encrypted: i=1; AJvYcCUBQozmTnQldAwcIrG38KkNB7pVb1fgBQRe/zIdvTWyHfZGXF1bMgV0mzQB7MpsqyX6P/tWhbS4zPzYKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YychSu2Ti0LsEk8CDL7+1sHij6D59bzZWR4M10FJWvXvGL0/Vhg
	AznyQ/0YaDjbJ1VJ7pTYdUtFK4wTPz8qghurjA3nbFSAi5lVRfhVvSEU46XFf7/J/4Q=
X-Gm-Gg: ASbGncs9UMi1XTH8vXWFzGzAnl/eKSAVpjYCAEjMKp3dV4AufpzfOLwZe6tNxB5Xn/7
	/fOZ3eK07+haEiP+DlGuJAj7fUrkZkVhX3VtXFfyBCixWlu09ATEiXrZ9/kX02WmZ/oyM5U74Jk
	bjvZlTGHJ/baLV5Mmfz2FMBdyxOA5YkkwXbw36CdP5kYsJANdPMhgx8evm4qwkyW4PQEjPuU1g+
	OJ045N9cPHrHZC8DCXDG3Mr2c7Re8Cn3UlsgCdeo8vhf9jdoVMDQrFKp4gFpAnASRADdrZMKS1x
	+bJuPoxa7N7IwIaMb4xDJcIVrDvgkPCBZXnQd44b1z+XwpcbSjvOz3p6JsYgl/NL7WJxHlozlhb
	AovQr3RuB/7jy7gK+2d0am3vXiKvbfr/uYaiC0SPhyD0uGgtE8u+dK7QykCYwScrxAl7Gj7aPux
	9WZo+99WeCE4ojcWDKc8UpjZVV6mo=
X-Google-Smtp-Source: AGHT+IFKo/O79Io0+uRDFxUtJz1dvwc4fUBNTtl0a5vuuzbIOA2sW+cayD8+0hP+Jrhv2ADqtpK2hA==
X-Received: by 2002:a17:907:d86:b0:b49:5103:c0b4 with SMTP id a640c23a62f3a-b50ac5d07f2mr831965466b.56.1760004634280;
        Thu, 09 Oct 2025 03:10:34 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e77427sm1905317166b.36.2025.10.09.03.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 12:10:33 +0200
Message-Id: <DDDPKMMSAMJR.1JIQMK3W2Y40V@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 VTOF_LDO_2P8 regulator
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Marijn Suijten" <marijn.suijten@somainline.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930-sc7280-dts-misc-v1-0-5a45923ef705@fairphone.com>
 <20250930-sc7280-dts-misc-v1-2-5a45923ef705@fairphone.com>
 <ac1c0d1a-36a9-4542-b879-06c017f7f2c4@oss.qualcomm.com>
 <DDDOF3F8K5WQ.FTJ0F6E6DLPG@fairphone.com>
 <8e452e51-3a95-49e6-91e3-53aa46fcfe2e@oss.qualcomm.com>
In-Reply-To: <8e452e51-3a95-49e6-91e3-53aa46fcfe2e@oss.qualcomm.com>

On Thu Oct 9, 2025 at 11:22 AM CEST, Konrad Dybcio wrote:
> On 10/9/25 11:16 AM, Luca Weiss wrote:
>> Hi Konrad,
>>=20
>> On Wed Oct 1, 2025 at 10:30 AM CEST, Konrad Dybcio wrote:
>>> On 9/30/25 3:57 PM, Luca Weiss wrote:
>>>> Describe yet another regulator-fixed on this board, powering the ToF
>>>> sensor.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 13 +++++++++++++
>>>>  1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch=
/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>> index 36d5750584831d66b4c2faf6042e4cbb3274eca7..0a64e5721e092d1f3e4bb7=
329335704eee567761 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>>> @@ -195,6 +195,19 @@ vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
>>>>  		pinctrl-names =3D "default";
>>>>  	};
>>>> =20
>>>> +	vreg_vtof_ldo_2p8: regulator-vtof-ldo-2p8 {
>>>> +		compatible =3D "regulator-fixed";
>>>> +		regulator-name =3D "VTOF_LDO_2P8";
>>>> +		regulator-min-microvolt =3D <2800000>;
>>>> +		regulator-max-microvolt =3D <2800000>;
>>>> +		regulator-enable-ramp-delay =3D <233>;
>>>> +
>>>> +		gpio =3D <&tlmm 141 GPIO_ACTIVE_HIGH>;
>>>
>>> You may want to define the pincfg/mux config for this gpio too
>>=20
>> While I wouldn't say it's not good to have it, there's plenty of GPIOs
>> that have no pinctrl for it. Downstream doesn't set anything for gpio141
>> either.
>>=20
>> I honestly wouldn't even know what the 'default' for a GPIO is in the
>> first place, or could I query the runtime state from the kernel? Is
>> /sys/kernel/debug/pinctrl/f100000.pinctrl/pinconf-groups trustworthy to
>> solidify this in the dts?
>
> I normally use /sys/kernel/debug/gpios

Oh, if that works at least the path is a bit more memorable. I needed to
check quite some files in this directory to find the correct one.

>
>>=20
>> 141 (gpio141): input bias disabled, output drive strength (2 mA), output=
 enabled, pin output (0 level)
>
> but this seems to be formatted very similarly if not identically
>
> Generally it reads out HW state, via (among other things)
> msm_config_group_get()

So, you recommend setting a pinctrl for every single GPIO that's
referenced in the dts? Shall I send a patch to add all the missing ones?

Regards
Luca

>
> Konrad

