Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816137;
	b=3tvfTI+cHQLNDSwPRRDxBhCN+tICEtU/f0K3YB7f9xHOCN9y6eNom4CxTHmq9VTHDo5h
	 Uw5Ap7RSY9Cokj+SgTEpX2aRdXyMjo893eoj6HZf0v8WQhcZBW6W9TcTuIaox8L6eGTrC
	 Qg9ty7y6pEC0kYFbEkfdSnetyVn9SGRw5d29kYU4AlE4Ru5BNNlytG7jRAqawFWEvWUbs
	 8WfsE6+KhYwttTdLxRGk6M4BUC0A4P0RMISeMPkOCl4tLVqKYrd8/84BDEAOzPr5e4Vyp
	 TH42FwPXm9DuvE4U0rjpCXAWwZAWRqA3NkvkOhkYcXfc1QDvHBDZDVYzU+OYypy00tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=ZyK7/PztODOd9Q5CVGcTP8UYa9FIHfRTvvxAFMt+8YU=;
	b=AfFHPLqj4RCGtgo1yttk6JfhozjSTTbFZrz36XH+2YbDnfq6Y2DasDjiIYRIr3zJ0veW
	 XY6U71BvCTLZQHRRgsP2FvwcNaxBUSIqlAfilNcXsCh3abXowiBKmSHzB1GRq6HZGFtqR
	 oND/7zg5VtG8+H1XD78u8cXIz/n3xoBBW/bfM2sLawBjbB7xgTRgvxI8cMFlCBuTWOXAX
	 ENPV17/jb3abcjXaDbX3C3ByNvlHVcH7GwIS1B76RLGoAQGCPBShE8BF/sMljG7adbGdE
	 bYNsKg043S6XsshmmrA/mN0vg5soYtT7gvg4xpXKhskMmvvbfOdwaUJSME1Pep3CwBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=NIsF+uDH;
	arc=none smtp.remote-ip=74.125.228.74
