Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4976334F24E
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603967; cv=none; b=M+v5BBVMFPWLTcz4A2HpoIs+DQTYAvhRYuPXdtH40pyy1VEGuHQ8fa2YcVTKCAi3PeL5mpnBJDzk8crcfNAXxlszOeLtlu16Kcw3pBMgt5sArr5cvoJDztVmTGgVkg/xsCDkrIqluhqAkmhmDVxhOMJvBOjwK2ix9OdpCBfJZjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603967; c=relaxed/simple;
	bh=rnSFYiKpipLYfYsB7I4jYi2KJwlBXa6QxCsWGp3+S5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awuBwDcAe76CXMbsU7tEQIZuq7Fx4Rdg8CucV1yV9/erYDSJGbAgUN1aXGDjGgpRtng7GZ99kY/cyIi+EOQEm99cyj5KxrUhWCgi72r7wBlLxjqpkWeqHUoNGqbJeuN6G/0L5vFkB7aZwLey5I5ogjj9lP87/omDtu068pt93nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5n28WXB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TaCdu7OK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5n28WXB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TaCdu7OK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S91vJX3879271
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 12:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuk0aNNm3PN/IEIs187jYGxFLJiqS4HGWXcW5xEcOl0=; b=V5n28WXBnCDbknJT
	GZh9mo6ev1aaCAVBfNhLRqHRJW7DpYWx0Uwqj4hN3uEu7OjjaH/WYtYoxc2B2fI9
	XCTIlejLqkHPHaKUj1gxW5+v/O2eo5ld8f1avzA8tNSrjC4O282nYG5n8t4wbhtN
	b4bSpKquj8bUQCD/rPR6wTZelPbHiIhHY6QzplBT+2mRKSVjL3zJ28OgIqFmZ8YJ
	EzM60LgzV3H/BQH+ZynWsHSB/ap04IjDiQjnGQF/VUyj8VvjE8d5FYaCJpZtHPtO
	83AUfVp3cvAVJclZ7+MSO2hlD6uDv0yQtbHbb9KT1+BssJS0a3Xy6LVMny21eYj0
	CKnJvw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bybyv1f74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 12:39:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a26989018so15451146d6.0
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 04:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769603964; x=1770208764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zuk0aNNm3PN/IEIs187jYGxFLJiqS4HGWXcW5xEcOl0=;
        b=TaCdu7OKdmdbARyXkAit0j1LwYDMNeeJ8/7KdQvjswf9HH7qt5O7iFsIMN5VJK0ChJ
         /jpt4aO1ZjGR17a1hoCsPFGTMWyCh2CVZkSqV8iIseny+Bva6zok3x/+MDq8iQImXEQG
         coLeXSpgq/7TR9YgBianj7WvHastHkRsgvKEv3eGSOD6UHjSjSiM5Ta+rcxCHsXXrSrE
         t0PAXAldDYfFsNhNPOIO4ss1XDRawod/9neVgEntziNjUxnuRSRkbZhdleBqW3oX51Pr
         QwUuV1jP3Pr70C0QKzdoa/F7uJSChgmbdMIolVo78Vsht1M0FDQm4lae1Q3De338yRHO
         ZbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603964; x=1770208764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuk0aNNm3PN/IEIs187jYGxFLJiqS4HGWXcW5xEcOl0=;
        b=cFF9432hMguM7FPZD/NePF8RfGMCe0z2HmDLvO43rRNLmYt8Ggny56lnKJHIbh9VeP
         MRJS0BKnA3SCokSbuAY8ypoa6C3DVvHM/Oc1bxvf0TZUiDWBOKNyUFsXUAEjysKLYsld
         kCIIl1qyT6khWbcLjDCWCwN9dVGuIJCg6LrJKbVnvfueivhxXwOz84el6LpUJ8hOa0id
         HdHRlkF2mwoI9QyT9hDM9vzUaPy+ONSPgLApQAKmOrtCWXx67ISflcm/5gUavYTc3931
         71uHmON2mdSfwHRnrWfwtJRvB6tyD1y8gg6xKgcuGLO5uzBAxVERXcz3rBYpZbLQxHbM
         VX9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvfPkhTe1nvbm7I04RcmGBmo9WrMbz3kOmK8/2EVsF54UXu+H7qw4oNttGYCdeWaLB5q3yDBscIN0z+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Ac2ljAL9WZvUeu8lOCQ8/hcfGd+gJbiDuNXy1V99SOchMk9V
	BloE6f+sNTopQVypWUZ2fFW9KtbFU6gto9WB/0DZb21+yIMrp/v8hSyYPOgranMl+Jic0h//1hH
	dsJ6xlh8ZWPrukbxMu0BSsc7b6xizgwY4pW/46THzwYSqy/kLlc/hddQkYfH8XoHkEQ==
