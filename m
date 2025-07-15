Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17C12D4B5B
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 09:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752570319; cv=none; b=PCjAfynRJGWdTle0Lpg+l8RhneskrDS1eZHe70ugETxMYzhJdOhboMZ3P8RZKoRI7CprXTe8EYzmLxzfyZSpo9ak44bl7S6gQHcxWQqGjvBcC+f62yH+r3jvUKdgYuLpj55CMdNj+RAPWTo3XVxgxk8PnMmOXOOtDY6WD6pJG0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752570319; c=relaxed/simple;
	bh=5LBGdyccFs9/kSMj7gqptZEBRHBs0pXT46lCaRpnEU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrwrU5QI6zbzOfTDxQtBAN0qdYnhugR/oWazhxm+YRoLKOc+YNkKqxdivGRTSIJiXFOUu+IUTrdig9DMKro2inJNo6K7WFZy2fnki9EJIOMoQoaYIz2YcpDh/nUHLoMxcIF+ZsS6fGrV5hOvtMbxVc8Obyxwx4sVwc3TMbouD1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHFOz9AI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHFOz9AI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F7ULP7022596
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 09:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X81G8SbDQbSTnHA7Tq+qXCtSDHk+zyIFbzLI6vGMtbM=; b=oHFOz9AIM1QxzQ33
	ewK8BgVpjT41RVa6X5zFWaAwDO/Rjs/49yTkz4ZQNeGfIiYy19HRhgepfbXMGSjb
	NdRwV614x4I6+6FFV9v/8IfioYfJpWknS9PCpZwpgEylpHvCjBhigXd1ztrFdD4T
	KCEjKseMYNzvFjQl+aTv814m+5gmfTy2Ew0ZlsuQlk9QeaX7k+Phu/pUxub24vTk
	RYhGWXdtjt/IOirpLCjmU9JX6O/QLwJsQWkbODs6MgaK2m/D+xBimXvcfdjYlvuQ
	VAwbmaqHMafDZ9GS2jCSCrbH9okOP7lu8A4vRDRt6tLI5s4ARglxlLXw0HhV/wLk
	wRwtKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxaykhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 09:05:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab7406bfa1so4584211cf.3
        for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 02:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570316; x=1753175116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X81G8SbDQbSTnHA7Tq+qXCtSDHk+zyIFbzLI6vGMtbM=;
        b=Hk/9M1I3b2HmPhRLvfENylMX2XhfpoEatbCuuaWt/GRBCMmyl1jXKKjtMBm/dQMn0I
         nz8cp3XNYZjXDgiGLAbkg/nxyGhpQy1UlksE2KNmzQxKptwnRTN4jY12YLhDfKXO69kG
         9tXAbC8kRLVzUBqas/shSd9QwGA3ZewA5IkM0c1Zkjjp+VuZ96w7TpRmUg+meIRqq1mS
         SCcpRT3/63YNMoBkRizLf+eew6OkumOqDMVsngFKDvxnGyeZfNnWWJltUKiCw1NWrm4j
         MP2vAiksnO6ioNzc4cIg9W/c4+0aK+e/tXsOhDhJXeY51nopZ1K9mQ6YMWLyGjw1kQdV
         Zayw==
X-Forwarded-Encrypted: i=1; AJvYcCV7aOGQT+dUNxTofJE45bB6aQu00LClkgJoiTZA3PfBx6HKP32M1ud5YFWRtQgxbM+Ah5KEcyxVHd1UZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuWkwFD+yMmAJftvwey/eDZF31/CsjhJPp7n8v8U3a92IDBV3B
	3bFW1SuE0Trnz8HM+aOoPH50iiyTSp2xrOzvKWYz9X5fNMA5PoRbBmQ6mdDpTXVxe1YQEoYuTMH
	DA4W/a0jYKBv2CjhOSdg5oR+Eci7vOrqwqSWQi4RSKFr0/xe95JGoQzQIM0Oi2HPd8g==
X-Gm-Gg: ASbGnctdoKO0ofUsC2TieO2Gy6ewBA7LUUGsWGUF9+425m6l0PZ3WGwTurpGOgBBpwl
	Cj9rs9jj0GwlXp9G/pDsejlhYOizOfZjzzMs+rDfsUzd88d5yJljbc84yl/emTc+L8C3wgn+0db
	HR4sfj4cNR5TuJgtdalw/6HCfPMPJ/cOBBk7tBx4WKCrMJo53LIZ0KwJFY887sGJOjcw8j+4NEB
	76sdC7XwM2l9Vhc6fY4XwreW9ANA4VtTDzEU8vV+vGZYzWq0eEl1N2H3UEgFtJfTzdAcJnfJLNf
	y6gRM1yArp6lE6nmXxNwQwr/jS4PxBUydxmbdswXT3pio+KX3mzTPihhC0of1cUb6TCbt4P5Zoj
	LQfpeq4LZK2LveWdhnhID
