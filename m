Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594B7358D16
	for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 15:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768837948; cv=none; b=ie7CTWf/lP5mINlyhZw1HToL8Zd4fYgiLpLusmMcmdPFlcMcvCxLpllNWItsd/gH5vhb6Lh3AZrnWRTsACtftZsXKgHXdZbTi9exhQgIaqUvJp2F5a91/qkCR6XYUKAHB0g1rXQ9s5BqKSlfpEEKfOK2IyKhPgVK6ng46QqpW/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768837948; c=relaxed/simple;
	bh=hmFWkaNjPJg0ioPLpbxNfZVs6zemNfl3UQ9lpEvUopw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=tu53WNVbCSkg+zBCJ/C6uuhvLFyfzdD01pg0L3IcKHqmn5eW0ola6Mhmhmsj4ayPjW0QvhUUt2LDCkdz45I03ReIhPC0GT2It/iB/PXUDP9T/SBfki9ntkhwaFsES22bhqlGVnIrYa93+5k/D/f0O5ACazer2aDJvr7jtP6BWs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=sDA2oJMU; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="sDA2oJMU"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so778473066b.2
        for <phone-devel@vger.kernel.org>; Mon, 19 Jan 2026 07:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768837945; x=1769442745; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydzLNmqrNw79cznaWxcj/vU4qCKsfInZqdkzuOLukEY=;
        b=sDA2oJMUN0WLSPzOzyP+whoU+Mfyqsz4btnURPSZZszzL79YJPr4lNqtAkhuOJXziZ
         iHbq40ya5d6jt2cTKgmU1xrRvwbJmIgvWL/01iT5A35P1AL6nJaA6xgxk73Q4v6nwP/w
         poGBTBfFFYf7x3DKlQUe0XFF8FQEADES5r3dypoX2FPoiGVD7f+x1m5cHbLUtOwLS1vX
         c0zBIELGJDlESedyPaOqi9mLP9psfWEt4QA+4SQbv4AxKyDwzBbs3vo1wkzayb4OsMKK
         fXm+0X5g2fMKROOZUKteRUeDgg5VNAz9iKes7Ak9pz8SNLU7f7k62HdethtIA0Oh76uF
         6xLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768837945; x=1769442745;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydzLNmqrNw79cznaWxcj/vU4qCKsfInZqdkzuOLukEY=;
        b=FSkraFfGZ/Smia3Z8XFXwcPGJ7wG0SeCuXOeC0A5Aah8C7se/DDg3TABZfPK4oSDdI
         9VvMZyY0NoXzcoJ8cCYHNtLyv/6SAbkz3AboBsBgwBRtv1Y8ZyDy0Yg7mcfTOiVpdzGj
         iAe+hEt90OhLfgyYr9IkDgtjP/+pLGcraWcH7VRgdOjAhJGY1r2u3nj+lDtp1z25W/Rl
         By0yaQbKsC4DPwjuaRDF10o7EgBBI+HbBMIY/8EyejLZ9KOnFai/gUfKEPhLL7sL4J5g
         MeiD/WX4BXM6ZBC21CSUsx79TNVpCMnrnD5ldBq898wmP5udfTFDSaLLZmwg/495DhQv
         T0kw==
X-Forwarded-Encrypted: i=1; AJvYcCUHC4UgutoXW2v0lxArg8EI38LHXDvb2knRrUBHV2DZefA6B+xagnfmDkIlLpjVg2tz9miqrOFVjVDpqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+xlzJXNqazdicm/csLse65bvpGL+dagnH5ah+y67PKbUoq9ZD
	yfloqIN8P+M/vg7LUBKt5F6N32lwex6QbhbvTf6tQMWiNKuq8vcYfXGFMjK3NFuF2lk=
