Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D122332E
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770992647; cv=none; b=AqdjKwQmKW5ld/ojPbdH2a7Do+MNIhjeZw86Ex/bKXAPjSx7u39AL/3kEQWTbSmD1ycBBRzmH4J0cCZhqhQzIPQszdLDETbORuGcBTSXOOw5QiMn6j0DYuDXiS/5Zfe3sKYUEPFsPl+daQ5a/a8j8AWrpIN6Tzz93x/wLKFKi24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770992647; c=relaxed/simple;
	bh=Ay0D6GdAPXygldsOGoBiVkahDJKNp328gQFQGPJ+sIk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bdKq5IJW6SGI3NPWzijuPBsb2P/7KHnEJcnMOmEqUYG2bVCde5z+PGv/FTBId2ID2OGBEHDURyFUYkgVR9A97EPp+u+AlvxoFgli1FYVXQKv3+Kr/HOmTQ/OweMAT4uoEzdyCYGQ3VlvY6E40hkiRlyQ69vL0/lg4+f0jHUjZ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xftAIikl; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xftAIikl"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b885a18f620so128552466b.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 06:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770992645; x=1771597445; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCFtFmCjsibDMDkl0GJojw688jZoMr8VtFLUcg2+jq0=;
        b=xftAIiklNZuYwEWU0UTU3mMdZIrTjE4TbK0BPVpFAkIGgxNBlFSygBdquMhOz00BcL
         VWjf9Jwe+bjnVZPCPRTXLtEbKnhT13yT/oDxVHz8tfzKuF74IGmt6N/am2w4oWVHs77V
         3tuj8VObvPWIRdxFrmHnQ6/TMALkOjXMueusHqGH1H+iKzj+xPamRv7TiVs/2vHhVx/i
         qFtKUKmNaI/BuzJWLzslrGv3e4xalerF1m1oxVVLuETqC8DGPcGU6Eg7VTD0s2sW0sYQ
         blgBk5ReFAQdv5pw6Hh3PajMzx4C9xyFn/DXJyD5YNoZwsK2EuMMq4UyJyOf70otoXfh
         83QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770992645; x=1771597445;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCFtFmCjsibDMDkl0GJojw688jZoMr8VtFLUcg2+jq0=;
        b=r8a96AAJl0ChbCRaYFFxJ9BfSSkVaNiKn0qu0DOfuS10s1lY2MTqhp9G30KvcWdjcI
         3+pEM+q1vgsT5xPmSGSHbHMvPaV0eN6hqc1nVbI2zHNR/WBuc0YU8rlYp3r2zX9VkKJd
         +AoaBMzxaHm+FQ3V0jMSIcHAcd39GYj5PWyomC25IR9tDbelH6d0AqAdslfiPGb66VEl
         s2lgy0RpZYnJTKNIKLhunML73+KToEYVufSt5k3b8p4SvKUP4Wha7Pa/fMbvViR93+Rw
         zgrSUJVFCS1ugnUYFXfQhGZ2b/syJL5MUihsRnPa1YiFkZSW0T1sT3b85mlfqko4yBK6
         8BZA==
X-Forwarded-Encrypted: i=1; AJvYcCXXU9fh1/DTOORQJRbmgm3iUz8i1HccNnEBcMmKf9DnYRRh+W+E+5TUIxZDtOb1rur9yxvZ02aLKXd2+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/bG3l7IGdwqJL0u+Jf7L9PwdEPhsRSE6PaAsj4IO5DrvGis2/
	pizvBkB7u/ZtuAZ2/OKFCMsQfhn1PxD+JLmp7MpJ8cJXmr0BIwollqniKY26SCkg3i4=
X-Gm-Gg: AZuq6aLgcepG16jdDIJgi+mHGKlyva2x4FTzrwW7LdCiisISdqk7cGSYM//16pZyNFk
	5hNJDfYatM6ILnPgYJE3kX3OogM3hr3HBc7cKx37i1HdTkz+JDKWLd1aIRRTj9YkV/+xj+lCfEq
	10UpN3upkw+1XX+pqzvQfEpjc3mnfTjBMvgXzyYVA9R8giOuryxm3e8Q4hmUWjanxQw+1KjECW+
	FrGUW8X/UG7aS2s0YVGGhAFmN3vRlgHTD+oQwAuc+1vnPd4HbGjX9RLnDajV+7rU/aNkGuxC0JX
	BBngnROYvo5cAMe/FNXXCIoGruDlgXeNkTr5DTVU3f2M3/uJzVIto5yYtOmU+RJLFmDar7fVc8U
	DE431cWRCZ0+B6ZJDYiNi5bO1Sq6hhr3SCOfPh4P4G5bOZdE9pOxjW4P0ePqqf4v2jY+YNcCi/M
	5h4mepOcpgOyu2t644QBzA0Wz+4oXxu/w06CsPsjuE3APONS5KVihsSR5HtUKvTaWiqsFm
X-Received: by 2002:a17:907:1c83:b0:b88:21cd:5fcc with SMTP id a640c23a62f3a-b8face2b48cmr150515366b.36.1770992644795;
        Fri, 13 Feb 2026 06:24:04 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ebd60edsm256019766b.41.2026.02.13.06.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 06:24:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 15:24:04 +0100
Message-Id: <DGDWHX20052Z.C8JH4RXIPJCK@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alexander Koskovich" <AKoskovich@pm.me>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-5-27b4fbb77e9c@fairphone.com>
 <300f3ceb-546b-4670-a0ae-4a6f451a7f4e@oss.qualcomm.com>
In-Reply-To: <300f3ceb-546b-4670-a0ae-4a6f451a7f4e@oss.qualcomm.com>

On Wed Jan 21, 2026 at 12:50 PM CET, Konrad Dybcio wrote:
> On 1/16/26 3:50 PM, Luca Weiss wrote:
>> Configure and enable the WiFi node, and add the required pinctrl to
>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>=20
>> Thanks to Alexander Koskovich for helping with the bringup, adding
>> the missing pinctrl to make the WPSS stop crashing.
>>=20
>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fa=
irphone.com/
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 +++++++++++++++++=
+-
>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm=
64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index cbe1507b0aaa..75f2b3a3e572 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -232,7 +232,7 @@ wcn6750-pmu {
>> =20
>>  		clocks =3D <&rpmhcc RPMH_RF_CLK1>;
>> =20
>> -		pinctrl-0 =3D <&bluetooth_enable_default>;
>> +		pinctrl-0 =3D <&bluetooth_enable_default>, <&pmk8550_sleep_clk_defaul=
t>;
>>  		pinctrl-names =3D "default";
>> =20
>>  		regulators {
>> @@ -704,6 +704,17 @@ &pmiv0104_eusb2_repeater {
>>  	qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
>>  };
>> =20
>> +&pmk8550_gpios {
>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>> +		pins =3D "gpio5";
>
> I'm thinking how to best reflect that. Perhaps gpio-gate-clock which
> would be consumed by the PMU?

This way of doing it already has a precedent with sm8550-hdk.dts and
sm8550-qrd.dts at least.

Regards
Luca

>
> FWIW PMK8550 can reportedly output this clock from GPIO3 and GPIO5
> (not sure if at once) if set to FUNC1
>
> Konrad

