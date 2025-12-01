Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2276030BB95
	for <phone-devel@vger.kernel.org>; Mon,  1 Dec 2025 12:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592708; cv=none; b=TTrgoJkiWV6p1RgsIQEiOxEi+ACPZj/7jJlP3LKvTKYSJXUDIn3aytshOq5igAg+U5cyk+aKnB4vTOfBnkRK2yjLPkrkCJdkFJ4p11BQbP/t4yqtU6uMM8I/AGzcnsrqoH/R/4WI/Y2s7d8qgo6d1JYURPM7FAG7kfGykudi9IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592708; c=relaxed/simple;
	bh=KWOuLZ6hidwbE9TypQPKFmH8VsQsNVIc9SSYi6JlIQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YMxxViaXTfNNw2x0D9ltRGVxcFZOahSAPQIJj81un40dwiqlBRohGGHudHmP7sqDHztd1X61QBv2EaizihFgQFTqDU5cW1uoeS45LpgD4md/ZZvUi1jc3U/n96YZufJlSeUj2BlOPjTI2suva8hoTe/GEiwHc2HWCOrzMxbhr6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LO1J/y9M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvjXxDGE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LO1J/y9M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvjXxDGE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1CG9X7060555
	for <phone-devel@vger.kernel.org>; Mon, 1 Dec 2025 12:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vf/BxP0mgWbgh9NhPSJR1YuUPlhPxjgnkQcac/3egYk=; b=LO1J/y9MQGtuPti4
	6WXEBziCHwB+6CCAeVaL5jgKRLSwJRFPr5UbtivjyMvaYXhMhvLFDouzprkbT5HK
	OyfEB8fksExcRlJe2+NPaEDLLWbbqaggqhZv5p5ZxCqUYf31X0T1brA5AblmdSRA
	37A38/AB5FeehMc+fBg7g3IFYYimO+6RccEZLru/OTb05WX1kyRjqSTXTViGKhvy
	HU8ftrbVUr/bCrkzPj2ZctoCGT9mUY64IpgkALJQ/8mpAj4dPrWQKd3+df/gKoyT
	QIuyPucUgJfM3EPmX+gw8tbWoUZLrPnOnHlP+pROuARncw0AsGMqZl2IK+dUvYd0
	I05aAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asavh820b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 12:38:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edace8bc76so8236941cf.3
        for <phone-devel@vger.kernel.org>; Mon, 01 Dec 2025 04:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764592705; x=1765197505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vf/BxP0mgWbgh9NhPSJR1YuUPlhPxjgnkQcac/3egYk=;
        b=WvjXxDGEvZ7pLzP89pq7/ZPcPteFrAMFF6+f8UY9owthp+NazacGDcfYQAdFVEALu/
         SisAUGgJ2+tpCXIwDF10S5v8BwDKEclQn1Jqt1NikFU9YyVlZLVWTUvYYrPjM+UkeNo4
         M3wBxLn8W1vU3eaLevw30ruzrgPI92xvy/lHAPoeWhh8OT8CyXKfgwWSp/vY84Wc4drI
         rii1l6S1pXNcEm5+NnTWzjUKEK5D1D+aItreqWVff0JvXz71mvxRbnEJS6SY8oiXcw3B
         JkgBw2YpHmfWgMYfXnXGC7OAWsAzTc5XgWQuwxlg0w0OC3Zh++8DDA6vJM3OWs+9Zf6f
         fb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764592705; x=1765197505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vf/BxP0mgWbgh9NhPSJR1YuUPlhPxjgnkQcac/3egYk=;
        b=nw+KhcdIwFeCxRRclNYh4KVwH50DY404RgQzCPhl5jupj0dFuKXaiA3humGa7BUWZU
         UM0tdPUczKqhsXaRbmBBQwIVrD2tgpIkLc6/w9gc/RIJ2XJfZR+ciIZDhSEtW4CxM1ga
         7yGc+7N3HQKp8WHCD25PecNmk14ardfY0HdLCvDewYq/lFhwI5ewxi+edUdhdRYWVDxB
         chNQNo4aOxChUYH2nS9+g7Ozb7l16YL4ABOzAibBCXgcRUZ6+FQdNhrNKG9vEL/6u2+N
         nmB2bKcnzlfaZ/7qMVhw2q5t3xefzvfz6eYVx59DBLxUSxLmkpBGfB9iruHIN7MOOPjg
         4sGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+8mqQGN68E9Z8XmNDYaJ66lD5c8MeM2mUIAHKeuEaPJf43FJ8ZPtF2y4q3ZQ83ra204+GJr8jnUw/Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfHZlgo/iG8sqHUsCUCphfyGrXb3QQFtMJ07PkFOLN7KbZq8Vg
	vJUU4BdySy7jyVYhvzNUl1OjMfoXIum1c22KX5QXZ9BouQdZi+EyXJwh1biIZTPYrAtVM7jSqTl
	GkDr+JLy7J6FMi7WfqLvkelnLh5ngmhXIs1KJVvh4VtnQreUZvIra6gG/y25A6rqsJg==
