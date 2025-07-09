Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7643A2C2AA5
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061732; cv=none; b=i9oHAKnczM+XlhjZ/RyE12L/Zx1m8MfbHuFtFDj71buRppBlRcmxBABu8QIa73THjlVWphwJGgw5NX5avz3ucPlIYXk1/qZZpDrcqVV+w2S49pLifrd7snkKuhbrX2SrCL+GHakvyuhAqqvYcWPO9Vrk3f9bdr1KJ3k/lfYTyWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061732; c=relaxed/simple;
	bh=LuFaLCJ0xTPoiWwHiRW6DMu6C4be3/3wdgnHwU5aw20=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Z/J3WnkG+zx+WRoxg8sQ75B4ax0i82OZJ1v75mwLc1lBKUJg/ajFWjU5RcJxTMTVCrlfFsPtrz5AqrEgOuynGgvLkwTEg8eAPnUcoHfdob9U5tUnajBFZuonSFuhdT2j8vf6Ss755k1qBToFRcjMSwb5BcVTc/74zOwKvgwDiTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=N6Qx6lO2; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="N6Qx6lO2"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae223591067so909756466b.3
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061729; x=1752666529; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7251uwJfwlSq32A9Vp2rgzafVtiNna6bej3YLziW0U=;
        b=N6Qx6lO2URXqxTheYpr0pbnhSDFAlFwTG/3+A0UDlh+TWi08qhFU7NLS4kHfJ5RkLc
         fqRyFyyn0x4JezJj6FOUIThCMs/mSSa7+IVNYFO/dejS4h+iFB2f2euXiN/jJpJ77mDJ
         n79c+jZGUU/mH7KnKAt/sJ/XW/eY6e616pUK+Y4m1F1gtljFQ5wsFy8r/JSUe8uaWx9l
         apeqCUr1j11/vrv543D2c5eUWITRibL2488RJCAlN7r23isPhIPVIYdUL1nT4sDtmqAE
         sne5ox5AjQzs9q3iDVt6MwYHfzlloI9WirB08iqZ5SMWr7qTg+hFeNWd3YcppJ8vH7Jn
         FhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061729; x=1752666529;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R7251uwJfwlSq32A9Vp2rgzafVtiNna6bej3YLziW0U=;
        b=Ng9mcPXRG/H/HTLAnqj25lHyIqC49W6Ar/R5pn8F0C/NVc9F+4HjU0GIPxAjKKlv1I
         kFvi3+zDeziFSqaUe3d1kQxl1skYwveqfmkNsuSdat+bKlC3q2iUmaPaheJ6OGN+ye3A
         f6ePdsMA2fy6ii6MLQRktRcqI0y59OL1U4mUIYk5AT85qxpN9poieOBF+ljkdcQOzPRQ
         k7U5sfxG/L68F21syT5IIxEej00htQDsw0LEUJrrR/sVy17mWkCsgupnu9Xd/v3ulUTJ
         YYIciX0P7ov9Z30Kr1WKYdfk6BiVRzRilrpHOYSp1grec4uDAQWDHtpbpXynCEQuNN5b
         N75Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVto6h4CFdxpFTP1NE0v6Nf1fAdPKZnKOsg/kNCj23PVQWRaeww1l/78f/rs9syQtT582R7naqas12/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyn3sg+s19hfT0kFvfShdZJkIqyt1TuHp3Krg6R/z0RbZlzGjp
	O0oklmerD8ID+4njnV4hTfSm3569rLT1MNLTafA7PKW5V644BpWRenELD5o1Pn9P8No=
X-Gm-Gg: ASbGncts7e9TvCJKk+v0DHnSE50Tec+adz25Rw9PPXnaPpcEg3fXgPUPL1tnp/g2Fh2
	ueNkeDirROevqOe2gyUxS3sKeyy8w9hYEFG9FgQeAbF8pgdSdSix/fLyvOJ6nEm+BOHA0Monj82
	MflAwv2WKKzfV69G4ioDTFdNxIKaTLi38wHsqZbfWDOzUWh758xamV8yR1Ur4+/3UlHljiyRTH5
	yj1mdW/KXVBO0wkJLBj5/1zNcl7il3I+QKC1b/mdZDbUKCkEDtPn3L8KCQ5Cwmc9qCjo5Xm1a20
	NsndkwLC94JQkSL0YWA+TY7tkaeRP7UQ8j/0xoBj7hh3dkyp7/xvkKiJliLkV4iNYGQwM3QgXU4
	vvZ558JIqB8QzC6rvBl6GbNLlH5G6/oc=
