Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51D43AB291
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069607; cv=none; b=FqZ1K3BcY5JrY+c/MkeYMKwaAMX6a7rLG0W60wk8qUJ685qSVJ0mYivK84VWDq9LuqyQ3Q5y/yVtROcP8Xxe3xvQOAAGI7JmETjWNEQ/1ZDvkUFK4PPbeEGS8TUWAUrOhpXyH+OwjmkrEfItu785lVngWmJq/Lfkf0wWHfG+Ilo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069607; c=relaxed/simple;
	bh=DgO/mdro07DduzQOos3CDaqYUgHX8fPBAAE/vUl0MlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rpu9IVWWwJNMN9Jnn8AJbXfO5uyDUyUyt6Ge2cVyT4tv3axG4LwsCPKlASl6uJMq9RlxbytrsP0Zf/vIkx5xBlcaTjVPi6xvyLAaSU0HOdMPpz6X4ATDamA7YXMK1rLMQd+mak80Ho2/hTOimgCYE10/Vedot/6o4OZlD1nsqaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTctrGjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fo13N3h8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTctrGjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fo13N3h8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D4n0il3561249
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 08:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRQ70tLSeFnC8kKG47B5IGdVE2TW3i5jqUr0trh5zGg=; b=GTctrGjFdjF8mN2O
	1XfUBK1TXbJAlYrF9v/Wi2dZCHBl3GqGrQqdFrkcA2oCwGXVi4xGAn7dG49ElLYm
	r+n0MNjjl7nPRpxK54KmapYsgaOon938GPUBDWEmSJgTyXr1SIf+14afYQLn+5sp
	CzzAYw7sFBTS40wM9ej75XXJlxFK32VCiXaCxI1/BMYA9mJtaSeyQwDQ0Av9P+xj
	Z0qbKRH83Zx5Y83IOlH4me2jrNHvLbqk8uV091O4Fy5cxQtGLK7SnzwFAuiZICld
	TxDNpAMwnQnSuxaYeT1VxMsAI6vtw3KPi76NpXVweMKbb3WAygRL+Ywfj9VeJJYA
	EXtoEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0meeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 08:40:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8e141739794so9815585a.2
        for <phone-devel@vger.kernel.org>; Mon, 13 Apr 2026 01:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069605; x=1776674405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRQ70tLSeFnC8kKG47B5IGdVE2TW3i5jqUr0trh5zGg=;
        b=fo13N3h8/OwhleGFUNQ0kVYJxDfrgLEfwly7G+gp/rMkFJKRf/aFmE5I1IJu52qBI+
         MJNKwnHqMqlBP9s7mhXDH/dvSCZWkzkxurRqjuV3wowBNnWvVhnF4aYuz2RzQw05jpTF
         c96EpsT3UGLldeWndMyGqoSkaumf706TR1DL+WDsLX6jERWb1Waa4ItpYDaObIMc1XI4
         55d386zmjXzFQ7EtwUcXSSdp9eVY4RxRtbbN1FVfxc5PDoHJinyCAJhJjqawwpvkaJWh
         Gg+uX77RpDmVhXJmn82RKp6vj5tpp5qFQKJ+jVPQV7iS0GJo7mxUZMfLgToHbDVJh3Xa
         L2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069605; x=1776674405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRQ70tLSeFnC8kKG47B5IGdVE2TW3i5jqUr0trh5zGg=;
        b=XKY1wor2Tgw+ZsOTln+a5YVcIEPISOy/U5gjSLEPS7GLx/xcU/Px8mMCg5DWAIDf8S
         0WscwyTSt8Xb6B5A4lhKCtSnB85szQnqB2xycOndDT2Z5HlvzFjtoSYQFYO455kjVVrG
         cG4GuTN+31Iju0DABQ/0o1fD0dtrbb5xuXFjgo0tefG5JLxxxj6v075RW5ZBxF1ruZLI
         R5Yh2spH1ZV1EEikaCCAu7389UeuL5NUl8Sk2mwlIxDnkWZOXermoA1BOVjmBFOV8bcy
         gA/aGIEnx8GmciPm5ZXTtYoiCviXFHRen/mi503v1QYB83W5GPlZe4SPQFqw8o7UVA/u
         NLMg==
