Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41C7332EA7
	for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 15:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764257300; cv=none; b=tqVACakmzIqdpUiSZHB3mN9mYRN0ac24xpbEf1ZqUTp5D/0cBFZsV5p2hY4rDx8cT2ZoX/uIrGV07BdSwTIcvMW0cz7IE6VYi6fZJilA1AlfJeyhovi7lN+2u4D8FbX4le+NrfB1dIj/kyi4Nhyd/4nMBI+9/+nkmNhncnF7m1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764257300; c=relaxed/simple;
	bh=Z4GHwBbqqBLmBjW3cseRdkpTdHaLbZeRIAfeUz1ASfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t9Yi6YTypInthTTR9CjHz6Fb21IVX8Dq5BL0KvuuE6lQzPJjCY1OXfcOCuzMxwG+p5LB7VaA9XYbq1H0w1k2huprmQ/CfV1IKWvFf1G7ruoOwhzjk1rdZG+uub0zIsanFwvppCLKzRNJDJAKKLvGbpe4eE/Cb+Q+NgQE+qgRc48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHOX/0Pq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EzT5nIFf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHOX/0Pq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EzT5nIFf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARBVkKk722932
	for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 15:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndxdMdbzvZF/I4cZm8HOJZvbZdGMtw1Vn3ORVS+oD8Q=; b=iHOX/0Pqd+GA/PNO
	h2o5AeFEFuQcYL+DssWotOyw8zguwdaUEkJ87AqdDEI3vdBipRYHJJasP3LTvaAc
	0KM4FttnxD+Y2oq5jEtYDFrEZS/R3FD2xdwTbqdSRKXQicRMVPGKRE7i7NjQXv5a
	muUsvE0SvM1x76nLSKDWRvUL9bVIOC0s8QVO7np5UDvj6c6JmkVtQ1SVI7mSB7BG
	vA/B775gUhUCJG6Os9p8lvnJUZa8yTfoEZytIUtMjHqg8kZ41+ViD5FBDj6e3Jok
	A5M2pz18qYZYGOVtpnkjTmBoAI1RUhdQ8eHzWA5Vw6QziMRRQydxlnBNjInMLFQF
	KoJBpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apnud8hnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 15:28:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaa289e0dso4032991cf.3
        for <phone-devel@vger.kernel.org>; Thu, 27 Nov 2025 07:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764257297; x=1764862097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndxdMdbzvZF/I4cZm8HOJZvbZdGMtw1Vn3ORVS+oD8Q=;
        b=EzT5nIFfxQq4LuqcOy9+hB+P/cc0w4sClVrZBF+5y3/K9gfi286zcn1Qu6/whLdpwZ
         T+DViKwvXo6YngOR5XKW2ssH9xVNaKdhXSIoHI5pU2CPWP4bhwC22gMT5dz0UTu8OzCp
         9j/x2+H9xEMo8E8NPJPEVS07hZkrzxTZ1I5r1Pt6rnerb5uU5b2onmTbjRJIYOi9Jd4J
         hYXHbTXGHnICN9LbcDgQ0PoxKueP9u5OtOkZQqInkJhU1hswBSebEtn5h8ZcNjm2250E
         OyjWWxDx5KmmvOY7Jl6KQ3lQwfGRljzeGKqMcgFr2fA+3d9LEsOLLWrdEMalp6KJ6w6n
         ZV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764257297; x=1764862097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndxdMdbzvZF/I4cZm8HOJZvbZdGMtw1Vn3ORVS+oD8Q=;
        b=vXnMlXzYQoXvTxmMk8Yv37qJAxPGCQN8Gm/LXoWLUaS1qbJ80U8YVOSInEogICtCdx
         xLiZX8YZXMTs153vClDjfZPRJMeKizh3v5t2sEsRq0b0iERO0atpqvY7imnFfeXoci9a
         nkwP0PVTgYnIAHk0FOS4jDS2zbXxUlYUD8mCeWE+mhaRFzjnoJVkyMD44dmWU/DK3aTv
         B7Mr0jiZADOQPSFM6/y2qDA4MKqzfhpurbtip05K7LcQKsXA+TAzgZ54LdgnP8Lw8Cuv
         sY1cZr82UrciCg5zq2k4E2amyeXV2FuYF1heFguXM0uYVE36d+XwlrHWU4hcUYHf8/sx
         I3rg==