X-Google-Smtp-Source: AGHT+IFHTk7KUMsYqkCmoCKYDOQn2JjjlDGYad8nB1UbcgqlsPnK+ZRxIkDwhxTp1MQMCfkMx5xzIg==
X-Received: by 2002:a17:907:f816:b0:ae0:a88e:6f20 with SMTP id a640c23a62f3a-ae6cf5b81dcmr253307366b.15.1752061728625;
        Wed, 09 Jul 2025 04:48:48 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5feasm1091150266b.107.2025.07.09.04.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 04:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 13:48:48 +0200
Message-Id: <DB7I1Q9TD02L.2A18QMRU7VXHD@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Taniya Das"
 <quic_tdas@quicinc.com>, "Ajit Pandey" <quic_ajipan@quicinc.com>, "Imran
 Shaik" <quic_imrashai@quicinc.com>
Subject: Re: [PATCH v2 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jagadeesh Kona" <quic_jkona@quicinc.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
 <64e27035-d124-470a-bc5b-66d254b6ff4f@quicinc.com>
In-Reply-To: <64e27035-d124-470a-bc5b-66d254b6ff4f@quicinc.com>

Hi Jagadeesh,

On Tue Jul 8, 2025 at 7:34 AM CEST, Jagadeesh Kona wrote:
>
>
> On 7/4/2025 12:46 PM, Luca Weiss wrote:
>> Add support to register the rcg dfs in qcom_cc_really_probe(). This
>> allows users to move the call from the probe function to static
>> properties.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/clk/qcom/common.c | 8 ++++++++
>>  drivers/clk/qcom/common.h | 2 ++
>>  2 files changed, 10 insertions(+)
>>=20
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index b3838d885db25f183979576e5c685c07dc6a7049..d53f290c6121f31d06cf244f=
72603b694966e216 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -390,6 +390,14 @@ int qcom_cc_really_probe(struct device *dev,
>>  			goto put_rpm;
>>  	}
>> =20
>> +	if (desc->dfs_rcgs && desc->num_dfs_rcgs) {
>> +		ret =3D qcom_cc_register_rcg_dfs(regmap,
>> +					       desc->dfs_rcgs,
>> +					       desc->num_dfs_rcgs);
>> +		if (ret)
>> +			goto put_rpm;
>> +	}
>> +
>>  	cc->rclks =3D rclks;
>>  	cc->num_rclks =3D num_clks;
>> =20
>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>> index 0f4b2d40c65cf94de694226f63ca30f4181d0ce5..dbe7ebe5b8710fb03c1671ac=
9022e608a6aad35f 100644
>> --- a/drivers/clk/qcom/common.h
>> +++ b/drivers/clk/qcom/common.h
>> @@ -43,6 +43,8 @@ struct qcom_cc_desc {
>>  	size_t num_gdscs;
>>  	struct clk_hw **clk_hws;
>>  	size_t num_clk_hws;
>> +	const struct clk_rcg_dfs_data *dfs_rcgs;
>> +	size_t num_dfs_rcgs;
>
> Since all other probe configurations are added in qcom_cc_driver_data str=
uct, it is better to
> add rcg dfs data also to qcom_cc_driver_data struct instead of qcom_cc_de=
sc.

Dmitry suggested to use struct qcom_cc_desc:
https://lore.kernel.org/linux-arm-msm/w4eujq72uqflqpsqshc7zhu6lkc7owufep2g2=
rjacvzgj44vmf@auonp4ugbgow/

I personally don't have a preference.

Regards
Luca

>
> Thanks,
> Jagadeesh
>
>>  	const struct qcom_icc_hws_data *icc_hws;
>>  	size_t num_icc_hws;
>>  	unsigned int icc_first_node_id;
>>=20