X-Gm-Gg: ASbGncv3p1ed86U/36735t35VAXxBbVGnZVxIhqYrJg7R6G83Ustwzu5Sb95pWjD/+J
	SMuQ4RxuGOGRSNP5L1xxmwUsqJm/22YFld+V63crToRm6J8czoZyu/o6aBIdulbLTBmjYlo2hn+
	ptEvxX7a+lDiZHZosOZMH3Gs2Ngtr22tWYtgtpK5uLZrXonuOUAMB26qEEFX6/QhavyNuWvBh0S
	5IXvfwlVt0WqKWP+/Tt6MgWro1t+qCsvG8rmTBKBTfzx0cqYkiOYKRbNgIJi4BriFXUxSQNyvql
	aW4bTbpjii0aIAmQCZZIznsUoSaaYE8wi5dwSipRcZR7c2Ntaym65OV8t151c99Bx3v0POHIfVm
	yOUuQ60DD3sAITDXyLX0iCnNotnIhnp+mR5Zg7tDdnDRZDCsIYsiL4sv4lrssZYrLwxE=
X-Received: by 2002:a05:622a:1a97:b0:4ee:2408:4e36 with SMTP id d75a77b69052e-4ee5b5c972cmr438714631cf.2.1764592705141;
        Mon, 01 Dec 2025 04:38:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIktgyEHZW/1IMc0NJW4hRWI1Ul1vhVGeaHmxVXEPJ7nVkOnEm9iQUL8B66CQB9NZy4FuBZA==
X-Received: by 2002:a05:622a:1a97:b0:4ee:2408:4e36 with SMTP id d75a77b69052e-4ee5b5c972cmr438714241cf.2.1764592704693;
        Mon, 01 Dec 2025 04:38:24 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59aecbdsm1180313966b.38.2025.12.01.04.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:38:24 -0800 (PST)
Message-ID: <09e5d84c-39b7-45a9-b7d7-9beb54fb2f3f@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:38:21 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-10-a5a60500b267@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-judyln-dts-v4-10-a5a60500b267@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1xZa0exymr6xsVsTPpGcclFb1RPe5Nfx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfXwJh39NwrET08
 YzKNETbPx5bY6oQ/MMFEtxLfNCt8jS+dfrWngncoHlKKrD/EHl6nysy3l7GYGqdjeDcND+sSs53
 Vv/ZL4BXdbjTFAJM6+Ti2lhcXtHEt4uvIleemkdP1+umlh3jCB1EP/ZUR7ZeE0ryvIO2nsKm/6e
 7qy2VFUl/SDNIVqt0RMEPvrbqBBBofrhWSBNpZdpXgMJNqv0txyoNc9kdMRsgNMtdLAeYS4E0PG
 w5XQDw75PBlCWoLYLh3STXZyNJtXUu7vTwn5W0g+eag3EK3V9Vb7GaYQxdnTtsznKZq72WBerya
 ZMC+M+hbSPiaHvmJ20Ppluz3Q55YF8l+cT9ra9/A512CIQTkqh9+Vyv6kzffgleEPKxVoa8b86P
 N/tv7CrkfyqSWKNfK2GwYL+4NqI07Q==
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=692d8c42 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Gbw9aFdXAAAA:8 a=EiCcalQ1L6XHdR4pprMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 1xZa0exymr6xsVsTPpGcclFb1RPe5Nfx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010103

On 11/25/25 9:12 AM, Paul Sajna wrote:
> These regulators are required for the LCD
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index a61f7bd65a7a..3188334d269b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -56,10 +56,27 @@ zap-shader {
>  	};
>  };
>  
> +&ibb {
> +	regulator-min-microvolt = <4600000>;
> +	regulator-max-microvolt = <6000000>;

Sorry for not responding earlier, you can retrieve the actual volt
numbers from the hardware by reading

PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE = 0xdc41

ibb_uV = 1.4 + .1 * val

PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE = 0xde41

lab_uV = 4.6 + .1 * val

Konrad
