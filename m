Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB34C351C14
	for <phone-devel@vger.kernel.org>; Mon, 22 Jun 2026 07:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782111927; cv=none; b=QI6d6+DUtn52ThRSBQWOuBMcvPm9CmciVOD9rKyKcnBK2oBU5W2/Lb4fgxFAadgqfKHZnfnLKrvKdtwc6eK1bScoYEQFy5e1+6Fga2NLusotGH5Nhbcte6siom7BVQErwMh9p+qgbEJqcs1oMEPvMI1eR1WaeJXgYCrv4eSZfg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782111927; c=relaxed/simple;
	bh=/sPH/4yOVljlqRqNUbXxHIhT6Bka9y5KCIYoKxZjVgs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=cM6NbK9sXBQahp3tiVSEYjsww2mj5PUJdWTZPbld9AF44DjbQ7R3bD3YZto+l76Mf9mwlP1T4eJEMm1yFPVURXZn9k3RdoKzmQgpdShU+Lt1zD3qOgymYpmzkFZyAZ4St6snXhw2dWfZg2lydluXra/g52WXm9sRK7S9k8535OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RFX9AYCi; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RFX9AYCi"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69690062350so3425394a12.0
        for <phone-devel@vger.kernel.org>; Mon, 22 Jun 2026 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1782111924; x=1782716724; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2dGSrY6zQBJiyRE8tkOjBJN/7dRnPUdVyyrkCIBUgQ=;
        b=RFX9AYCig7Ub66hNakKuO+CUDa8Rph3pfR2X896WQDDtJThzBrIBLUurEFdkcfvqid
         wNj1iw3m9z4HVSRrbGI9crpkm7iQ1/YQbaTjReqsyw1aZOLoab+vJ+5ePH8n1uPXLglS
         eqDktRevvmv6VnkOryWKuhNJ6GEKvobqoIMykzgAWlGTQ/h2oTYKqYoWSYo/gVMlCrQs
         V25lVdDS6z+MpwnRGdIjM8esbrwAN3jREdnYWLp0GfSdkLqA9GHkNxSfaG9KJo967ynF
         n9MeEnDMERLJchiSZ19bnEW/h19sLkoehg0RS49UHa7RkcXzBxLCQUjewD7isxF7PuqP
         IxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782111924; x=1782716724;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A2dGSrY6zQBJiyRE8tkOjBJN/7dRnPUdVyyrkCIBUgQ=;
        b=IlvjnsyDKUt7Pk4n+cPM16dX5bEBGpoU23FGTx6EwnpR/1h8EVnyjR+bFDmnM5VmVz
         N1F1VAJTCuB8uQ2cMwcaQBbZF8GdwvDDCmiSdyy59zxCVBy3dVq2nwdXVCYbCncsoUEN
         R0BT7buf66aT5Kjmk8UTmJvJU2essndWV0f6o9r/rW8cOaSkEinuuTO5hh6SLRSqS3pB
         Zjr1dIM9TCaZtDkPpnoQVv7Lqwt77Eczo2Ic5oAMa/Dnq/P7B2aAZv/wEhTd1BUx+cgD
         aK9xtJ0NFKia36iPPbKS5wXvDVNDEQJwqcGIU083QsXTsDil4s9xdtUyt1BJ7u/R8Iin
         7CsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UeyLiETUnA0XrvzqC2OEHXQ1jgrMZoFoAVi6DKfEUbvwplxoWGlzh9dMgmm4NzbVsGdVx5D4diih0lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO+4Ay6WyyIPLw3tdnI++yFb35YyD+fU1Qy2q9WNt232goVIfo
	CpjaiMMc3kGmlUqgzs9x3oQ8yVhQouSsqFAOPUZ7YgJdTrgJPzFyXIER81TbyJyru70=