X-Received: by 2002:a05:622a:1104:b0:4ab:5c58:bb25 with SMTP id d75a77b69052e-4ab86ddc86cmr4932651cf.1.1752570315552;
        Tue, 15 Jul 2025 02:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRYFCf9iDFpvwNaUhwvFmnJFfLgW9Y1m4vlzwNzKWO0OxKFu/BJa6T2F1S9r+efZbKvvtpAg==
X-Received: by 2002:a05:622a:1104:b0:4ab:5c58:bb25 with SMTP id d75a77b69052e-4ab86ddc86cmr4932471cf.1.1752570315140;
        Tue, 15 Jul 2025 02:05:15 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612067f7ca6sm4743760a12.55.2025.07.15.02.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:05:14 -0700 (PDT)
Message-ID: <03242c48-beb9-4ec1-8659-0cb8db9ef37d@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 11:05:12 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715-sm7635-clocks-v3-0-18f9faac4984@fairphone.com>
 <20250715-sm7635-clocks-v3-1-18f9faac4984@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250715-sm7635-clocks-v3-1-18f9faac4984@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m6YEtarxkD6O0-XNT12bDxe1eGfIA01s
X-Proofpoint-ORIG-GUID: m6YEtarxkD6O0-XNT12bDxe1eGfIA01s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA4MiBTYWx0ZWRfX1HokPVlPWOq2
 k85DGAyl5NekgTX5RWOwonrt8BHdsCHTL1hplS7cNbuP7Kribk4Y1S7JjajeAJVzqPCgu6YvCUW
 itQjqNbGG8bdEQSXYEWQni35D3F4F9y0pUFP0m1oOgPs07bENLdj+GA2pStp5T+AQZAkaeW5YGu
 agTttizG10eCtYYEIAlsjbI0ltDlb6kOWcojERKBeEbwfO9X/0+VnXwmbMDlaBA28mlnrr0Mzlu
 LlsL87TPeXWiF+JwWqCVPjm7+uqeQ5pO8IhaF+Lse34GXBmYNuejuzfGBsg9vUb2dDT8RFGgOdb
 zj0jpwYvliLJBeTgxHCUTBnl2GJOzd/5uqFmU2qBaOk4MhXYLoCYMxMhRSDP+0K1h4bPBEClH/m
 ufhi27X+jcd4W6wK8ruDjQKUx8YkvVVjlbP9MabXThWej5vU5Nn051eBK45bmV2V88NzY2YM
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687619cc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=fWT5Z53OPIsgueDaOEIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150082

On 7/15/25 9:19 AM, Luca Weiss wrote:
> Add support to register the rcg dfs in qcom_cc_really_probe(). This
> allows users to move the call from the probe function to static
> properties.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/common.c | 10 ++++++++++
>  drivers/clk/qcom/common.h |  2 ++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index b3838d885db25f183979576e5c685c07dc6a7049..37c3008e6c1be1f083d0093d2659e31dd7978497 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -390,6 +390,16 @@ int qcom_cc_really_probe(struct device *dev,
>  			goto put_rpm;
>  	}
>  
> +	if (desc->driver_data &&
> +	    desc->driver_data->dfs_rcgs &&
> +	    desc->driver_data->num_dfs_rcgs) {

I suppose the last check isn't strictly necessary but it makes
sense to the reader so I'm not asking for a resend because of
that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> +		ret = qcom_cc_register_rcg_dfs(regmap,
> +					       desc->driver_data->dfs_rcgs,
> +					       desc->driver_data->num_dfs_rcgs);
> +		if (ret)
> +			goto put_rpm;
> +	}
> +
>  	cc->rclks = rclks;
>  	cc->num_rclks = num_clks;
>  
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 0f4b2d40c65cf94de694226f63ca30f4181d0ce5..953c91f7b14502546d8ade0dccc4790fcbb53ddb 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -30,6 +30,8 @@ struct qcom_cc_driver_data {
>  	size_t num_alpha_plls;
>  	u32 *clk_cbcrs;
>  	size_t num_clk_cbcrs;
> +	const struct clk_rcg_dfs_data *dfs_rcgs;
> +	size_t num_dfs_rcgs;
>  	void (*clk_regs_configure)(struct device *dev, struct regmap *regmap);
>  };
>  
> 
