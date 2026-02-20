Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA3D32ED3F
	for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 11:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771586814; cv=none; b=GOC8nIfq0hAEJgDdcSzoCI14RtxIigz3E6EiuVINgL3ZBcKw++4XSOfO/qs1b4lT17EbqZj6rSiAj7z/BnT7fMrC9j/d9220H9orcFXsYsyGmRQVtxrRF4W+l4fXPIcGfuVnVpTrPmxuG9sRrzulS+wXVpHbj0VrntDVZrsti8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771586814; c=relaxed/simple;
	bh=m91/Pj6i562vC9RgSAKF0lAmXFt7YMj8wOrD5dUjLts=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hqMPS6OsjUH2qZFZJ+NYl1Y6gan5vUa8+b19YPR01sxiYmjzhEG3DWfgmAfoYpALbVd+Ygv1SiP+S3jTr4a/u4DD4sejgnNx8txSc6HDQgRIftunNQOW/LWJXoPMSk1AsbjPNsveZz/qzhuaL2sp16b3ErGMI8tPVnrdXs5cHM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WlDvS1KO; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WlDvS1KO"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65c01595276so2866192a12.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 03:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771586809; x=1772191609; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83zz9Fx5gsW9BIv6c8ksqWZjM7IcWR5idqwhbUOB91Y=;
        b=WlDvS1KOyibyFVCCqJYzkavPTQYwMCrJrR1gCfkhpkNF23AFSKSY+Up0Iv6MUlmgxE
         PXDuz1A/97WtcAr0YtYUGl7rJ68Bh/eE6CONVuBcbcodcwMl5QgtPKDX6VNHyDzCpc8u
         H0dkeiQYKV24KqYmXnT/GjGoGJKHYR/a+a6k9xkGUjFaZq+sB99hUzVrr5ot7LbV/s1L
         vVXJF3vftRivB5EREc9uShQmwh35W8/9GtfzeRuISyBK/3U3D/wZpWRDstRzvYY2PVxs
         hKVSH4Q5Tz605zqKfqa5PSxa4Oi/KgW4IFVmuEPejgHiNP1bbBvnI4Ozo7FsnIsjpQZq
         fO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771586809; x=1772191609;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83zz9Fx5gsW9BIv6c8ksqWZjM7IcWR5idqwhbUOB91Y=;
        b=fTOtndECxZoaOsJyiOjv0Uucj+ANj5SZ5gDDAHzpMIk7xhGKNj9reDH/cJpdBZOOAF
         SwyiQUvzeUsnrS5Kp6fCIerRGertCO0RFlZaAiv9i3v6XyluZY7DLrtJ42b412PdT+XZ
         UkQG2Ik/+jyrB41kKv7uObCO0ppSZAbkRkTExBRKQ5XCV5z2ONh/xaFA/HUoNRoy7cgz
         wobkdBgbwoa8NWf5vOY5betXPbSqI/sokDdv7h4BnMcGu3uLWUBLM2ZyHHurSLrPZ/Jn
         f9nsKt72X0k17v9X2xMZ/mUVY7WyokiHWh95frYKlWHm6FkPTsGfcP6A9ZGm+vtLsC85
         ldyg==
X-Forwarded-Encrypted: i=1; AJvYcCW4Skx99lzJmwoPe5ezPKaHxWivuYQjqkDB8YdOdtxwg7NdMIJKGXGizGKgIg4Gz1TtcaAgJmoaB9pEDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2f+Gi4rGxPzyGNDTLO/9qz1lPQ5kGr0Utl2aYTxhBtC2dpNvy
	glFaOkMEi65hhqDIJSBfPxpweS7OzOebVlnLvbPY7C4bciU6I+ghjWo/wm9FD7snoYA=
X-Gm-Gg: AZuq6aJl0EKx6XycVlB629Ac1fnwrJcyqLDSl6FZcHusJNQVDxnXfWxpuaEjhRR6qDv
	IHzuK+lMtGhysi3YOgmeHgBHwjMzDzn6oSm4ZRCVA32aFaSTHLD95fxKYsUkszryhnQtQ11HMDV
	igrPCgxUF2PVpNCsiQ6t0ZClGq+OxzU0MDrWix1v5/+C2XPoFV78RWWFPw30Sat+Y/xHytSjsfz
	wY53YzT4gPsCRcy+euZWQvWdwrJ5ED8NKa88NHPvQjOd3kjSvrebQB/5H+eq+hFOvyXzwuPhxlk
	5fjSrvTKTpSPM4RlwT4uj6F5ccNE5JS0VwmJiVMNyM1etcYPXuQJF/+5WPrOMabG0/vmFwXp2uJ
	9aOxPUQcBNPrW6Okd7FQoEFzGvqgAZV5Ckdgl+HECzeutkRIwzIkvSJf2sQlG24oo3t8IPaQj3I
	w3ydNnnwCJUnoJDbaHQ5H5J+GlYw1I7tfKoEviAybicB6hRjL755EP6062czE6+jZ1nbbQKZr/A
	DUeK9U=