X-Forwarded-Encrypted: i=1; AJvYcCXnoWKCttb0dBrH/qHDtm4ZcY8sglBKbUEfMua9h3uyjs7iLBAy04PjKj7cc1+iyc2ZA8eSXCXEnY5x7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKdR/Z3po7afEIK2Z+9oXTTR83vmE7wRmFoad96dct+p1wOzKq
	b3sBM78X5C1bH+MAXRVlppM0J7Y0DI6a31WY9/MmZQ3GbfqwI1Cp+pkbbS2R3Sv08ku5ERbqenf
	rYlllyn83QcotEHkyJ5s74Rr+OzzuEMf6u6Q6QwNotSvKmR57cS3k0hQk7AbHqE/MVw==
X-Gm-Gg: ASbGncsvASaWlYCUiawVaETyfsq5U+EyTg1Jcja4oREC/A+wEFCKT2LipFtm5IJhGF4
	nw7geHrry7T0LdhoSn51jANpNUY3mEtLmUyTS5PF0EluO5dJp/F9+Sj3iTdxDLkqnHMxbOw7TqJ
	3Y3R7XezK2y3xBwg4AgsTgjudavDt+7kPlcEqMtTg/g1en8LoSUQp4zU72fE/Wr/LIJ+rTa0vCZ
	wfrz7QfLfS6wU7lrJ2CTeo95qVTgUWNzt9P3lCc/6o1vAxAtYSo15lwGO9IqtkomBquefGxVy0J
	TlPiyRgQ/7glQPWNsVaZtpPpkaHVWcbgw8DQetqm5T6CcjePFZ7srIzfPlVuWrTgxogb6sDvaOo
	y6chDBiUIfkP7KbFKoBQLETWw4qVqRLcsUv6p+Y7AxPUIQHJPFJAIRd8/11hWQn/lAow=
X-Received: by 2002:a05:622a:206:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee58780ccemr236846801cf.0.1764257296976;
        Thu, 27 Nov 2025 07:28:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHix/8idFxBj5zD5bC/rE9LqDNBbvzU8nEEOyiI7hOsESnJb73ZJwmHLH1WFWYZ6SQ9IHWdKQ==
X-Received: by 2002:a05:622a:206:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee58780ccemr236846331cf.0.1764257296373;
        Thu, 27 Nov 2025 07:28:16 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm176945366b.37.2025.11.27.07.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 07:28:15 -0800 (PST)
Message-ID: <5d6c3dda-71cd-4684-8546-bc4918b560de@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 16:28:12 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/8] power: supply: Add driver for Qualcomm PMI8998
 fuel gauge
To: david@ixit.cz, Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-2-dd3791f61478@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251124-pmi8998_fuel_gauge-v1-2-dd3791f61478@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Uf2cLtXP2dbHERNz8iZXZsm5ukPyav21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDExNSBTYWx0ZWRfX+KWQB5b8Jp8e
 SMApqjeE7dTM4JK8jO77nWK5wY0pInTVwJI/pCJdwR3bDvrgPEMJteL0ZIsz4OwsCE9afg44PIP
 zPxi9xvubebDZmkbJ2Ps4Q6ffgClQ8l1ggEZ96M5qXxnk7XEOi7Xx2/c9OtyqqW8zw7cuFaNhz8
 ghyFe4/uImfZZ8004EJDjJ6ovHxdyDz1+bGuMvTio8ffbduR758/Nis14M3jN2z8UfrWe4JnhVl
 aFudKQi1t5mI2ooNp2tZR8/TyclmLj/4j1OpyyeC0nH7QfJAEY5SD5a16OB2JvTli8qXsIkNHqD
 4FaA53iKI9Dd6AA2F7O8q0r55FJwyPVabDmMYoeRw0Kl0uWY8vAdC1QPvtvPaskcHYRLW4Dikg7
 BzF69NQFDNHthdC6+n+CIX2IjLqJnQ==