Received: from mail-ed2-f10.google.com (mail-ed2-f10.google.com [74.125.228.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F363606A338
	for <phone-devel@vger.kernel.org>; Mon, 16 Nov 2026 08:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F363606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=NIsF+uDH
Received: by mail-ed2-f10.google.com with SMTP id 4fb4d7f45d1cf-6b7e67f651cso946879a12.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Nov 2026 00:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794816134; x=1795420934; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZyK7/PztODOd9Q5CVGcTP8UYa9FIHfRTvvxAFMt+8YU=;
        b=NIsF+uDHDmPTfADfQhpj6r1fyuJAuD1caSpBsd+mCKdzTNO4k/YUXY4WwfhsgEu1CP
         7GmcJQANvfcXjV0osFh7yKq6fnyzvIMfxrU3LkWziN/vtLkRibFPJAdKNxdgp6+pPJtK
         SbUotDugzsnA+IB2Tr4Ee1SoJ1lwvCRPyLRwUrFpibxL32XemZV3OfgpCfmKkh4233/d
         cKm0WW+N6zBMekAvmPv1hUhUMvoStHcLLFoJZrWpmFuRSWHxdHzTAv+kxrYu/narMqUS
         9XL3V7v2gZ/kN8v83ZGg7sCpBpXn6XCLx28HXnfAkBonAXIaZqmAc8AFxLHUPYP2taJB
         MmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816134; x=1795420934;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZyK7/PztODOd9Q5CVGcTP8UYa9FIHfRTvvxAFMt+8YU=;
        b=14bzNCbBNkjbPOeuKOUjj10uZ7BGS7sf9vfyZtFTXw2lLIvu6+sSi0tmVP992Jrrvr
         wjuU5Ixtq86Nf6mqzl+gsDbw6MWN97rcXUNLVB8fs/AAKm1qaYLLMvOGPDsLdkxViqpU
         aTq4ySGLLVT7b0JVPmLFH15RDu1Rh91xSmSWc6YNTCVjSnmjBvzukV50l6LrvORjj6Av
         aSDyPkG2zEW3+T7Vpf+dXVMYJRluEBKZyv4270H0fiUoStwHx/fGZyK4EQQ1vkUEF2Bg
         1KjatmDbccWzlmqsQ39CPLjddYdn/GjZdQwn+qjGZDtRpSx7+iR8RgwhIxn6LKvVE9QC
         V/Tg==
X-Forwarded-Encrypted: i=1; AL+hErFkr+l5B++WO3E+oizXrrKoPJpWje1uUgT8K5ppOKSOfrtBewmU1m6nghyCywAsJ0oTmurqHeQ1zhfnGg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8INjBZx3/epxISKMJdrYYoi4qMvFy0sY7Eaj0TrLIMtW3R+eLJ
	q42ORRsgW+7aqqxaokIHYgfVhxhqV6tFv38YcCZTmCKqvwb4oc4UoAK1xWTR48Ig0mU=
X-Gm-Gg: AYBFou273QTJ+xLqXtNEA2nNj/XpIqyVQNCXhO9g+SlBL0d+A+JndygQqc/sAYDCWQM
	CUxiBmAyf1wq9wu5OxQulRXfyNMwxnSJ7u7/UB22kCzwcaQ44lL43Whkf7Xrz/EHeMU2Wun+N2/
	LZMEDQO5J6Ps8vvAx//ayWfaZMAYWFxE0qJUdts4owRHyizCCokZQBZumHgmOT6a6WSWdZJuO4Y
	ewL4QAZmOCyU9v4Yt6u2lBXfKI3kiOzX/ksza/H2uJPLFzBv0JmWPfuPPxVlyJX3nU+IjeGUj/I
	+GpyjKp89DLjHHgRrBkwylkXmStz8GzeJFX4tgbKYuHRVsZRLb5dakqb53fdPxjrTxcjmAbgDjc
	BzUNjUl1TuVpe3M2yA+szrEDPUL/9sKdt6w7kH44EJU1uhEaMb8Uezqhw+kd48T0plE3BKh4RZW
	GF/aJYJSyNUYgAf1qZdH479LHaNiwAZggbHpGseEblT5vlDVlhez+vUhiFqWlyswSudCTNYiEHE
	zIKNXKZ2Ytu56BfiNeYT7fCkulDUIv2KZdE3ak9iU0ZLfFfhOztNv43W+l2TgvHlwanDjaZvw6b
	EAieY4cEwMpzFZWG5fCblCCdvca5Rh869PLvcdE+n5NYGz46rlOS6hZTlxLHaBbu8QpXd8QYaw=
	=
X-Received: by 2002:a05:6402:11cd:b0:6b6:fa19:41c1 with SMTP id 4fb4d7f45d1cf-6b7c09580e6mr6535428a12.8.1794816132167;
        Mon, 16 Nov 2026 00:02:12 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm4159399a12.36.2026.11.16.00.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 00:02:11 -0800 (PST)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 09:02:10 +0100
Message-Id: <DMWH7VNNWDQG.1BM1P88WUJZT9@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "David Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz
 Luba" <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Laxman Dewangan" <ldewangan@nvidia.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Hans de
 Goede" <hansg@kernel.org>, "Jens Reidel" <adrian@mainlining.org>, "Casey
 Connolly" <casey.connolly@linaro.org>, "Val Packett" <val@packett.cool>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] thermal/drivers/generic-adc: Allow probe without
 TZ registration
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
 <20261113-bat-temp-adc-v3-3-743979a8fd90@fairphone.com>
 <20261114001552.3ae8f05e@jic23-hlaptop>
In-Reply-To: <20261114001552.3ae8f05e@jic23-hlaptop>

Hi Jonathan,

On Sat Nov 14, 2026 at 1:15 AM CET, Jonathan Cameron wrote:
> On Fri, 13 Nov 2026 16:56:44 +0100
> Luca Weiss <luca.weiss@fairphone.com> wrote:
>
>> If the devicetree node is not referenced in a zone under /thermal-zones,
>> devm_thermal_of_zone_register() will fail with -ENODEV.
>>=20
>> Since the driver is now also registering as an IIO device[0], allow the
>> probe to continue without the thermal zone.
>
> Papering over problems, or expected path for some devices?  If it's
> expected path we probably don't want to print a message with the
> word failed in it.

Expected path for some devices. Should I make this into dev_dbg then or
remove the print completely?

>
>>=20
>> We also can't use gadc_thermal_get_temp() anymore because we haven't
>> necessarily initialized tz_dev.
>>=20
>> Link: https://git.kernel.org/torvalds/c/3762f5851ac5 [0]
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/thermal/thermal-generic-adc.c | 20 +++++++++++---------
>>  1 file changed, 11 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/the=
rmal-generic-adc.c
>> index c6a7a65aa6a6..40a34e97a515 100644
>> --- a/drivers/thermal/thermal-generic-adc.c
>> +++ b/drivers/thermal/thermal-generic-adc.c
>> @@ -86,14 +86,16 @@ static int gadc_thermal_read_raw(struct iio_dev *ind=
io_dev,
>>  				 int *val, int *val2, long mask)
>>  {
>>  	struct gadc_thermal_info *gtinfo =3D iio_priv(indio_dev);
>> +	int iio_val;
>>  	int ret;
>> =20
>>  	switch (mask) {
>>  	case IIO_CHAN_INFO_PROCESSED:
>> -		ret =3D gadc_thermal_get_temp(gtinfo->tz_dev, val);
>> -		if (ret)
>> +		ret =3D iio_read_channel_processed(gtinfo->channel, &iio_val);
>> +		if (ret < 0)
>>  			return ret;
>> =20
>> +		*val =3D gadc_thermal_adc_to_temp(gtinfo, iio_val);
>
> Maybe spin a helper that is used both in adc_thermal_get_get_temp()
> and here?  Whilst it won't save much code (may actually be a touch longer=
)
> it will put the two relevant steps in one place.

Sure, can do that.

Regards
Luca

>>  		return IIO_VAL_INT;
>> =20
>>  	default:
>> @@ -195,14 +197,14 @@ static int gadc_thermal_probe(struct platform_devi=
ce *pdev)
>>  						    &gadc_thermal_ops);
>>  	if (IS_ERR(gti->tz_dev)) {
>>  		ret =3D PTR_ERR(gti->tz_dev);
>> -		if (ret !=3D -EPROBE_DEFER)
>> -			dev_err(dev,
>> -				"Thermal zone sensor register failed: %d\n",
>> -				ret);
>> -		return ret;
>> -	}
>> +		if (ret !=3D -ENODEV)
>> +			return ret;
>> =20
>> -	devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
>> +		dev_info(dev, "Thermal zone sensor register failed: %d\n",
>> +			 ret);
>> +	} else {
>> +		devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
>> +	}
>> =20
>>  	return gadc_iio_register(&pdev->dev, gti);
>>  }
>>=20