X-Received: by 2002:a05:6402:5186:b0:659:454b:7167 with SMTP id 4fb4d7f45d1cf-65bc7a751a0mr10415695a12.23.1771586809215;
        Fri, 20 Feb 2026 03:26:49 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad29d295sm4987701a12.8.2026.02.20.03.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 03:26:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 12:26:48 +0100
Message-Id: <DGJR40B5R6MB.1V4ZK5SW1PXAV@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Add
 battery temperature node
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Jonathan Cameron" <jic23@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Laxman
 Dewangan" <ldewangan@nvidia.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Hans de Goede"
 <hansg@kernel.org>, "Jens Reidel" <adrian@mainlining.org>, "Casey Connolly"
 <casey.connolly@linaro.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
 <20260220-bat-temp-adc-v2-5-fe34ed4ea851@fairphone.com>
 <85ce1f2c-f5cf-4e97-9611-4aed03f69cd7@oss.qualcomm.com>
 <DGJQ4WLIML3H.GAO7T4L3MCJM@fairphone.com>
 <a422e087-a91c-4bb2-9d95-e1cefc9a91bf@oss.qualcomm.com>
In-Reply-To: <a422e087-a91c-4bb2-9d95-e1cefc9a91bf@oss.qualcomm.com>

On Fri Feb 20, 2026 at 11:51 AM CET, Konrad Dybcio wrote:
> On 2/20/26 11:40 AM, Luca Weiss wrote:
>> On Fri Feb 20, 2026 at 11:00 AM CET, Konrad Dybcio wrote:
>>> On 2/20/26 10:19 AM, Luca Weiss wrote:
>>>> Add a generic-adc-thermal node to convert the voltage read by the
>>>> battery temperature ADC into degree Celsius using the provided lookup
>>>> table.
>>>>
>>>> This will later be used as input for the fuel gauge node (QGauge on th=
e
>>>> PM7250B).
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 83 ++++++++++++++=
+++++++++
>>>>  1 file changed, 83 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/=
arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
>>>> index b697051a0aaa..7857003099a6 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
>>>> @@ -108,6 +108,89 @@ rear_cam_sensor: thermal-sensor-rear-cam {
>>>>  		io-channel-names =3D "sensor-channel";
>>>>  	};
>>>> =20
>>>> +	bat_therm_sensor: thermal-sensor-bat-therm {
>>>
>>> nit: this should be a little higher
>>=20
>> meh, it's surprisingly easy to miss this sorting stuff. Will fix in v3.
>>=20
>>>
>>>> +		compatible =3D "generic-adc-thermal";
>>>> +		#thermal-sensor-cells =3D <0>;
>>>> +		#io-channel-cells =3D <0>;
>>>> +		io-channels =3D <&pm7250b_adc ADC5_BAT_THERM_30K_PU>;
>>>> +		io-channel-names =3D "sensor-channel";
>>>> +		/*
>>>> +		 * Voltage to temperature table for 10k=CE=A9 (B=3D3435K) NTC with =
a
>>>> +		 * 1.875V reference and 30k=CE=A9 pull-up.
>>>> +		 */
>>>
>>> I think this looks good. Is this data going to be correct for all/most
>>> devices (i.e. is there a single battery sku)?
>>=20
>> Yes, from my info there's just a single battery SKU, so that makes it
>> easy here.
>>=20
>> For Fairphone 3 there's two battery SKUs:
>>=20
>> * (Fuji) F3AC with NTC 100kOhm B=3D4100, ID resistor 10kOhm
>> * (Kayo) F3AC1 with NTC 100kOhm B=3D4050, ID resistor 49.9kOhm
>>=20
>> In reality, one can probably ignore the difference between the LUT for
>> either B value since it only differs by a marginal amount, but
>> conceptually I'm not sure how this should really be resolved.
>>=20
>> We could have both battery definitions in the dtb, and then the charging
>> driver could determine the battery that's actually present in the
>> system (based on the BATT_ID measurement), but given the design here
>> now, I'm not sure how this temperature lookup table would be propagated
>> to the rest of the system...
>
> The path of least resistance (pun intended) would probably be to make
> generic-adc-thermal consume an ID channel and accept a number of LUTs..

Not the worst idea ;)

>
> That sounds sensible since most battery ID mechanisms are probably also
> ADC-based and one would hope (tm) that the values output by these ADC cha=
nnels
> would then be distinct enough for the driver to have an easy time confide=
ntly
> selecting one of the options (or a fallback)

Charger / fuel guage and everything else battery-related would also need
to get the correct battery properties for the actual one present, not
just this generic-adc-thermal driver.

But I feel like soon DT maintainers will say that Linux shouldn't
dynamically detect hardware that's present and the DT should be the
absolute source of truth. That works fine in simple cases, but in case
of interchangeable batteries, display panels, camera sensors, this won't
work. *Something* needs to determine what's actually there.

And for most of the ways to detect which of those are present in the
device that is booting, you need half a kernel to power up the various
hardware and do some basic communication to figure out what's there. Of
course you could say that's U-Boot's job for example but not sure you
want to add a CCI (I2C), ADC driver and much more...

Regards
Luca

> That said, this is just my guesstimates and perhaps the IIO folks could c=
omment
> on that
>
> Konrad

