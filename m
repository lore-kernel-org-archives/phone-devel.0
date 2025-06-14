Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE301F03C9
	for <phone-devel@vger.kernel.org>; Sat, 14 Jun 2025 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749928960; cv=none; b=npBUvgO3Bb9Pq1wMbJ7l9FbFUJC6VoPGgRiK5DcVm1HoUlXPcFomlAK5mzg9aqZdlJJRvBjupSxzQ2JoZFcSmm8Zz9bwHo/VsD1jHVlpqM3izUTVp1R4psq9dUPK0+ufGA2ZjL7RONCTINYd24fdwBH6DNb25HFIb+DFhL2riLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749928960; c=relaxed/simple;
	bh=74UE4OS2luQ7P5Vh+iRkt6MZQysIWQsh4S5igVUh824=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoqaxteOmMewzeJxST411DZSMrPdxgCC7IfXsRybwJU3f/ohEpEK9abmMEgs23d1/hQn5oLNo+8xCNE7oJDSNUtPNFtTWecRuleCcn+hhWqsOga5368vSBZIEVLZjs//gGbIx7ThsL5KjwNXlHPo10sjts4UI+g7gqFBqr6i1Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvJABi6A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvJABi6A"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55E6lOJN013089
	for <phone-devel@vger.kernel.org>; Sat, 14 Jun 2025 19:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7Xsy5pYt6HIDgczfhpBwwGtZlz4QBUYqyEAh/V/oek=; b=gvJABi6AWOfq9TO9
	HN0qC+g3ATQw3K0c6ePVTgeeHKabuWrmrJ758kyvZ2JquVhLIsqBLGUHXRDo/jIk
	qVWRKSI45vFuEbqQI7PZjifHGo2pTtNDprGhDbg8XCmXTq0t/Z8XeXtbnyDf7s1d
	ncl3ElxS2PoGfdtcj7h5tnDc2rO5mnKwZ+kCZzoMH0Jx0BnWhyaXNhnhg+k79vtA
	DvdeIeCu+jGmGhGN3/mvcGmKr2U0pXfsqMxYxxAxxNaUbenNnewYsPwyrQKFs7JL
	7dsbsOWcdGM5bPEFagSpxsSVyoku5TmipyzoODzbF+HrxFPS05IuSYOGJyyW6mFn
	IiZLfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hc8xxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 14 Jun 2025 19:22:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso99470485a.2
        for <phone-devel@vger.kernel.org>; Sat, 14 Jun 2025 12:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749928956; x=1750533756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7Xsy5pYt6HIDgczfhpBwwGtZlz4QBUYqyEAh/V/oek=;
        b=pP4DeotwvkOm4csHIa+59+YK5hoIM/WJ1RStIwawlUiQNXCqDsMLY3F5jwDvZdv6bI
         pRXe837SeJmbnVNdNQQA//m2IobXQ6hvMm1oBKiVEQpms85Dz5XBV9O2UqkSEA/FbT/h
         AHbyIQEdvIWW9Z5tvPBpMG7TVpW+lm3VZfD6Trptyy+Q2q/RAUHlKyrikgObprOMeXA6
         jxOk4qP7iZH/NuIgDIxdxI0td1ZpxGGdg4Ab1xzaRITI+stPeVNIqHFJZg0UxHeM0Xy0
         sBknDJJFrb8pPDylOWQAzv/je5MUcY1vB90xp6A8byEOu5mPp8PzDmxUzpjtHrJpn3jK
         KTfw==
X-Forwarded-Encrypted: i=1; AJvYcCXoIqr/mIjellEk5GZT7hzSZJrzh6zkYZ3eLWCb4N/KbCwCE4PPGbAFCAtvBFXOsrk46PtnTTVdRI/2IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCfzeqrGsNXMt6puWE8IIbm9HdCHRAQ3kb3pyFH52QcHSYhwAk
	g/fxJTEzfTLC9ZEWEegmt8mWtor9/6Yg3Ig7Y16G6DR/QLAjZlGKt2TNr9RXEIHGeXkOseFdHG3
	J8QOn6fMZxoGAjMYHFHQk8EZ2H/TLXyhpzpLa+GGRKeTE+hftTpa1WvGvKpNuT3nkWQ==
X-Gm-Gg: ASbGnctevpT3dx0/YkfWvrMlvUbv3rPyeUcsjSbNpGZ3SWJn3c0LHG/qyf+dtQ6hqbK
	gxw3mt86smUXET+1nQfkwkywv8i1Zo8pvViMy22r87AGgI0aGfwcRZB+duYAh3QUfAVj24Cwm1r
	dfs546vz177WNWp5JK2eg1jSZlosputJ1THRiC+ef0N8bWWR95AgtOy+8WvwG8+wU78MUbFubX3
	nV3tbPprK51A0FUvkQEYXnbCeGj/xVgPyl3WGqgrj/bfa69dOCkd++uOuxQB38uRB59M7obA2Xw
	BIlmvcesJMfhMExSl1vIGaoo2EgvTwwTpL1OkzaGAnkUGBDmMBT+f/+mz+H9KVsIyYbVMiRZYxp
	CNr4=