X-Proofpoint-ORIG-GUID: Uf2cLtXP2dbHERNz8iZXZsm5ukPyav21
X-Authority-Analysis: v=2.4 cv=MKNtWcZl c=1 sm=1 tr=0 ts=69286e11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=WFa1dZBpAAAA:8 a=OuZLqq7tAAAA:8 a=sfOm8-O8AAAA:8
 a=V67mNnR7AAxaKjwIKscA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=MZguhEFr_PtxzKXayD1K:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270115

On 11/24/25 10:53 PM, David Heidelberg via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> Ths driver supports the fuel gauge hardware available on PMICs known as
> 3rd generation fuel gauge hardware available on PMI8998.
> 
> Co-developed-by: Casey Connolly <casey@connolly.tech>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Co-developed-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +/**
> + * @brief pmi8998_fg_read() - Read multiple registers with regmap_bulk_read

I think this won't pass kerneldoc checks (make W=1)

[...]

> +static int pmi8998_fg_write(struct pmi8998_fg_chip *chip, u8 *val, u16 addr, int len)
> +{
> +	bool sec_access = (addr & 0xff) > 0xd0;

Downstream checks if the address is > 0xBA which is what you want
at least for pmi8998

You can de-abbreviate this to 'secure_access' (not to be confused
with 'secondary' or so). There's a locking mechanism which needs a
0xa5 byte written to the base+0xd0 register (applies to all FG
peripherals with the 'last non-secure register' value possibly
varying).

[...]

> +	u8 sec_addr_val = 0xa5;
> +	int ret;
> +
> +	if (((chip->base + addr) & 0xff00) == 0)

The 'fuel gauge' consists of:

FG_BATT_SOC @ 0x4000 (state of charge monitor)
FG_BATT_INFO @ 0x4100 ("general fg minus SoC")
FG_BCL @ 0x4200 (battery current limiter)
FG_LMH @ 0x4300 (limits management hardware)
FG_MEM_IF @ 0x4400 (DMA engine)
RRADC @ 0x4500 (today handled by its own driver)

and a couple other peripherals that Linux doesn't need to worry about

Each one of them should have its own 'reg' entry (which is assumed
to be 0x100-long), which will let you skip such interesting checks
and rely on the regmap framework disallowing address spillover (or
you can just then make the addr argument a u8)

It would be good to keep in mind their relationship and think about how
to model them together. I don't think they must all necessarily be part
of a single big "fg" dt node, particularly the LMH/BCL part seems to be
rather self-contained

[...]

> +		return -EINVAL;
> +
> +	dev_vdbg(chip->dev, "%s: Writing 0x%x to 0x%x", __func__, *val, addr);
> +
> +	if (sec_access) {
> +		ret = regmap_bulk_write(chip->regmap,
> +					((chip->base + addr) & 0xff00) | 0xd0,
> +				&sec_addr_val, 1);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return regmap_bulk_write(chip->regmap, chip->base + addr, val, len);
> +}
> +
> +/**
> + * @brief pmi8998_fg_masked_write() - like pmi8998_fg_write but applies
> + * a mask first.
> + *
> + * @param chip Pointer to chip
> + * @param val Pointer to write values from
> + * @param addr Address to write to
> + * @param len Number of registers (bytes) to write
> + * @return int 0 on success, negative errno on error
> + */
> +static int pmi8998_fg_masked_write(struct pmi8998_fg_chip *chip, u16 addr, u8 mask, u8 val)
> +{
> +	u8 reg;
> +	int ret;
> +
> +	ret = pmi8998_fg_read(chip, &reg, addr, 1);
> +	if (ret)
> +		return ret;
> +
> +	reg &= ~mask;
> +	reg |= val & mask;
> +
> +	return pmi8998_fg_write(chip, &reg, addr, 1);
> +}
> +
> +/*
> + * Battery status
> + */
> +
> +/**
> + * @brief pmi8998_fg_get_capacity() - Get remaining capacity of battery
> + *
> + * @param chip Pointer to chip
> + * @param val Pointer to store value at
> + * @return int 0 on success, negative errno on error
> + */
> +static int pmi8998_fg_get_capacity(struct pmi8998_fg_chip *chip, int *val)
> +{
> +	u8 cap[2];
> +	int ret;
> +
> +	ret = pmi8998_fg_read(chip, cap, BATT_MONOTONIC_SOC, 2);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to read capacity: %d", ret);
> +		return ret;
> +	}

