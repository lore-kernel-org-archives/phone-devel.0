Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CA34E431A
	for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741300; cv=none; b=eutR4GdK8VDKGcsgiFMzFeJaZz1aYlMzc2Omzmz/XDskJtZ4J6qawmESassW5dxxvPqXBjBfBrq3LPknwUAVzCtKzbEOlWOXEyCkeP6skWf3VFyXGaXifDcs59j9doawyaPh3ijch1P+Ht+0byLHV7zY38PTaBaARdzJu94HPSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741300; c=relaxed/simple;
	bh=Zs0q3BB6FPEKrnEd2QcTPKWAEsGsAYzDdsgAWxcpX18=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=f0QirD72WJWdUR+Hc6fRLrj5Ocx+2P7t/WOdngI2s6OhGYBrZycJrv120ne7eNExvlH94qxTLHv4BRwD1Da/9HVZq468B7+5ssqJqfnhR0KQ3/ClShxeSBzBB/Oo4VR5OMUCaAW6pPHC4Vn3sb/zmdMMFID3K2xdV86S/O3jQRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DTneyczo; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DTneyczo"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so103774766b.3
        for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 07:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789741296; x=1790346096; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2t5ETH0BVW3gDZ+cs/uAotP/lQAVJkBPSTT8r5GG204=;
        b=DTneyczoiM0wkdqGRDTwFWnc2vvUAJyd/2a2kKLGjmHRKxVTxX/emog/QBcXFPFhc8
         tJ92+aiJzKBzHcOOSZ5iGG5m4DcDGK+t4ei7Wck2FWza//vDda2COTM3VjQ6jBfph8YI
         cZWgETrMmYSTohD/b0QdP1M+3aLJzdcvjzGo5jzIJ1beEHY8SqgIokcXKuUQ7YMqr9oz
         KmCa67L9TcpAo5dDOt5eJw7GaZNfMeLA109NHwVL4wb0YaQnRogMJLaY9M5Fg7UMQvc5
         VV1zj2e18iZH0CJDEYijSuFcOXvVkgyOhY4cC2PJpDxxvDAvu/0BCKXP9Vw/zBjHzjsl
         vg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741296; x=1790346096;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2t5ETH0BVW3gDZ+cs/uAotP/lQAVJkBPSTT8r5GG204=;
        b=YLswIGxAu3cvz5XEZAQNu5/2EdCTKBe9COVAqaLWCvH0RLtqmMkE3OXokZt9r3XNVG
         eDoNoX880CySwGQ34Q32QeAzjNf4R6ejUvi4kyJm4NCTlLTbqAiK2u1B+IRnYpRkqvD0
         I5QuERzSaUeW+7hcyeon7Hr+NAEOcfoowyPytzXCjoCRxALuWAOSNAvj/fY/SACQwAXE
         HbjjUQbJDlWyVjYCkc6WcCfQ7vXwZU3WoYwQJWjQ6/l+FWzIMfMvfTCe2lmOYp+wkRsW
         sh2z4w2p/WdyFj8r3cmMo93E3+kSxR52RQ6Hxrxkzu/ZwwSbk8cgaUr02lb77NaH3EI7
         3BbA==
X-Forwarded-Encrypted: i=1; AKwUvByYNN7R/A4NkD9aCSfpoRZqDa/ILN8ZA5ieuqVhewr27icZvUzUJidBSNNxpuDMKqpE6tXpKYuoGF+CeA==@vger.kernel.org
X-Gm-Message-State: AFuF++lCnve6GOXWCVY2KvnH4mMKzY5lhiqyvAnDKiFNH4rQb9XHYpiC
	H/ifMx0exHoYZiteNiHppbUatojpKr3u1R0aQfvFC7O/uUpSCJODSagAC3SWty9OMq8=