X-Gm-Gg: AZuq6aKAsJ9VALWtlR4DW/O3thXmAjodO0d4mX0ts6bUBDL2jgLYgwqmUEW0KVQ52XP
	baNBdlBlr3Co01VZde4KQ6JFohUc0NQ/oJLJD9Gn3Im340+XdK/SKAbs2r7iMxAVyGB9JxNSvto
	3bj6urL0JAl3LLdqQdA1LmZ/rHvFjuSHqMKXACIfUw1N/Lm4hdJziHUJaj/aSLZRRI83fonPpfW
	+hHRdLCD3IZZCLxXNQMBcYsFRv6fhLwawBWwOssGCkaBI+xs3O/KAvizKmzAXc7LzAi8pRYYPZB
	vI5LbBGCBDSKi7YoqqUvvUZK+Ll7FvGioCETsue5eGFaninEdPh0ceEnrj66mGq1XSN7HH1p/Tn
	TBPvY8LDoRo2smYg0pz+gBBYY4O7C2tW4UvULXJk52Sr0D++TQdMK2Xf8Gl25NeoYQP4=
X-Received: by 2002:a05:6214:5e03:b0:894:979a:bf7d with SMTP id 6a1803df08f44-894dccc1b03mr1054836d6.6.1769603964581;
        Wed, 28 Jan 2026 04:39:24 -0800 (PST)
X-Received: by 2002:a05:6214:5e03:b0:894:979a:bf7d with SMTP id 6a1803df08f44-894dccc1b03mr1054486d6.6.1769603964029;
        Wed, 28 Jan 2026 04:39:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4452e98sm1498904a12.12.2026.01.28.04.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:39:23 -0800 (PST)
Message-ID: <5fcbfcef-5fb4-4d95-b75a-1c425d1c4183@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:39:21 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add SM6350 LPASS LPI TLMM
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-3-36583f2a2a2a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-3-36583f2a2a2a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VDh1lM0Msl67RCEhBQXEQpuB1mhwdF37
X-Authority-Analysis: v=2.4 cv=ZZ4Q98VA c=1 sm=1 tr=0 ts=697a037d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=FKLYIeIi5cSbgHY3oWEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwNCBTYWx0ZWRfX5ElyZKyxKxqD
 kpJ9BIMipNXK+G9GMj/1e7z5TH7dwu2kAtwjfyti3BBHNwnFpTRaJOVOTOsDVmzDMu42ItGO0Vd
 8UTKEtcoELX8F/Ga1Q9ULwlgh0dv3mavSuCA+o8hs1wpBCGR8uLejpFgrDsg8uhWEpCGYHmpiBh
 QrFsAxJf426cksmmOSbZrrAztof62Dki7kX3jEA2l69ybQGZdRiRyVwaM0/kAQrGyWiD9yGoRd4
 8XIkQXd7BYqmJSWmMnqmFA//JHSjrfGyDFsXza9P/uUpQL25CIKqmxAuHAu7x9ah1kN8ceMURYP
 f/KF3hvNSh66gmLXjqbJ2/+DNZ6AyNmVxIWqXCP3MI+bJ5QaMzRERf160YvmpNNPNGlEflXGvSr
 IhQMbakNldG/XhxRl9Ci10Dvt3vUJFn8On2KGlgOqnO2epTtRXUeEEt+ChU6QcHFW9mpVcvkH3D
 6E7yi0kBuf5UiYA1O0A==
X-Proofpoint-ORIG-GUID: VDh1lM0Msl67RCEhBQXEQpuB1mhwdF37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280104

On 1/28/26 1:26 PM, Luca Weiss wrote:
> Add support for the pin controller block on SM6350 Low Power Island.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +static const struct lpi_pingroup sm6350_groups[] = {
> +	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
> +	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
> +	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
> +	LPI_PINGROUP(5, 12, swr_rx_data, _, qua_mi2s_data, _),
> +	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
> +	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
> +	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
> +	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
> +	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
> +	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
> +	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
> +	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
> +	LPI_PINGROUP_SLEW_SPARE_1(14, 0, swr_tx_data, _, _, _),

Modulo this odd cookie, it's identical to 8250.. but then it messes with
all the definitions, so it makes sense to keep it separate

I verified all the functions and slew offsets


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