Downstream tries for 5 times to get this (raw) pair of values and fails if
they don't match - 0x400a is a shadow register of 0x4009 and this is very
much intended

> +	if (cap[0] != cap[1])
> +		cap[0] = cap[0] < cap[1] ? cap[0] : cap[1];
> +
> +	*val = DIV_ROUND_CLOSEST((cap[0] - 1) * 98, 0xff - 2) + 1;

98 comes from "FULL_CAPACITY (100) - 2", 0xff denotes "FULL_SOC_RAW", i.e. the
raw value of this register that corresponds to 100% (again not sure where the
minus2 comes from - perhaps some rounding fixups)

> +
> +	return 0;
> +}
> +
> +/**
> + * @brief pmi8998_fg_get_temperature() - Get temperature of battery
> + *
> + * @param chip Pointer to chip
> + * @param val Pointer to store value at
> + * @return int 0 on success, negative errno on error
> + */
> +static int pmi8998_fg_get_temperature(struct pmi8998_fg_chip *chip, int *val)
> +{
> +	int ret, temp;
> +	u8 readval[2];
> +
> +	ret = pmi8998_fg_read(chip, readval, PARAM_ADDR_BATT_TEMP, 2);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to read temperature: %d\n", ret);
> +		return ret;
> +	}
> +
> +	temp = ((readval[1] & BATT_TEMP_MSB_MASK) << 8) |
> +		(readval[0] & BATT_TEMP_LSB_MASK);
> +	temp = DIV_ROUND_CLOSEST(temp * 10, 4);
> +
> +	*val = temp - 2730;
> +
> +	return 0;
> +}
> +
> +/**
> + * @brief pmi8998_fg_get_current() - Get current being drawn from battery
> + *
> + * @param chip Pointer to chip
> + * @param val Pointer to store value at
> + * @return int 0 on success, negative errno on error
> + */
> +static int pmi8998_fg_get_current(struct pmi8998_fg_chip *chip, int *val)
> +{
> +	s16 temp;
> +	u8 readval[2];
> +	int ret;
> +
> +	ret = pmi8998_fg_read(chip, readval, PARAM_ADDR_BATT_CURRENT, 2);
> +	if (ret) {
> +		dev_err(chip->dev, "Failed to read current: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* handle rev 1 too */

PMI8998v1 has flipped the order of the registers and I would guesstimate
that it wouldn't actually be present in the wild

> +	temp = (s16)(readval[1] << 8 | readval[0]);
> +	*val = div_s64((s64)temp * 488281, 1000);

This is a funny way to say that this is a 2s complement-encoded
16b value, where 5 bits are reserved for the integer portion

[...]

> +		power_supply_changed(chip->batt_psy);
> +
> +		if (chip->status == POWER_SUPPLY_STATUS_UNKNOWN) {
> +			/*
> +			 * REVISIT: Find better solution or remove current-based
> +			 * status checking once checking is properly implemented
> +			 * in charger drivers
> +
> +			 * Sometimes it take a while for current to stabilize,
> +			 * so signal property change again later to make sure
> +			 * current-based status is properly detected.
> +			 */

On downstream, it's the charger counterpart that signals PSY_STATUS_(DIS)CHARGING

Konrad