X-Gm-Gg: AfdE7cliTIqYDRMfRfCGv37CuuL7zpte1fxO51ztJ2YB9NIOB6zaT9akV9RVNgUwZt+
	Pgljj+6nXCbjTPoeTmNgIrY6Ne2y4a0fhssJIQ8UElKOMr1XUK6I3GZhxwujuxfXflBkGF4koea
	Vd7WmCCH6cXnHzehpVDkt50y/oO1+ZdlBdNAs9mdlwnrTSWQ1STwwV6Wh70AivCzP0y0VHsbmac
	pte+ohjAmNy9efLAjrfkmPPiPiilwSgrucjEmynGarX3YXUBjxrPXIRrtxhFxSE7Yx7T8H4ew0J
	ShBKrepX75bOCz29i2LocerlpBRKgwMzzUT0Rsykjoh737z6yi7HgxjPuEafwmi0Wx4g7c/EAsU
	+976zsln4f8Y9z4RVG6+1lHl4jrxdm4ecePwqM9GiJG4KBpxzpsZt3FhTrWX1VaUN7mx/RlVXas
	XZmGPuJrTpKceNazxEqLAm4WM4lKrik+jq3Jqxok7DheiuhfLipVR74/aRLFs9jGqVQhKR2Sxuy
	VP1khklzwy8rVnBeypoLp++o9w=
X-Received: by 2002:a05:6402:3886:b0:691:b5aa:5a5b with SMTP id 4fb4d7f45d1cf-696e5211752mr5971797a12.17.1782111922988;
        Mon, 22 Jun 2026 00:05:22 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697b8780d08sm701001a12.0.2026.06.22.00.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 00:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 09:05:21 +0200
Message-Id: <DJFDYAS1AY8Z.3GD4A5UMWLAUC@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
 <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
 <ba0e9f93-fd2b-4895-b8a7-8e38eeff9bcb@oss.qualcomm.com>
In-Reply-To: <ba0e9f93-fd2b-4895-b8a7-8e38eeff9bcb@oss.qualcomm.com>

On Mon Jun 15, 2026 at 2:09 PM CEST, Konrad Dybcio wrote:
> On 6/12/26 3:46 PM, Luca Weiss wrote:
>> On Fri Jun 12, 2026 at 2:59 PM CEST, Vladimir Zapolskiy wrote:
>>> As documented in the "Devicetree Sources (DTS) Coding Style" document,
>>> pinctrl subnodes should be sorted by the pins property. Do this once fo=
r
>>> kodiak.dtsi so that future additions can be added at the right places.
>>>
>>> No functional change intended, verified with dtx_diff.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++--------=
---------
>>>   1 file changed, 691 insertions(+), 691 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts=
/qcom/kodiak.dtsi
>>> index fa540d8c2615..62daef726d32 100644
>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>=20
>> <snip>
>>=20
>>> +			qup_uart12_cts: qup-uart12-cts-state {
>>> +				pins =3D "gpio48";
>>> +				function =3D "qup14";
>>> +			};
>>> +
>>> +			qup_uart12_rts: qup-uart12-rts-state {
>>> +				pins =3D "gpio49";
>>> +				function =3D "qup14";
>>> +			};
>>> +
>>> +			qup_uart12_tx: qup-uart12-tx-state {
>>> +				pins =3D "gpio50";
>>> +				function =3D "qup14";
>>> +			};
>>>
>>> I understand and support the intention to keep this change non-function=
al,
>>> but this pad "gpio50" is for qup16 also, right?
>>=20
>> According to my QCM6490 data sheet, GPIO_50 has these functions:
>> * UART for qup14 (OK)
>> * SPI for qup14 (OK)
>> * SPI for qup16 (no pinctrl)
>
> "no pinctrl" meaning "not defined in the upstream dt as of today"?

Correct.

>>> Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63"
>>> for qup16 function, I find all of these are missing on the original lis=
t.
>>=20
>> GPIO_54:
>> * UART qup15 (OK)
>> * SPI qup15 (OK)
>> * SPI qup14 (no pinctrl)
>>=20
>> GPIO_55:
>> * UART qup15 (OK)
>> * SPI qup15 (OK)
>> * SPI qup14 (no pinctrl)
>>=20
>> GPIO_62:
>> * UART qup17 (OK)
>> * SPI qup17 (OK)
>> * SPI qup16 (no pinctrl)
>>=20
>> GPIO_63:
>> * UART qup16 (?)
>> * SPI qup16 (lane 3) (?)
>> * SPI qup16 (lane 5) (?)
>>=20
>> But the GPIO_63 looks weird, is the data sheet wrong?! Where would
>> UART_RX of QUP1 SE7 go? Maybe it should be UART qup17 and SPI qup17 and
>> then SPI qup16 ??
>
> GPIO63:
>
> QUP1_SE6 SPI_CS2
> QUP1_SE7 UART_RX/SPI_CS0

That matches pinctrl driver and kodiak.dtsi at least. Still, the data
sheet is just wrong there. If you have any contact to relevant people
there, please let them know!

Regards
Luca
