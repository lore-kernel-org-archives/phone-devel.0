Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64F62D3EFB
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028865; cv=none; b=Qhn3jdn4OIB2emhHaRszjcS4zqa6iBZ23gXetA+nECRPppQC3gz6dockU1ZzMEPeCyJresTxsLyN1Yc6wca3VK+8w0Pn9962nOhkOCsVb5hCJyxlB64xQkfrQLOE0h4stHjQ9TDrL5YCN4vYmIkZECLfjXahY2COkvmhr4ko3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028865; c=relaxed/simple;
	bh=Du0b+TeI3ZTwjyWt4pvKm1qINJzsD733zYyEarZI+ak=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=S6dZ9xqJ6Ho1ZXgF2O6xN51oXbG2OKgiujAT9QqPVur4WNA9JdqWJxmkwh5dspIllOo5EoGg/BtTKqTMWFEru+FOck/Ehuu+zv1/fM7Cy0o8mnKsCiThcQHyG9fUqW2HAOAcP5Mvx8UCYxTLuEr/aOuE4+480HmomRUFkUi7nuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kwKZnHLI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kwKZnHLI"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so369110766b.2
        for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 05:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751028861; x=1751633661; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nhdHiI1mmifgnWppwRjST41ES3N+612bitCEUi1kbU=;
        b=kwKZnHLIudBDOYp0TsE/PcyW4o/D77UX8c/+mzMnR9hyQgmWVSOfrmWp6UiPLCLiNl
         JsOFHN8WY54Q7tW07j/1I1TVgdVIT8byUpmJBWXhmcQh0SEqoemGNCr8cYAm0aylCGQj
         uXal0qpCzCM2WyTFSvFazoJ+kVrCGdSZIegRoKdAiBRVxWq+Y8a7m5lsRlmJ66zHr0n1
         cJ/b1p32A+S6Jin1xysI0ynRFZPoqq0N9WiGHa53/uq1i+VP+Pr9FdCRTKeSqieXl9um
         IelpFnI/oW9EET6O7isLuWYfHt2/S19lFOlJTaZaRRo//9ZnKXj8tH9NvmkuAeHjaFfO
         gOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028861; x=1751633661;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+nhdHiI1mmifgnWppwRjST41ES3N+612bitCEUi1kbU=;
        b=Z8s76A0ZexXB7mCTUWYBC2lFeKFdgELrkodZCG0FESL6VcRKx+ZMaiOKY7VCfIcU2j
         pEN/WFun/8xowuRyx1lgAzgGtRmK4LRgoSsidUwNRritaIpAztE9rd2jFXNfWZRv6vFO
         +gQxmAEd4c48uNHl1GXyfZWGCHVlb81M4exVV3SElbkX75TKSofPFUdPoR6/feu2m5tL
         AtzXLQETkrfz8UnCrXa5yqxv840y0vPAJwPuB4lf/Iq7n7RL3LY7gUCi8UAO/Rka3JDs
         7qqbR7E61TxYcR99yiB94HNIL6iinqUuxiVRUB6OVKCd7WaeNuKd7MAv/grkpKpbPwRK
         gg6w==
X-Forwarded-Encrypted: i=1; AJvYcCXA2KPK6CSnjCDuMZh0wezeW4GK8CjIbqJX7Dgt03lhWMAmc5yntOliZOQwwBL5heTo+EQqbuvsk8AcVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBOC/UVDjrBBvRCnXoBjLWUOgDktb7gtHAUWA0LSB0yP8TVuMO
	1PnuYSOTkV6WNnqYblVwPytVgji1Gdg9rAZsWeAAt11agVID50ILClETp07YI9aXwJ0=
X-Gm-Gg: ASbGncuOFOeMPyPswLCSDvNWY/a9zxNfTYIpDxFSXHEc/kfvizrCMm0Vjx+j8ryMfmV
	bSusv+gm7KXL8JNq1L4x6pq5Zf8qS7JcH2mY7wQsdbyHDK2FsvihuY6xiYvqgTq2gkD7xhL4uCf
	YSDAgfFH4zylLeohpeI7gWXiB6PnbiIecBEYMSe6paj0NGmlnHbXAX3loazrg82bH+8OqCB84FJ
	5lo0V7F/eH9Cbu/qOfGWiD8kHs72lW7W8zDKT+5oJG4vUvVMmDK7z0MnDzYFpnaxZGTcSQvl3Qx
	hd6b3YybGJF6cmEEOGAYclKhnq8ozrxFp0pWSb1Byd1SKeImfjwF8LvpvpLXdV3tFGftpNF1uYD
	ilmZuXVixqSjIGRSckfYVtCJtk+Bhefg=
X-Google-Smtp-Source: AGHT+IFsbMB++QIubPPkEjUAaoqBr8kfEWyj7SeiVTthlBeTY5ebiAvDyXm55/dHcIfRL97TTYOl8A==
X-Received: by 2002:a17:907:3c89:b0:ad2:417b:2ab5 with SMTP id a640c23a62f3a-ae3501b9be9mr278351166b.60.1751028860934;
        Fri, 27 Jun 2025 05:54:20 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659efbsm118554866b.46.2025.06.27.05.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 14:54:20 +0200
Message-Id: <DAXBXDDJAXDE.2V71E3E8F3GIH@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-leds@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add PMXR2230 PMIC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Lee Jones"
 <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Fenglin Wu" <quic_fenglinw@quicinc.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <20250625-sm7635-pmxr2230-v1-3-25aa94305f31@fairphone.com>
 <bced42f0-bc9a-47e6-bbdf-c49657d2e18b@oss.qualcomm.com>
In-Reply-To: <bced42f0-bc9a-47e6-bbdf-c49657d2e18b@oss.qualcomm.com>

On Wed Jun 25, 2025 at 3:20 PM CEST, Konrad Dybcio wrote:
> On 6/25/25 11:18 AM, Luca Weiss wrote:
>> Add a dts for the PMIC used e.g. with SM7635 devices.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi | 63 +++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 63 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/pmxr2230.dtsi b/arch/arm64/boot/dt=
s/qcom/pmxr2230.dtsi
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a7650f3230c01422b76ef78e=
897e5e7ae2f20cc6
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pmxr2230.dtsi
>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +
>> +/ {
>> +	thermal-zones {
>> +		pmxr2230_thermal: pmxr2230-thermal {
>> +			polling-delay-passive =3D <100>;
>> +
>> +			thermal-sensors =3D <&pmxr2230_temp_alarm>;
>> +
>> +			trips {
>> +				pmxr2230_trip0: trip0 {
>> +					temperature =3D <95000>;
>> +					hysteresis =3D <0>;
>> +					type =3D "passive";
>> +				};
>> +
>> +				pmxr2230_crit: pmxr2230-crit {
>
> This name is "meh", please change to tripN
>
>> +					temperature =3D <115000>;
>
> Unless there's some actual electrical/physical SKU differences,
> downstream lists 145C as critical for a PMIC carrying the same
> name

[    0.085990] spmi-temp-alarm c400000.spmi:pmic@1:temp-alarm@a00: No ADC i=
s configured and critical temperature 145000 mC is above the maximum stage =
2 threshold of 125000 mC! Configuring stage 2 shutdown at 125000 mC.

Same for the PMIV0104:

[    0.086556] spmi-temp-alarm c400000.spmi:pmic@7:temp-alarm@a00: No ADC i=
s configured and critical temperature 145000 mC is above the maximum stage =
2 threshold of 125000 mC! Configuring stage 2 shutdown at 125000 mC.

What shall I do?

Regards
Luca


>
> with that:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