X-Received: by 2002:a05:6214:f2b:b0:6fb:1fc:7889 with SMTP id 6a1803df08f44-6fb47834635mr21887606d6.11.1749928956065;
        Sat, 14 Jun 2025 12:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9m0yqwjFjkxOlIpQA/8WuGepGH4pwHKnBlLHgfFDPcHqIZwsozxQ0flip+50/6sEjKMVZMQ==
X-Received: by 2002:a05:6214:f2b:b0:6fb:1fc:7889 with SMTP id 6a1803df08f44-6fb47834635mr21887436d6.11.1749928955637;
        Sat, 14 Jun 2025 12:22:35 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892ce00sm349525966b.143.2025.06.14.12.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:22:35 -0700 (PDT)
Message-ID: <9f12148b-6462-4ffa-b665-325571db78f0@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:22:33 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8976-longcheer-l9360: Add
 initial device tree
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu>
 <20250613-bqx5plus-v1-3-2bc2d43707a6@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250613-bqx5plus-v1-3-2bc2d43707a6@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2MiBTYWx0ZWRfX1xykZL75JT/6
 VXRWfKu+44um6TMhIKmcvl2jQksfrgG82Lu5i04DI7CW57Dbo2ef9wuv/N1Pcdv4WwLzPSzcjDp
 323heL8dfy1iqfLAh+4jw9dAyOIm0fkSB1cAK5gb281VGB69aDL6yYJ5bOYU0wvdnbn/DjQ37c3
 +YBowAWQQrzy2C6IhTGRPaHs59D32OtpKNSToffR6QRPKFx1QLtYU5GxcEAOxU9HQZ7uiv2GEFs
 JQUO1X1W4tg1E4HeBYnaYitR2IkgzQ2GU1hnsz8Gzw5/i2+yhpxfdncNeAdArux0XFQyeruegVe
 1aw+3ufzaMEnanHwYXJQn8OHAHc5KI/9l7JmhUe8AKVfGB0RLb/5bZAk/yXxYvnIAhLmGuNwXN5
 +K257aoXFWEIPVU7eDWB5EmMDg2OanG1S/+yBbrcbDPFjJYkwCb2+j6VWFufJepK6c+wCV0h
X-Authority-Analysis: v=2.4 cv=CqK/cm4D c=1 sm=1 tr=0 ts=684dcbfd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=HDjIzE35AAAA:8 a=FqsyDp_bju1yIiuMhToA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-ORIG-GUID: DQ2hpr3RzyrLPj7-HdnU9E2umXKchaVG
X-Proofpoint-GUID: DQ2hpr3RzyrLPj7-HdnU9E2umXKchaVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140162

On 6/13/25 12:37 AM, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> This dts adds support for BQ Aquaris X5 Plus (Longcheer L9360) released
> in 2016.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - NFC
> - SDHCI
> - Status LED
> - Touchscreen
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---

[...]

> +		/delete-node/ tz-apps@8dd00000;

please remove nodes through a &label reference only 

in this specific case, the address matches, so you may want
to simply override reg with the bigger size instead

[...]

> +
> +		rmi4-f01@1 {
> +			reg = <0x1>;
> +			syna,nosleep-mode = <1>; /* Allow sleeping */
> +		};
> +
> +		rmi4-f12@12 {
> +			reg = <0x12>;
> +			syna,sensor-type = <1>; /* Touchscreen */

Please remove these commends

[...]

> +		};
> +	};
> +};
> +
> +&blsp2_uart2 {
> +	status = "okay";
> +};
> +
> +&gcc {
> +	vdd_gfx-supply = <&pm8004_s5>;
> +};
> +
> +&pm8004_spmi_regulators {
> +	vdd_s2-supply = <&vph_pwr>;
> +	vdd_s5-supply = <&vph_pwr>;
> +
> +	/* Cluster 1 supply */
> +	pm8004_s2: s2 {
> +		/* regulator-min-microvolt = <500000>; */
> +		/* Set .95V to prevent unstabilities until CPR for this SoC is done */

That may take a while.. ;)

[...]

> +
> +	sdc2_default: sdc2-default-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +			drive-strength = <16>;
> +		};
> +		cmd-pins {
> +			pins = "sdc2_cmd";
> +			bias-pull-up;
> +			drive-strength = <10>;
> +		};
> +		data-pins {
> +			pins = "sdc2_data";
> +			bias-pull-up;
> +			drive-strength = <10>;
> +		};
> +	};
> +
> +	sdc2_sleep: sdc2-sleep-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +			drive-strength = <2>;
> +		};
> +		cmd-pins {
> +			pins = "sdc2_cmd";
> +			bias-pull-up;
> +			drive-strength = <2>;
> +		};
> +		data-pins {
> +			pins = "sdc2_data";
> +			bias-pull-up;
> +			drive-strength = <2>;
> +		};
> +	};

Please move these definitions into msm8976.dtsi

Konrad