X-Forwarded-Encrypted: i=1; AFNElJ955KcdBJPa0yIJoQpenvCtlWdh7SAkk2Lqtn5UdbEPLnFvfFSSdC7jqvVsOZs0Epqjcjhh28OwCwmCkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTgO/CTKrqM+999oPAvgNc7Ovj4fEZJ+3bFjydKJ2kD5GJl0yb
	CT8NqsZgJRycOl5eC8QdTiaUyQLYws69oKGzp6lCq4gKLL2aEn4V8mpVn8tt5L4Hr8+0emFTb5T
	dOcLkuWD+PPvhldtrncAFYb2M9zivMtEHhLWljYNe2Ndc91JmEH3sp4zDNcjHVcdJRw==
X-Gm-Gg: AeBDieuySZcFWp0qO+ApQv4Kd7xqKsIOPjIM3adTVUQnrwSy5ld8cjppA71Plx1fwLm
	YT5mzanr335fU5XH/Qp3zuFYwraAG8zGua2Ri7JDMhOb8fa2P83SZB1kTQNA7b5bov96HrxAXK4
	Oah+nDcy7RNR7PukS4g17hm8xsdGw5+JAKoxbQm7jzJ77iFuQZIR6YOhcWlJKet3sQiAa28NNH2
	TgKV6UUXO0MoUhUyBaiEUfVKfl0O3RSDnauL0Hju19EbI10ZzQR126cIPY89cfOQ7a9FmdQ/t6C
	CKopoiuIpa17uXf3/fjR6BWGzygybWfafbrDdioNxo7jM0Q6LM4kHc1yjrpmzbHIrNLgct+VrYO
	Jeii9189sLSqsGoloyi5TAHAAN8UjBDLyxkq04F0Kc6jhI0xyzInKSm5yO6+41OpoLiyAM5p0IH
	LVKgc=
X-Received: by 2002:a05:620a:404a:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8ddebbddf54mr1196528685a.5.1776069605154;
        Mon, 13 Apr 2026 01:40:05 -0700 (PDT)
X-Received: by 2002:a05:620a:404a:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8ddebbddf54mr1196526485a.5.1776069604710;
        Mon, 13 Apr 2026 01:40:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671a5c6583bsm164932a12.31.2026.04.13.01.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:40:03 -0700 (PDT)
Message-ID: <786bd762-bb58-4ea6-9493-f89868ed80bb@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:40:00 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz>
 <20260412-pixel3-camera-v3-1-e26b090a6110@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260412-pixel3-camera-v3-1-e26b090a6110@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcabe6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ppaLKjd6v6Z26LEkUYwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MyBTYWx0ZWRfX9QH1ZKq3Wj4z
 hfP4xn4Qm9VwBIy67Y7RAtMLv0P10aIKw/vaNG/8pTP8AzVH9c1Uly2+dHm2i9S0tb/6eZCf5QW
 Qwjjh5g9fhT6BR+HOEPI85Z8xocwTpouXJxE3H+mJT+HWcGRqzyHGr4+Cn0G7lvuTzCmdxv/9SZ
 3TjuNmIiHfto1h9+JQRxzwogA2TWjlqNfJIeBUDxT5w04eIRNYKrAqsCC4aY95WL9+cyXarUhMg
 zT11+vQTG1ZqiWeqyzHcth9q1UJvDl/kLoPwh+Nc2mpzrLfmWXm3I9Ao43KDMrJ3tCDtdl6JmnH
 P/tGJ8B/UC4OUCpLtKoNQX9qHD9dTpfZu0SxTvKeaTWD1CFrYqq5ifdUNlEnc/tlx7oTbwInM8N
 8KTma44QvbZbNEyguElSzK2KGYTDbc0T+WTEu4X5VbJB0+A3rfc3nFxmLl4wUXaV12diL34XXCg
 +cJU5i6vK6jKlnNrxXw==
X-Proofpoint-ORIG-GUID: 5GC_jvhOjPOWXHcRjCXRx4ZWQ951sj76
X-Proofpoint-GUID: 5GC_jvhOjPOWXHcRjCXRx4ZWQ951sj76
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130083

On 4/12/26 6:35 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).

Fancy. Some Sony phone had a dual-focal-length lens on the back,
which IIUC involved some pretty heavy engineering


> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +			camss_endpoint1: endpoint {

\n before child nodes, please


> @@ -459,6 +618,38 @@ &tlmm {
>  	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
>  			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
>  
> +	cam_front_avdd_default_pin: cam-avdd-default-pins {

I believe this may fail dtbs check

> +		pins = "gpio8";
> +		function = "gpio";
> +
> +		bias-disable;
> +		drive-strength = <2>;

Please don't add \n between these properties and align them in common order
(i.e. pins/func/drive-strength/bias), matching the rest of the file

Konrad