X-Gm-Gg: AY/fxX6NBg2j+inhpchLokHvpQNlMk0NBxkPT/GXroh1wfPmVCwJCn+YT8jfMF0wdoc
	NAZ+VEDBy2/f4Bx2KrekvW3k66IMz/8eI64zA53GTTXxL4/LvdzdrwcRBlCABV//OE6F0G9mi18
	QDsn0R0WW3Mp3Whvy13JaxxL+WdYgTd/EAj+KAwUpzFtAMH+1JSm8zZQkhofeMMEmdiHOLKAio9
	g8oCdo8jej3bS0Za6cUTH6ZfoueKPZywa+UYgz9h006jBm2k2w7/cdNtZ6EtUtuofEyL3ieNGBJ
	K7jV9nc458AnMYRK02u0SGusbOra/9R7uImNmvhEmlj+ctR8TVJigaFCcyoFhVDTpYFYRAWfeQt
	w6LI3lnvq8depYtToGsAyujeEoeVdVz1uBMbT6KSahMfLm0cFtQhHtdR0Bwobs0uYFqGG/wWFbm
	e67/oqvt73AcordTlg5rp7D/Zh0F0PI+pyg9o5zXmgrL4G0GqrdGeiK1eY1CTHJqObyk8=
X-Received: by 2002:a17:906:ef05:b0:b87:1064:4ea1 with SMTP id a640c23a62f3a-b879302d388mr921496066b.65.1768837944673;
        Mon, 19 Jan 2026 07:52:24 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9fbbsm1159645266b.38.2026.01.19.07.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 07:52:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 16:52:23 +0100
Message-Id: <DFSOPXFSOUY2.2Z6XCLCD796Q@fairphone.com>
Subject: Re: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect
 sensor
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-fp6-hall-sensor-v1-1-69275c6bd809@fairphone.com>
 <3a17f2e5-0724-4d70-bd22-1e612142b3e8@oss.qualcomm.com>
In-Reply-To: <3a17f2e5-0724-4d70-bd22-1e612142b3e8@oss.qualcomm.com>

On Mon Jan 19, 2026 at 3:41 PM CET, Konrad Dybcio wrote:
> On 1/16/26 3:22 PM, Luca Weiss wrote:
>> Add a node for the Hall Effect sensor, used to detect whether the Flip
>> Cover is closed or not.
>>=20
>> The sensor is powered through vreg_l10b, so let's put a
>> regulator-always-on on that to make sure the sensor gets power.
>
> Is there anything else on L10B? Can we turn it off if the hall sensor
> is e.g. user-disabled?

It's the voltage source for pull-up of sensor I2C bus (so
ADSP-managed?), DVDD for amplifiers and VDD for a most sensors like
the gyro.

So realistically, it'll probably be (nearly) always on anyways. And I
don't want to shave another yak by adding vdd support to gpio-keys...

Regards
Luca

>
> Konrad
>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm=
64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index 7629ceddde2a..98b3fc654206 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -32,6 +32,16 @@ gpio-keys {
>>  		pinctrl-0 =3D <&volume_up_default>;
>>  		pinctrl-names =3D "default";
>> =20
>> +		/* Powered by the always-on vreg_l10b */
>> +		event-hall-sensor {
>> +			label =3D "Hall Effect Sensor";
>> +			gpios =3D <&tlmm 70 GPIO_ACTIVE_LOW>;
>> +			linux,input-type =3D <EV_SW>;
>> +			linux,code =3D <SW_LID>;
>> +			linux,can-disable;
>> +			wakeup-source;
>> +		};
>> +
>>  		key-volume-up {
>>  			label =3D "Volume Up";
>>  			gpios =3D <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
>> @@ -316,6 +326,8 @@ vreg_l10b: ldo10 {
>>  			regulator-min-microvolt =3D <1800000>;
>>  			regulator-max-microvolt =3D <1800000>;
>>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>> +			/* Hall sensor VDD */
>> +			regulator-always-on;
>>  		};
>> =20
>>  		vreg_l11b: ldo11 {
>>=20
>> ---
>> base-commit: ef1c7b875741bef0ff37ae8ab8a9aaf407dc141c
>> change-id: 20260116-fp6-hall-sensor-1049f2f872ac
>>=20
>> Best regards,