X-Gm-Gg: AYBFou1rnEsd7/pMic7btv8Cf8kzp95caH25eM3g1EZs6cNsI0t2ylgkyWVPkxEmw/m
	bU3c2vmXvXLPm7Lg6UnHIDAjt95Rv5bfekyXVtOzQ9zlYlotTur6gF7whCLWq7D6QmK1Z/Hbw2c
	uoVGFZpQpZQgyx5m/A0P640PK2GDOLG+FocBD0KHOGU5tlDrJkftIRh6jFmR3swXLHZgQ8sJnW1
	DshggNWqtjY48Mxal66bvLJcXfGlEBzzmtTngKwI8SKbVt0AsK96spHQLMmIGPwD+0s6p7OdPcw
	muExX2dFhjMtfWLgr+6GG+1P3tK4dGXSDpgaLygwlDcTm1t4wBYV9xak9EZb4z5pOGaUCLUsmbo
	7IRxnyhTPy1TuBKF4OF/RVxZySfiPB+0+TczEk4zy7SQwKEA7jA7Rmy9rhVsQHylvmsbxf51dQ9
	9R+vGXnhK8sqZPrw9G/yj05+urMYLHh2AROkk+3lbbnh5q2e/WMGmQQziz/2fU+BWVShRsNRbes
	THm+R9PEVQnllfHbuaAJ0Lr1WQM8PkUHgwEcQJpvAU=
X-Received: by 2002:a17:907:e0d2:10b0:c26:3107:71dd with SMTP id a640c23a62f3a-c2a2538ac4fmr66810866b.13.1789741295804;
        Fri, 18 Sep 2026 07:21:35 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b424826sm61186066b.0.2026.09.18.07.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 16:21:34 +0200
Message-Id: <DLIIC89MM6AK.L02JKTJKQSXZ@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: Add missing regulators in
 PM6350
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
 <ef06178c-5c16-4cb4-8ef8-3a7e1ccbf260@oss.qualcomm.com>
In-Reply-To: <ef06178c-5c16-4cb4-8ef8-3a7e1ccbf260@oss.qualcomm.com>

Hi Konrad,

On Wed Sep 2, 2026 at 10:51 AM CEST, Konrad Dybcio wrote:
> On 9/1/26 10:58 AM, Luca Weiss wrote:
>> Add the missing smps3-6 and ldo17 definitions. While smps3/5 and ldo17
>> are not used from the rpmh regulator driver on SM6350, the regulators do
>> exist, so add them with the types based on the datasheet.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/regulator/qcom-rpmh-regulator.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator=
/qcom-rpmh-regulator.c
>> index dd2265961151..7d20f3e47760 100644
>> --- a/drivers/regulator/qcom-rpmh-regulator.c
>> +++ b/drivers/regulator/qcom-rpmh-regulator.c
>> @@ -1591,7 +1591,10 @@ static const struct rpmh_vreg_init_data pm6150l_v=
reg_data[] =3D {
>>  static const struct rpmh_vreg_init_data pm6350_vreg_data[] =3D {
>>  	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
>>  	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
>> -	/* smps3 - smps5 not configured */
>> +	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps510, "vdd-s3"),
>> +	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps510, "vdd-s4"),
>> +	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps510, "vdd-s5"),
>> +	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_hfsmps510, "vdd-s6"),
>>  	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1"),
>>  	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l5-l7"),
>>  	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10")=
,
>> @@ -1608,7 +1611,7 @@ static const struct rpmh_vreg_init_data pm6350_vre=
g_data[] =3D {
>>  	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      "vdd-l12-l14"),
>>  	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      "vdd-l15-l19-l22"),
>>  	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      "vdd-l16"),
>> -	/* ldo17 not configured */
>> +	RPMH_VREG("ldo17",  LDO,  17, &pmic5_nldo,      "vdd-l17"),
>
> L17 (and other NLDOs on this PMIC) can do 0.312 - 1.304 V, whereas
> the pmic5_nldo config allows a range of 0.32 - 1.296 V. But I suppose
> that is something to fix separately anyway

Can you help with what numbers from the data sheet we're supposed to
use?

In 80-PR887-1 Rev. G, Table 3-20 would suggest L17 is programmable from
0.312V to 1.328V while "output voltage range" is 0.32V-1.304V.

But Table 3-11 does indeed show 0.312V - 1.304V as "Programming range"
for this specific LDO.

So the voltages from the Table 3-11 are the ones to use? The other ones
can be ignored completely? But e.g. the step size is only listed in
3-20.

Sidenote, are the step sizes for the SMPS listed anywhere?

Regards
Luca

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad


